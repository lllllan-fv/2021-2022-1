package cn.edu.hznu.app_lab10;

import java.io.Serializable;

public class ContactItem implements Serializable {
    private String name;
    private String mobile;

    public ContactItem(String name, String mobile) {
        this.name = name;
        this.mobile = mobile;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
