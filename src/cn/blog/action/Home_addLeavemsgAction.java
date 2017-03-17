package cn.blog.action;

import cn.blog.entity.Danmu;
import cn.blog.entity.Leavemsg;
import cn.blog.service.DanmuService;
import cn.blog.service.LeavemsgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by lucode on 2017/2/21.
 */
@Controller
@RequestMapping("/Home")
public class Home_addLeavemsgAction {

    private LeavemsgService leavemsgService;
    @Resource(name = "LeavemsgServiceID")
    public void setLeavemsgService(LeavemsgService leavemsgService) {
        this.leavemsgService=leavemsgService;

    }
     ///Home/addleavemsg.action?user=问问&mail=ww&content哈哈哈哈哈
    //接受 异步的  get 请求
    @RequestMapping(value = "/addleavemsg")
    public void addleavemsg(String user,String mail,String content) throws Exception {
        // 处理一下中文
        user= new String(user.getBytes("iso8859-1"),"utf-8");
        content= new String(content.getBytes("iso8859-1"),"utf-8");
        mail= new String(mail.getBytes("iso8859-1"),"utf-8");
        Leavemsg leavemsg=new Leavemsg(user,mail,content);
        System.out.println("action"+leavemsg.toString());
        leavemsgService.addLeavemsg(leavemsg);
    }

}
