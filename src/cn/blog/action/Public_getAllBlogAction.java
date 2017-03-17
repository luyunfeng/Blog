package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lucode on 2017/2/13.
 */
@Controller
@RequestMapping("/Public")
public class Public_getAllBlogAction {
    private BlogService blogService;
    // 访问 路径    /Public/getallblog.action
    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }
    //异步方式得到 数据
    @RequestMapping(value = "/getallblog")
    public  @ResponseBody List<Blog> getallblog() throws Exception {
            //得到Service层的Blog对象
           //将 list转成json文本
            return blogService.getAllBlog();
    }
}
