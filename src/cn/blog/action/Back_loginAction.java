package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.entity.Blogger;
import cn.blog.service.BloggerService;
import cn.blog.util.VerifyCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;

/**
 * Created by lucode on 2017/2/26.
 */
@Controller
@RequestMapping("/Back")
public class Back_loginAction {
    private String vcode = null;
    private BloggerService bloggerService;

    @Resource(name = "BloggerServiceID")
    public void BloggerService(BloggerService bloggerService) {

        this.bloggerService = bloggerService;
    }


    @RequestMapping(value = "/login.action", method = RequestMethod.POST)
    public String login(String username, String password, String verify,Model model,HttpServletRequest request) throws Exception {
        if (!verify.equalsIgnoreCase(vcode)){
            model.addAttribute("message", "验证码输入错误");
            model.addAttribute("password",password);
            model.addAttribute("username",username);
            return "/Back/login.jsp";
        }
        Blogger blogger = bloggerService.getBlogger();
        if (!blogger.getUsername().equals(username)) {
            model.addAttribute("message", "用户名错误");
            return "/Back/login.jsp";
        }
        if (!blogger.getPassword().equals(password)) {
            model.addAttribute("message", "密码错误");
            return "/Back/login.jsp";
        }
        // 表示登陆成功
        model.addAttribute("username", username);
        request.getSession().setAttribute("username",username);
        return "/Back/index.jsp";
    }

    @RequestMapping(value = "/getvcode.action", method = RequestMethod.GET)
    public void getVcode(HttpServletRequest request, HttpServletResponse response) throws Exception {
        VerifyCodeUtil vc = new VerifyCodeUtil();

        BufferedImage image = vc.getImage();//获取一次性验证码图片

        //request.getSession().setAttribute("codeText", vc.getText());
        //System.out.println(vc.getText());//获取图片上的文本
        VerifyCodeUtil.output(image, response.getOutputStream());//把图片写到指定流中
        // 将验证码 传入 login 请求中
        vcode = vc.getText();
        //System.out.println("下面===验证码是:" + vcode);
    }
}
