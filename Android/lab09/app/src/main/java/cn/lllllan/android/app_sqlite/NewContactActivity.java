package cn.lllllan.android.app_sqlite;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class NewContactActivity extends AppCompatActivity {

    private EditText nameEdit;
    private EditText telEdit;
    private Button addButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_new_contact);

        nameEdit = (EditText) findViewById(R.id.new_contact_edittext_name);
        telEdit = (EditText) findViewById(R.id.new_contact_edittext_tel);
        addButton = (Button) findViewById(R.id.new_contact_button_add);

        // 按钮点击事件，添加联系人到数据库
        addButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String name = nameEdit.getText().toString();
                String tel = telEdit.getText().toString();

                if (name.equals("") || tel.equals("")) {
                    Toast.makeText(NewContactActivity.this, "姓名或手机号不能为空！", Toast.LENGTH_SHORT).show();
                } else {
                    // 写入数据库

                }
            }
        });
    }
}