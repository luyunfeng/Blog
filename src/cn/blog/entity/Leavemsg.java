package cn.blog.entity;

/**
 * Created by lucode on 2017/2/20.
 */
public class Leavemsg {
    private int id;
    private String user;
    private String mail;
    private String content;
    private String date;


    public Leavemsg() {
    }

    public Leavemsg(String user, String mail, String content, String date) {

        this.user = user;
        this.mail = mail;
        this.content = content;
        this.date = date;
    }
    public Leavemsg(String user, String mail, String content) {

        this.user = user;
        this.mail = mail;
        this.content = content;
    }

    @Override
    public String toString() {
        return "Leavemsg{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", mail='" + mail + '\'' +
                ", content='" + content + '\'' +
                ", date='" + date + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
