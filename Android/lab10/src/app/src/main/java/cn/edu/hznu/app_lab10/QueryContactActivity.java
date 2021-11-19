package cn.edu.hznu.app_lab10;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;

public class QueryContactActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_query_contact);

        Button btn = (Button) findViewById(R.id.query_contact_button_query);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                RadioButton nameRB = (RadioButton) findViewById(R.id.query_contact_radio_button_name);

                Uri uri;
                EditText editText = (EditText) findViewById(R.id.query_contact_edit_view_key);
                String key = editText.getText().toString();

                if (nameRB.isChecked()) {
                    uri = Uri.parse("content://cn.lllllan.android.app_lab09.provider/contact/name/" + key);
                } else {
                    uri = Uri.parse("content://cn.lllllan.android.app_lab09.provider/contact/mobile/" + key);
                }

                ArrayList<ContactItem> list = new ArrayList<>();
                Cursor cursor = getContentResolver().query(uri, null, null, null, null);

                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        @SuppressLint("Range") String name = cursor.getString(cursor.getColumnIndex("name"));
                        @SuppressLint("Range") String mobile = cursor.getString(cursor.getColumnIndex("mobile"));
                        list.add(new ContactItem(name, mobile));
                    }
                    cursor.close();
                }

                Intent intent = new Intent(QueryContactActivity.this, ContactsList.class);
                intent.putExtra("contacts", list);
                startActivity(intent);
            }
        });
    }
}