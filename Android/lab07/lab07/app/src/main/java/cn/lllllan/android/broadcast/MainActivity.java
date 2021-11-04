package cn.lllllan.android.broadcast;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class MainActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        loadData();

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

                    CheckBox checkBox = (CheckBox) findViewById(R.id.checkbox);
                    if (checkBox.isChecked()) saveData(account, pwd);


                    Intent intent = new Intent(MainActivity.this, BroadcastActivity.class);
                    startActivity(intent);
                    finish();
                } else {
                    Toast.makeText(MainActivity.this, "账号或密码错误", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    public void loadData() {
        try (
                FileInputStream in = openFileInput("data");
                BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        ) {

            EditText accountEdit = (EditText) findViewById(R.id.account);
            EditText pwdEdit = (EditText) findViewById(R.id.password);

            int cnt = 0;

            String line = "";
            while ((line = reader.readLine()) != null) {
                if ((cnt++) == 0) {
                    accountEdit.setText(line);
                } else {
                    pwdEdit.setText(line);
                }
            }


        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void saveData(String account, String pwd) {
        try (
                FileOutputStream out = openFileOutput("data", Context.MODE_PRIVATE);
                BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(out))
        ) {

            writer.write(account + "\n" + pwd);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}