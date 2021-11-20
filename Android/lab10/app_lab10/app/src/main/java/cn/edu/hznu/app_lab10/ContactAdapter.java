package cn.edu.hznu.app_lab10;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.List;

public class ContactAdapter extends ArrayAdapter<ContactItem> {

    private int resourceId;

    public ContactAdapter(@NonNull Context context, int resource, @NonNull List<ContactItem> objects) {
        super(context, resource, objects);
        this.resourceId = resource;
    }

    @NonNull
    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        ContactItem contactItem = getItem(position);

        View view;
        ViewHolder viewHolder;

        if (convertView == null) {
            view = LayoutInflater.from(getContext()).inflate(resourceId, parent, false);
            TextView name = view.findViewById(R.id.contact_item_text_view_name);
            TextView mobile = view.findViewById(R.id.contact_item_text_view_mobile);
            viewHolder = new ViewHolder(name, mobile);
            view.setTag(viewHolder);
        } else {
            view = convertView;
            viewHolder = (ViewHolder) convertView.getTag();
        }

        viewHolder.name.setText(contactItem.getName());
        viewHolder.mobile.setText(contactItem.getMobile());

        return view;
    }

    class ViewHolder {
        TextView name;
        TextView mobile;

        public ViewHolder(TextView name, TextView mobile) {
            this.name = name;
            this.mobile = mobile;
        }
    }
}
