package cn.edu.hznu.app_lab10;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;

public class ContactsList extends AppCompatActivity {

    private ListView listView;
    private ContactAdapter contactAdapter;
    private ArrayList<ContactItem> contacts;

    @Override

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contacts_list);

        Intent intent = getIntent();
        contacts = (ArrayList<ContactItem>) intent.getSerializableExtra("contacts");

        contactAdapter = new ContactAdapter(ContactsList.this, R.layout.contact_item, this.contacts);
        listView = (ListView) findViewById(R.id.contacts_list_list_view);
        listView.setAdapter(contactAdapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                ContactItem contactItem = ContactsList.this.contacts.get(i);
            }
        });
    }
}