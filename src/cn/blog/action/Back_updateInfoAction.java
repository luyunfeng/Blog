package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.entity.Blogger;
import cn.blog.service.BlogService;
import cn.blog.service.BloggerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by lucode on 2017/2/11.
 */
@Controller
@RequestMapping("/Back")
public class Back_updateInfoAction {
    /**
     * 处理  /Back/updateinfo.action 这个表单传来的post
     */
    private BloggerService bloggerService;
    @Resource(name = "BloggerServiceID")
    public void BloggerService(BloggerService bloggerService) {

        this.bloggerService = bloggerService;
    }
    @RequestMapping(value = "/updateinfo.action" ,method = RequestMethod.POST)
    public String updateinfo(Blogger blogger, Model model) throws Exception {

        //得到表单传来的数据  封装Blog这个实体类 传给service层
        bloggerService.updateBlogger(blogger);
        //System.out.println("up Action层" + blogger.toString());
        model.addAttribute("message","用户信息更新成功");
        return "/Back/personalinfo.jsp";
    }
}
