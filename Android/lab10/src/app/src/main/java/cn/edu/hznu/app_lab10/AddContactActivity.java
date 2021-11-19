package cn.edu.hznu.app_lab10;

import android.content.ContentValues;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class AddContactActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_contact);

        Button btn = (Button) findViewById(R.id.add_contact_button_add);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                EditText nameEt = (EditText) findViewById(R.id.add_contact_edit_view_name);
                EditText mobileET = (EditText) findViewById(R.id.add_contact_edit_view_mobile);

                String name = nameEt.getText().toString();
                String mobile = mobileET.getText().toString();

                if (name.equals("") || mobile.equals("")) {
                    Toast.makeText(AddContactActivity.this, "姓名或手机不能为空", Toast.LENGTH_SHORT).show();
                } else {
                    Uri uri = Uri.parse("content://cn.lllllan.android.app_lab09.provider/contact");
                    ContentValues values = new ContentValues();
                    values.put("name", name);
                    values.put("mobile", mobile);
                    Uri newUri = getContentResolver().insert(uri, values);
                    Toast.makeText(AddContactActivity.this, newUri.toString(), Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}