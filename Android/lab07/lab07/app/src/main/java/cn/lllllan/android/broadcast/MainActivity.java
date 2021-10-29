package cn.lllllan.android.broadcast;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        EditText accountEdit = (EditText) findViewById(R.id.account);
        EditText pwdEdit = (EditText) findViewById(R.id.password);
        Button loginBtn = (Button) findViewById(R.id.login);

        loginBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String account = accountEdit.getText().toString();
                String pwd = pwdEdit.getText().toString();

                if (account.equals("")) {
                    Toast.makeText(MainActivity.this, "账号不能为空", Toast.LENGTH_SHORT).show();
                } else if (pwd.equals("")) {
                    Toast.makeText(MainActivity.this, "密码不能为空", Toast.LENGTH_SHORT).show();
                } else if (account.equals("admin") && pwd.equals("123456")) {
                    Intent intent = new Intent(MainActivity.this, BroadcastActivity.class);
                    startActivity(intent);
                    finish();
                } else {
                    Toast.makeText(MainActivity.this, "账号或密码错误", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}