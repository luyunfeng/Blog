package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by lucode on 2017/2/17.
 */
@Controller
@RequestMapping("/Back")
public class Back_getBlogByIdAction {

    private BlogService blogService;

    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }
    //这里面传到 修改文章的那块
    @RequestMapping(value = "/getblogbyid", method = RequestMethod.GET)
    public  String  getblogbyid(int id, Model model) throws Exception {

        Blog blog =blogService.getBlogById(id);
        model.addAttribute("blog",blog);
        // 将标签的数量传过去
        model.addAttribute("tags",blog.getTagList());
        return "/Back/updateblog.jsp";
    }

}
