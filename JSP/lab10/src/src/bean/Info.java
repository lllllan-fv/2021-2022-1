package bean;

public class Info {
    private int id;
    private String name;
    private int age;
    private String sex;
    private String education;
    private String hobby;
    private String introduction;

    public Info(int id, String name, int age, String sex, String education, String hobby, String introduction) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.sex = sex;
        this.education = education;
        this.hobby = hobby;
        this.introduction = introduction;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}
