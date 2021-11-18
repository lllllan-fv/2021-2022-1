package cn.lllllan.android.app_lab09;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private ListView listView;
    private List<Contact> contacts;
    private ContactAdapter contactAdapter;

    private MyDatabaseHelper dbHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        contacts = new ArrayList<>();
        contactAdapter = new ContactAdapter(MainActivity.this, R.layout.contact, contacts);
        listView = findViewById(R.id.main_listview);
        listView.setAdapter(contactAdapter);

        dbHelper = new MyDatabaseHelper(this, "contactStore.db", null, 1);
        loadContacts();

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Contact contact = contacts.get(i);

                Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + contact.getTel()));
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
            }
        });
    }

    @Override
    protected void onResume() {
        super.onResume();
        loadContacts();
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
                Intent intent = new Intent(MainActivity.this, NewContactActivity.class);
                startActivity(intent);
                break;
            case R.id.menu_item_del:
                delContact();
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    public void loadContacts() {
        contacts.clear();

        SQLiteDatabase db = dbHelper.getWritableDatabase();
        Cursor cursor = db.query("contact", null, null, null, null, null, null);
        if (cursor.moveToFirst()) {
            do {
                @SuppressLint("Range") String name = cursor.getString(cursor.getColumnIndex("name"));
                @SuppressLint("Range") String tel = cursor.getString(cursor.getColumnIndex("mobile"));

                contacts.add(new Contact(false, name, tel));
            } while (cursor.moveToNext());
        }

        contactAdapter.notifyDataSetChanged();
    }

    public void addContact(String name, String tel) {
        Contact contact = new Contact(false, name, tel);
        contacts.add(contact);
        contactAdapter.notifyDataSetChanged();
    }

    public void delContact() {
        SQLiteDatabase db = dbHelper.getWritableDatabase();
        for (Contact contact : contacts) {
            if (contact.isCheck()) {
                db.delete("contact", "name=? and mobile=?", new String[]{contact.getName(), contact.getTel()});
            }
        }

        loadContacts();
    }
}