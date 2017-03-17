package cn.blog.entity;

/**
 * Created by lucode on 2017/2/22.
 */
public class Friendlink {
    private int id;
    private String linkname;
    private String linkurl;
    private String mail;

    public Friendlink(String linkname, String linkurl, String mail) {
        this.linkname = linkname;
        this.linkurl = linkurl;
        this.mail = mail;
    }

    public Friendlink(){}

    @Override
    public String toString() {
        return "Friendlink{" +
                "id=" + id +
                ", linkname='" + linkname + '\'' +
                ", linkurl='" + linkurl + '\'' +
                ", mail='" + mail + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLinkname() {
        return linkname;
    }

    public void setLinkname(String linkname) {
        this.linkname = linkname;
    }

    public String getLinkurl() {
        return linkurl;
    }

    public void setLinkurl(String linkurl) {
        this.linkurl = linkurl;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }
}
