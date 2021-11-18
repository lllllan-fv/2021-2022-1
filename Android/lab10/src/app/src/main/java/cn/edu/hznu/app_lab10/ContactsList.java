package cn.edu.hznu.app_lab10;

import android.os.Bundle;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

public class ContactsList extends AppCompatActivity {

    private ListView listView;
    private ContactAdapter contactAdapter;
    private List<ContactItem> contacts = new ArrayList<>();

    @Override

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contacts_list);

        
    }
}