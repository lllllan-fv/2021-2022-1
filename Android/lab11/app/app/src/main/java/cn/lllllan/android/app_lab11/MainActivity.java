package cn.lllllan.android.app_lab11;

import android.Manifest;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.MediaStore;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.VideoView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import java.util.ArrayList;

import cn.lllllan.android.app_lab11.music.MusicAdapter;
import cn.lllllan.android.app_lab11.music.MusicItem;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private ListView listView;
    private MusicAdapter musicAdapter;
    private ArrayList<MusicItem> list = new ArrayList<>();

    private int current = 0;
    private VideoView videoView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        videoView = (VideoView) findViewById(R.id.main_video_view);

        Button btn = (Button) findViewById(R.id.main_button_pause);
        btn.setOnClickListener(this);
        btn = (Button) findViewById(R.id.main_button_play);
        btn.setOnClickListener(this);
        btn = (Button) findViewById(R.id.main_button_prev);
        btn.setOnClickListener(this);
        btn = (Button) findViewById(R.id.main_button_next);
        btn.setOnClickListener(this);
        btn = (Button) findViewById(R.id.main_button_stop);
        btn.setOnClickListener(this);

        if (ContextCompat.checkSelfPermission(MainActivity.this, Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(MainActivity.this, new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 1);
        } else {
            init();
        }

        musicAdapter = new MusicAdapter(MainActivity.this, R.layout.music_item, this.list);
        listView = (ListView) findViewById(R.id.main_list_view);
        listView.setAdapter(musicAdapter);

        TextView show = (TextView) findViewById(R.id.main_text_view_music_data);
        show.setText(list.get(0).getTitle());

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                current = i;
                videoView.setVideoPath(list.get(current).getPath());
                show.setText(list.get(i).getTitle());
                videoPlay();
            }
        });
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        switch (requestCode) {
            case 1:
                if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    init();
                } else {
                    Toast.makeText(this, "拒绝权限将无法使用程序", Toast.LENGTH_SHORT).show();
                    finish();
                }
                break;
            default:
        }
    }

    private void init() {
        Cursor cursor = getContentResolver().query(MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
                null, null, null, MediaStore.Audio.Media.DEFAULT_SORT_ORDER);

        int id = 0;
        while (cursor.moveToNext()) {
            String path = cursor.getString(cursor.getColumnIndexOrThrow(MediaStore.Video.Media.DATA));
            if (path.contains("com.netease.cloudmusic/music/")) {
                String title = cursor.getString(cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE));
                String artist = cursor.getString(cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST));
                int duration = cursor.getInt(cursor.getColumnIndexOrThrow(MediaStore.Audio.Media.DURATION));
                list.add(new MusicItem(String.valueOf(++id), title, artist, getLength(duration), path));
            }
        }

        videoView.setVideoPath(list.get(current).getPath()); // 指定视频文件的路径
    }

    String getLength(int ms) {
        return String.format("%02d:%02d", ms / 1000 / 60, ms / 1000 % 60);
    }

    private void videoPlay() {
        if (!videoView.isPlaying()) {
            videoView.start(); // 开始播放
        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.main_button_play:
                videoPlay();
                break;
            case R.id.main_button_pause:
            case R.id.main_button_stop:
                if (videoView.isPlaying()) {
                    videoView.pause(); // 暂停播放
                }
                break;
            case R.id.main_button_prev:
                if (current > 0) {
                    videoView.setVideoPath(list.get(--current).getPath());
                    videoPlay();
                }
                break;
            case R.id.main_button_next:
                if (current < list.size() - 1) {
                    videoView.setVideoPath(list.get(++current).getPath());
                    videoPlay();
                }
                break;
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (videoView != null) {
            videoView.suspend();
        }
    }
}