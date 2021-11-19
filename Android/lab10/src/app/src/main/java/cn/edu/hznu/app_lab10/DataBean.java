package cn.edu.hznu.app_lab10;

import java.io.Serializable;
import java.util.ArrayList;

public class DataBean implements Serializable {
    private ArrayList<ContactItem> list;

    public DataBean(ArrayList<ContactItem> list) {
        this.list = list;
    }

    public ArrayList<ContactItem> getList() {
        return list;
    }

    public void setList(ArrayList<ContactItem> list) {
        this.list = list;
    }
}
