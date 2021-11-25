package cn.lllllan.android.app_lab11;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;

import cn.lllllan.android.app_lab11.music.MusicAdapter;
import cn.lllllan.android.app_lab11.music.MusicItem;

public class MainActivity extends AppCompatActivity {

    private ListView listView;
    private MusicAdapter musicAdapter;
    private ArrayList<MusicItem> list;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        list = new ArrayList<>();
        listInit();

        musicAdapter = new MusicAdapter(MainActivity.this, R.layout.music_item, this.list);
        listView = (ListView) findViewById(R.id.main_list_view);
        listView.setAdapter(musicAdapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                MusicItem item = list.get(i);
                Toast.makeText(MainActivity.this, item.getTitle(), Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void listInit() {
        list.add(new MusicItem("1", "爱情陷阱", "谭咏麟", "4:03"));
    }
}