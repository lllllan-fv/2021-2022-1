package cn.lllllan.android.myapplication;

@SuppressWarnings({"all"})

public class Fruit {

    private int imageId;
    private String englishName;
    private String chineseName;

    public Fruit(int imageId, String englishName, String chineseName) {
        this.imageId = imageId;
        this.englishName = englishName;
        this.chineseName = chineseName;
    }

    public String getChineseName() {
        return chineseName;
    }

    public String getEnglishName() {
        return englishName;
    }

    public int getImageId() {
        return imageId;
    }
}
