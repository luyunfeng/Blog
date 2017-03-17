package cn.blog.action;

import cn.blog.entity.Danmu;
import cn.blog.service.DanmuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lucode on 2017/2/15.
 */


@Controller
@RequestMapping("/Home")
public class Home_addDanmuAction {

    private DanmuService danmuService;
    @Resource(name = "DanmuServiceID")
    public void setDanmuService(DanmuService danmuService) {
        this.danmuService = danmuService;
    }

   //接受 异步的  get 请求
    @RequestMapping(value = "/adddanmu")
    public void adddanmu(String user,int blogid,String content) throws Exception {
        // 处理一下中文
        user= new String(user.getBytes("iso8859-1"),"utf-8");
        content= new String(content.getBytes("iso8859-1"),"utf-8");
        Danmu danmu=new Danmu(user,content,blogid);
           //System.out.println("action===="+danmu.toString());
        danmuService.addDanmu(danmu);
    }



}
