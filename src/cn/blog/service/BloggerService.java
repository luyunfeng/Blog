package cn.blog.service;

import cn.blog.dao.BlogDao;
import cn.blog.dao.BloggerDao;
import cn.blog.entity.Blog;
import cn.blog.entity.Blogger;
import cn.blog.entity.Tag;
import cn.blog.util.BloggerClassUtil;

/**
 * Created by lucode on 2017/2/11.
 */
public class BloggerService {
    private BloggerDao bloggerDao;
    public void setBloggerDao(BloggerDao bloggerDao) {
        this.bloggerDao=bloggerDao;
    }

    public void updateBlogger(Blogger blogger) throws Exception{
        blogger.setId(1);
        //如果 某个属性为空字符串  设置为null
        // 将 图片的url 提取出来
        blogger=BloggerClassUtil.bloggerClassUtil(blogger);
        //数据传到dao层
        bloggerDao.updateBlogger(blogger);

        //打印此时的信息
        //System.out.println("Service层："+blogger.toString());
    }

    public Blogger getBlogger() throws Exception{
        return  bloggerDao.getBlogger();
    }
}
