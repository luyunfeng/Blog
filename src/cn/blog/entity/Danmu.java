package cn.blog.entity;

/**
 * Created by lucode on 2017/2/15.
 */
public class Danmu {
    private int id;
    private String user;
    private String content;
    private int time;// 1秒的十分之一为单位



    private int blog_id;
    private Blog blog; //关联属性

    public Danmu( String user, String content, int time,int blog_id) {
        this.user = user;
        this.content = content;
        this.time = time;
        this.blog_id=blog_id;
    }

    public Danmu( String user, String content,int blog_id) {
        this.user = user;
        this.content = content;
        this.blog_id=blog_id;
    }
    public Danmu(){}

    @Override
    public String toString() {
        return "Danmu{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", blog_id=" + blog_id +
                '}';
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }
}
