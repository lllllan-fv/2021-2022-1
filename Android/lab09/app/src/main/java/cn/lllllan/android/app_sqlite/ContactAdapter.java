package cn.lllllan.android.app_sqlite;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.CheckBox;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.List;

public class ContactAdapter extends ArrayAdapter<Contact> {

    private int resourceId;

    public ContactAdapter(@NonNull Context context, int resource, @NonNull List<Contact> objects) {
        super(context, resource, objects);
        this.resourceId = resource;
    }

    @Override
    public View getView(int position, @Nullable View convertView, @NonNull ViewGroup parent) {
        Contact contact = getItem(position);

        View view;
        ViewHolder viewHolder;

        if (convertView == null) {
            view = LayoutInflater.from(getContext()).inflate(resourceId, parent, false);
            viewHolder = new ViewHolder(view.findViewById(R.id.contact_checkbox), view.findViewById(R.id.contact_textview_name), view.findViewById(R.id.contact_textview_tel));
            view.setTag(viewHolder);
        } else {
            view = convertView;
            viewHolder = (ViewHolder) view.getTag();
        }

        viewHolder.checkBox.setChecked(contact.isCheck());
        viewHolder.nameText.setText(contact.getName());
        viewHolder.telText.setText(contact.getTel());

        return view;
    }

    class ViewHolder {
        CheckBox checkBox;
        TextView nameText;
        TextView telText;

        public ViewHolder(CheckBox checkBox, TextView nameText, TextView telText) {
            this.checkBox = checkBox;
            this.nameText = nameText;
            this.telText = telText;
        }
    }
}
