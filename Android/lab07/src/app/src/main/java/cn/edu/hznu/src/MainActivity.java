package cn.edu.hznu.src;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btn = findViewById(R.id.button_login);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                EditText idET = findViewById(R.id.edit_text_id);
                EditText pwdET = findViewById(R.id.edit_text_pwd);

                String id = idET.getText().toString();
                String pwd = pwdET.getText().toString();

                if (id.equals("")) {
                    Toast.makeText(MainActivity.this, "账号不能为空", Toast.LENGTH_SHORT).show();
                } else if (pwd.equals("")) {
                    Toast.makeText(MainActivity.this, "密码不能为空", Toast.LENGTH_SHORT).show();
                } else if (id.equals("admin") && pwd.equals("123456")) {
                    Intent intent = new Intent(MainActivity.this, ForceActivity.class);
                    startActivity(intent);
                } else {
                    Toast.makeText(MainActivity.this, "账号或密码错误", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}