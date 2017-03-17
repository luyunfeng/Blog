package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;


/**
 * Created by lucode on 2017/2/14.
 */

@Controller
@RequestMapping("/Home")
public class Home_getBlogByIdAction {
    private BlogService blogService;
    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }
    // 处理 /Home/getblogbyid.action 发来的请求
    @RequestMapping(value = "/getblogbyid", method = RequestMethod.GET)
    public  String  getblogbyid(int id, Model model) throws Exception {
        //得到Service层的Blog对象
        Blog blog =blogService.getBlogById(id);
        //将 blog 对象传到前端页面
        model.addAttribute("blog",blog);
        //将 tag  对象传到前端页面
        model.addAttribute("tags",blog.getTagList());
        // 跳转的目标页面
        return "/showblog.jsp";
    }

}
