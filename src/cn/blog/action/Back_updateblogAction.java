package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.entity.Danmu;
import cn.blog.service.BlogService;
import cn.blog.service.DanmuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lucode on 2017/2/14.
 */
@Controller
@RequestMapping("/Back")
public class Back_updateblogAction {

    private BlogService blogService;
    private DanmuService danmuService;

    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    @Resource(name = "DanmuServiceID")
    public void setDanmuService(DanmuService danmuService) {
        this.danmuService = danmuService;
    }

    @RequestMapping(value = "/updateblog", method = RequestMethod.POST)
    public String updateblog(Blog blog, String tags, Model model) throws Exception {
        //把 编辑后的博客写入 保存好
        blogService.addBlog(blog, tags);
        //System.out.println("addblog action层" + blog.toString() + tags);
        model.addAttribute("message", "更改成功");
        return "/Back/bloglist.jsp";
    }
}
