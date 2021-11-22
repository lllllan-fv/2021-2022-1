package db;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

public class FileDAO {

    public int insert(String filename, String path) {
        Calendar cal = Calendar.getInstance();

        String date = String.format("%4d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
        String time = String.format("%2d:%02d:%02d", cal.get(Calendar.HOUR_OF_DAY), cal.get(Calendar.MINUTE), cal.get(Calendar.SECOND));

        DBConnection dbCon = new DBConnection();
        dbCon.createConnection();

        String sql = "insert into lab11 values(null, '" + filename + "','" + path + "','" + date + "','" + time + "')";
        int i = dbCon.update(sql);

        return i;
    }

    public ArrayList<Map<String, String>> queryAll() {
        DBConnection dbCon = new DBConnection();
        dbCon.createConnection();
        String sql = "select * from lab11";
        ArrayList<Map<String, String>> list = dbCon.queryForList(sql);
        return list;
    }
}
