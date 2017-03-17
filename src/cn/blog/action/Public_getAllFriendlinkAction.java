package cn.blog.action;


import cn.blog.entity.Friendlink;
import cn.blog.service.FriendlinkService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lucode on 2017/2/22.
 */

@Controller
@RequestMapping("/Public")
public class Public_getAllFriendlinkAction {
    private FriendlinkService friendlinkService;

    @Resource(name = "FriendlinkServiceID")
    public void setFriendlinkService(FriendlinkService friendlinkService) {
        this.friendlinkService=friendlinkService;
    }

    //异步方式得到 数据 返回 json 数据
    @RequestMapping(value = "/getallfriendlink")
    public  @ResponseBody List<Friendlink> getallfriendlink() throws Exception {
        //将 list转成json文本
        return friendlinkService.getAllFriendlink();
    }

}
