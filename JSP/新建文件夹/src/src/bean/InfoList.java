package bean;

import java.util.List;

public class InfoList {
    private List<Info> infoList;

    public InfoList(List<Info> infoList) {
        this.infoList = infoList;
    }

    public List<Info> getInfoList() {
        return infoList;
    }

    public void setInfoList(List<Info> infoList) {
        this.infoList = infoList;
    }
}
