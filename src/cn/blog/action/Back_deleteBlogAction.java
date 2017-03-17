package cn.blog.action;


import cn.blog.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by lucode on 2017/2/14.
 */
@Controller
@RequestMapping("/Back")
public class Back_deleteBlogAction {
    private BlogService blogService;

    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {

        this.blogService = blogService;
    }
    @RequestMapping(value = "/deleteblog" ,method = RequestMethod.GET)
    public String deleteblog(int id,Model model) throws Exception {
        //System.out.println("blogid"+id);
        this.blogService.deleteBlog(id);
        model.addAttribute("message","文章删除成功");
        return "/Back/bloglist.jsp";
    }
}
