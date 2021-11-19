package cn.lllllan.android.app_lab09;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.util.Log;

public class MyContentProvider extends ContentProvider {

    public static final int CONTACT_DIR = 0;
    public static final int CONTACT_MOBILE = 1;
    public static final int CONTACT_NAME = 2;

    public static final String AUTHORITY = "cn.lllllan.android.app_lab09.provider";

    private static UriMatcher uriMatcher;

    private MyDatabaseHelper myDatabaseHelper;

    static {
        uriMatcher = new UriMatcher(UriMatcher.NO_MATCH);

        uriMatcher.addURI(AUTHORITY, "contact", CONTACT_DIR);
        uriMatcher.addURI(AUTHORITY, "contact/mobile/*", CONTACT_MOBILE);
        uriMatcher.addURI(AUTHORITY, "contact/name/*", CONTACT_NAME);
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
            case CONTACT_MOBILE:
                return "vnd.android.cursor.mobile/vnd.cn.lllllan.android.app_lab09.provider.contact";
            case CONTACT_NAME:
                return "vnd.android.cursor.name/vnd.cn.lllllan.android.app_lab09.provider.contact";
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
            case CONTACT_MOBILE:
                String contactMobile = "%" + uri.getPathSegments().get(2) + "%";
                Log.d("QueryMobile", contactMobile);
                cursor = db.query("contact", projection, "mobile like ?", new String[]{contactMobile}, null, null, sortOrder);
                break;
            case CONTACT_NAME:
                String contactName = "%" + uri.getPathSegments().get(2) + "%";
                Log.d("QueryName", contactName);
                cursor = db.query("contact", projection, "name like ?", new String[]{contactName}, null, null, sortOrder);
                break;
        }

        return cursor;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
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
    public int update(Uri uri, ContentValues values, String selection,
                      String[] selectionArgs) {
        return 0;
    }
}