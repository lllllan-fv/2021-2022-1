package cn.lllllan.android.app_lab11.music;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.List;

import cn.lllllan.android.app_lab11.R;

public class MusicAdapter extends ArrayAdapter<MusicItem> {

    private int resourceId;

    public MusicAdapter(@NonNull Context context, int resource, @NonNull List<MusicItem> objects) {
        super(context, resource, objects);
        this.resourceId = resource;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        MusicItem item = getItem(position);

        View view;
        ViewHolder viewHolder;

        if (convertView == null) {
            view = LayoutInflater.from(getContext()).inflate(resourceId, parent, false);

            TextView id = view.findViewById(R.id.music_item_text_view_id);
            TextView title = view.findViewById(R.id.music_item_text_view_title);
            TextView artist = view.findViewById(R.id.music_item_text_view_artist);
            TextView duration = view.findViewById(R.id.music_item_text_view_duration);

            viewHolder = new ViewHolder(id, title, artist, duration);
            view.setTag(viewHolder);
        } else {
            view = convertView;
            viewHolder = (ViewHolder) convertView.getTag();
        }

        viewHolder.id.setText(item.getId());
        viewHolder.title.setText(item.getTitle());
        viewHolder.artist.setText(item.getArtist());
        viewHolder.duration.setText(item.getDuration());

        return view;
    }

    class ViewHolder {
        TextView id;
        TextView title;
        TextView artist;
        TextView duration;

        public ViewHolder(TextView id, TextView title, TextView artist, TextView duration) {
            this.id = id;
            this.title = title;
            this.artist = artist;
            this.duration = duration;
        }
    }
}
