package cn.blog.entity;

import java.util.List;

/**
 * Created by lucode on 2017/2/10.
 */
public class Tag {
    private int id;
    private String  tagName;
    private int blog_id;
    private List<Blog> blogList;//关联属性

    public Tag(int id, String tagName, int blog_id) {
        this.id = id;
        this.tagName = tagName;
        this.blog_id = blog_id;
    }
    public Tag(String tagName, List<Blog> blogs) {

        this.tagName = tagName;
        this.blogList=blogs;
    }


    public Tag(){}
    public Tag(String tagName) {
        this.tagName = tagName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTagName() {
        return tagName;
    }

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public List<Blog> getBlogList() {
        return blogList;
    }

    public void setBlogList(List<Blog> blogList) {
        this.blogList = blogList;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "id=" + id +
                ", tagName='" + tagName + '\'' +
                ", blog_id=" + blog_id +
                '}'+"\n";
    }
}
