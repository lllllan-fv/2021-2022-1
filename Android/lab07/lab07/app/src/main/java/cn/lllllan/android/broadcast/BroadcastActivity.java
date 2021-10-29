package cn.lllllan.android.broadcast;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class BroadcastActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_broadcast);

        Button btn = (Button) findViewById(R.id.force_offline);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(BaseActivity.FORCE_OFFLINE);
                sendBroadcast(intent);
            }
        });
    }
}