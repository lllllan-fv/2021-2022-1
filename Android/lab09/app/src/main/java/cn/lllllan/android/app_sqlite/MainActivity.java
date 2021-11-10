package cn.lllllan.android.app_sqlite;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ListView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    private ListView listView;
    private List<Contact> contacts;
    private ContactAdapter contactAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        contacts = new ArrayList<>();
        contactAdapter = new ContactAdapter(MainActivity.this, R.layout.contact, contacts);
        listView = findViewById(R.id.main_listview);
        listView.setAdapter(contactAdapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Contact contact = contacts.get(i);

                Toast.makeText(MainActivity.this, "click", Toast.LENGTH_SHORT).show();

                CheckBox checkBox = (CheckBox) view.findViewById(R.id.contact_checkbox);
                checkBox.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                    @Override
                    public void onCheckedChanged(CompoundButton compoundButton, boolean isChecked) {
                        contact.setCheck(isChecked);
                        Toast.makeText(MainActivity.this, "check", Toast.LENGTH_SHORT).show();
                    }
                });
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()) {
            case R.id.menu_item_add:
                // 跳转到添加联系人页面。
                addContact();
//                Intent intent = new Intent(MainActivity.this, NewContactActivity.class);
//                startActivity(intent);
                break;
            case R.id.menu_item_del:
                delContact();
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    public void addContact() {
        Contact contact = new Contact(false, "张三", "10086");
        contacts.add(contact);
        contactAdapter.notifyDataSetChanged();
    }

    public void delContact() {
        List<Contact> tmp = new ArrayList<>();
        for (Contact contact : contacts) {
            if (contact.isCheck()) tmp.add(contact);
        }

        String info = String.valueOf(tmp.size());
        Toast.makeText(MainActivity.this, info, Toast.LENGTH_SHORT).show();

        for (Contact contact : tmp) {
            contacts.remove(contact);
        }
        tmp.clear();
        contactAdapter.notifyDataSetChanged();
    }
}