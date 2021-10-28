package cn.edu.hznu.src;

import android.app.AlertDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class ForceActivity extends AppCompatActivity {


    class ForceReceiver extends BroadcastReceiver {

        @Override
        public void onReceive(Context context, Intent intent) {
            AlertDialog.Builder builder = new AlertDialog.Builder(context);
            builder.setTitle("Warning");
            builder.setMessage("你已被强制下线，请重新登录");
            builder.setCancelable(false);
            builder.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    ForceActivity.this.finish();
//                    Intent intent = new Intent(ForceActivity.this, MainActivity.class);
//                    startActivity(intent);
                }
            });
            builder.show();
        }
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_force);

        Button btn = findViewById(R.id.button_force);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent("cn.edu.hznu.src.FORCE_BROADCAST");
                sendBroadcast(intent);
            }
        });
    }

    protected void onResume() {
        super.onResume();
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("cn.edu.hznu.src.FORCE_BROADCAST");
        BroadcastReceiver br = new ForceReceiver();
        registerReceiver(br, intentFilter);
    }
}