package cn.edu.hznu.app_lab10;

import android.annotation.SuppressLint;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button queryBtn = (Button) findViewById(R.id.main_button_query);
        queryBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Uri uri = Uri.parse("content://cn.lllllan.android.app_lab09.provider/contact");
                Cursor cursor = getContentResolver().query(uri, null, null, null, null);

                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        @SuppressLint("Range") String name = cursor.getString(cursor.getColumnIndex("name"));
                        @SuppressLint("Range") String mobile = cursor.getString(cursor.getColumnIndex("mobile"));
                    }
                    cursor.close();
                }
            }
        });

        Button addBtn = (Button) findViewById(R.id.main_button_add);

    }
}