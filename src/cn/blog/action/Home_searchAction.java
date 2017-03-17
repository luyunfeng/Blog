package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lucode on 2017/2/28.
 */
@Controller
@RequestMapping("/Home")
public class Home_searchAction {
    private BlogService blogService;

    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    @RequestMapping(value = "/search")
    public String search(String keyword, Model model) throws Exception {
        keyword= new String(keyword.getBytes("iso8859-1"),"utf-8");
        List<Blog> blogs = blogService.getBlogByKeyWord(keyword);
        if (blogs == null) {
            // 没有找到 返回空
            model.addAttribute("message", "没找到,换一个关键字吧~~~");

        } else {
            model.addAttribute("blogs", blogs);
        }
        // 回显关键字
        model.addAttribute("keyword", keyword);
        return "/searchresult.jsp";

    }

}
