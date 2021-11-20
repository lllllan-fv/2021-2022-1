package cn.lllllan.android.app_lab09;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;

public class MyContentProvider extends ContentProvider {

    public static final int CONTACT_DIR = 0;

    public static final String AUTHORITY = "cn.lllllan.android.app_lab09.provider";

    private static UriMatcher uriMatcher;

    private MyDatabaseHelper myDatabaseHelper;

    static {
        uriMatcher = new UriMatcher(UriMatcher.NO_MATCH);
        uriMatcher.addURI(AUTHORITY, "contact", CONTACT_DIR);
    }

    @Override
    public boolean onCreate() {
        myDatabaseHelper = new MyDatabaseHelper(getContext(), "contactStore.db", null, 1);
        return true;
    }

    @Override
    public String getType(Uri uri) {
        switch (uriMatcher.match(uri)) {
            case CONTACT_DIR:
                return "vnd.android.cursor.dir/vnd.cn.lllllan.android.app_lab09.provider.contact";
        }
        return null;
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs, String sortOrder) {
        SQLiteDatabase db = myDatabaseHelper.getReadableDatabase();
        Cursor cursor = null;

        switch (uriMatcher.match(uri)) {
            case CONTACT_DIR:
                cursor = db.query("contact", projection, selection, selectionArgs, null, null, sortOrder);
                break;
        }

        return cursor;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        SQLiteDatabase db = myDatabaseHelper.getWritableDatabase();
        Uri uriReturn = null;

        switch (uriMatcher.match(uri)) {
            case CONTACT_DIR:
                long contact = db.insert("contact", null, values);
                uriReturn = Uri.parse("content://" + AUTHORITY + "/contact/" + contact);
                break;
        }

        return uriReturn;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection,
                      String[] selectionArgs) {
        return 0;
    }
}