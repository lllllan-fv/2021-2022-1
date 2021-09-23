package cn.edu.hznu.labactivitydatatransfer;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class ResultActivity extends AppCompatActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        TextView name = (TextView) findViewById(R.id.name);
        TextView passwd = (TextView) findViewById(R.id.passwd);
        TextView gender = (TextView) findViewById(R.id.gender);

        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();
        name.setText(bundle.getString("name"));
        passwd.setText(bundle.getString("passwd"));
        gender.setText(bundle.getString("gender"));
    }
}
