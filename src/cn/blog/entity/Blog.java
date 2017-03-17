package cn.blog.entity;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lucode on 2017/2/9.
 */
public class Blog {
    private int id;
    private String title;
    private String releaseDate;
    private String content;
    private List<Tag> TagList = new ArrayList();//关联属性

    public Blog( String title, String releaseDate, String content) {
        this.title = title;
        this.releaseDate = releaseDate;
        this.content = content;
    }
    /* 需要一个空构造器,我也不知为什么！！！
       不然Action层 无法初始化这个实体类

    */
    public Blog() {}
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<Tag> getTagList() {
        return TagList;
    }

    public void setTagList(List<Tag> tagList) {
        TagList = tagList;
    }
    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", releaseDate='" + releaseDate + '\'' +
                ", \nTag='" + TagList.toString() + '\'' +
                '}';
    }

}
