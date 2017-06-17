package cn.blog.service;

import cn.blog.dao.BlogDao;
import cn.blog.entity.Blog;
import cn.blog.entity.Tag;
import cn.blog.util.GetDateUtil;
import cn.blog.util.GetTagArrUtil;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;


/**
 * Created by lucode on 2017/2/9.
 */
public class BlogService {
    private BlogDao blogDao;

    public void setBlogDao(BlogDao blogDao) {
        this.blogDao = blogDao;
    }

    /**
     * 得到action层传来的 博客实体和 标签（没有拆分的  在业务层完成拆分）
     */
    public void addBlog(Blog blog, String tags) throws Exception {
        //得到当前时间
        blog.setReleaseDate(GetDateUtil.getData());

        //将 tag拆分开
        ArrayList<Tag> tagArr = GetTagArrUtil.getTagArr(tags);
        //数据传到dao层
        blogDao.addBlog(blog, tagArr);
        //打印此时的信息
        //System.out.println("Service层："+blog.toString());
    }

    /**
     * 得到dao层传来的 博客实体(标签也包含)
     */
    public List<Blog> getAllBlog() throws Exception {
        return blogDao.getAllBlog();
    }

    /**
     * 博客id 去删除文章
     */
    public void deleteBlog(int blogid) throws Exception {
        blogDao.deleteBlog(blogid);
    }

    // 根据 id 查询博客
    public Blog getBlogById(int blogid) {
        return blogDao.getBlogById(blogid);
    }

    public Blog getBlogByTitle(String title) {
        return blogDao.getBlogByTitle(title);
    }


    /*
       返回所有不重复的标签并携带相关的的博客数据
       对标签相关的博客文章数量进行排序,多的为热门标签
       默认在列表中显示 越热门排在前面
    */
    public List<Tag> getAllTag() {
        BlogDao blogDao=new BlogDao();
        List<Tag> tags = blogDao.getAllTag();
        for (int i = 0; i < tags.size(); i++) {
            // 得到一个博客的数量 设置为最大
            int max = tags.get(i).getBlogList().size();
            for (int j = i + 1; j < tags.size(); j++) {
                int t = tags.get(j).getBlogList().size();
                // 如果找到更大的 交换 两个的位置
                if (max < t) {
                    Tag tag=tags.get(i);
                    tags.set(i,tags.get(j));
                    tags.set(j,tag);
                    // 重置最大值
                    max = t;
                }
            }
        }
        return tags;
    }

    //根据 标签名字 查找相关的博客
    public List<Blog> getBlogByTagName(String tagName) {
        return blogDao.getBlogByTagName(tagName);
    }


    // 关键字搜索功能
    public List<Blog> getBlogByKeyWord(String keyword){

        return blogDao.getBlogByKeyWord(keyword);
    }

    // 热门标签排序
    @Test
    public void test(){
        BlogService blogService=new BlogService();
        List<Tag> tags=blogService.getAllTag();
        for (Tag tag: tags) {
            System.out.println(tag.getTagName()+" "+tag.getBlogList().size());
        }

    }

}
