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
 * Created by lucode on 2017/2/22.
 */
@Controller
@RequestMapping("/Public")
public class Public_getBlogByTitleAction {
    private BlogService blogService;

    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }
    //返回 json
    @RequestMapping(value = "/getblogbytitle", method = RequestMethod.GET)
    public @ResponseBody Blog getblogbytitle(String title) throws Exception {
        // 处理中文转码问题
        title= new String(title.getBytes("iso8859-1"),"utf-8");
        Blog blog =blogService.getBlogByTitle(title);
        return blog;
    }

    // 返回关于我
    @RequestMapping(value = "/aboutme", method = RequestMethod.GET)
    public String aboutme(Model model) throws Exception {
        Blog blog =blogService.getBlogByTitle("关于我");
        model.addAttribute("blog",blog);
        return "/aboutme.jsp";
    }
}
