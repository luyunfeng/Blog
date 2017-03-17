package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;

/**
 * Created by lucode on 2017/2/9.
 */
@Controller
@RequestMapping("/Back")
public class Back_addBlogAction {
    private BlogService blogService;
    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }
     //处理 /Back/addblog.action 这个表单传来的post
    @RequestMapping(value = "/addblog")
    public String addblog(Blog blog,String tags,Model model) throws Exception {
        /*得到表单传来的数据
          封装Blog这个实体类传给service层
          tags 这个还是一条字符串,在 service 进行拆分处理,然后进行封装
        */
        blogService.addBlog(blog,tags);
        //  在/Back/addblog.jsp这个页面显示数据
        model.addAttribute("message","成功写入数据库");
        //转到 下面这个页面
        return "/Back/addblog.jsp";
    }
}

