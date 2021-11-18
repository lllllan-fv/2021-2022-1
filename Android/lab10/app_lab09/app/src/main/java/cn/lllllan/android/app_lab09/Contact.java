package cn.lllllan.android.app_lab09;

public class Contact {
    private boolean check;
    private String name;
    private String tel;

    public Contact(boolean check, String name, String tel) {
        this.check = check;
        this.name = name;
        this.tel = tel;
    }

    public boolean isCheck() {
        return check;
    }

    public void setCheck(boolean check) {
        this.check = check;
    }

    public String getName() {
        return name;
    }

    public String getTel() {
        return tel;
    }
}
