package cn.lllllan.android.app_lab11.music;

public class MusicItem {
    private String id;
    private String title;
    private String artist;
    private String duration;
    private String path;

    public MusicItem(String id, String title, String artist, String duration, String path) {
        this.id = id;
        this.title = title;
        this.artist = artist;
        this.duration = duration;
        this.path = path;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
