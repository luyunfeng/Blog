package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lucode on 2017/2/27.
 */
@Controller
@RequestMapping("/Home")
public class Home_getBlogByTagNameAction {
    private BlogService blogService;

    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    @RequestMapping(value = "/getblogbytagname", method = RequestMethod.GET)
    public  String  getBlogByTagName(String tagname, Model model) throws Exception {
        // 转码
        tagname= new String(tagname.getBytes("iso8859-1"),"utf-8");
        List<Blog> blogs =blogService.getBlogByTagName(tagname);

        // 将与标签相关的博客和标签名字传到页面
        model.addAttribute("tagname",tagname);
        model.addAttribute("blogs",blogs);

        return "/tagblog.jsp";
    }

}
