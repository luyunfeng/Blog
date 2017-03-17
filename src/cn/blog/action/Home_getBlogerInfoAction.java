package cn.blog.action;

import cn.blog.entity.Blogger;
import cn.blog.service.BloggerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by lucode on 2017/2/12.
 */
@Controller
@RequestMapping("/Home")
public class Home_getBlogerInfoAction {
    private BloggerService bloggerService;
    @Resource(name = "BloggerServiceID")
    public void BloggerService(BloggerService bloggerService) {

        this.bloggerService = bloggerService;
    }
    /*@RequestMapping(value = "/blogerinfo" ,method =  RequestMethod.GET)
    public String blogerinfo(Model model) throws Exception {
        Blogger blogger=bloggerService.getBlogger();
        model.addAttribute("Blogger",blogger);
        System.out.println("action层" + blogger.toString());
        return "/index.jsp";
    }*/
    //异步方式得到 数据
    @RequestMapping(value="/blogerinfo")
    public @ResponseBody Blogger blogerinfo() throws Exception{
        //得到Service层的Blogger对象
        Blogger blogger=bloggerService.getBlogger();
        return blogger;
    }


}
