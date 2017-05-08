package cn.blog.action;
import cn.blog.entity.Friendlink;
import cn.blog.service.FriendlinkService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.annotation.Resource;


/**
 * Created by lucode on 2017/2/22.
 */
@Controller
@RequestMapping("/Back")
public class Back_addFriendlinkAction {
    private FriendlinkService friendlinkService;

    @Resource(name = "FriendlinkServiceID")
    public void setFriendlinkService(FriendlinkService friendlinkService) {
        this.friendlinkService=friendlinkService;
    }

    //异步方式得到 数据 返回 json 数据
    @RequestMapping(value = "/addfriendlink", method = RequestMethod.POST)
    public String addfriendlink(Friendlink friendlink, Model model) throws Exception {
        //System.out.println(friendlink.toString());
        friendlinkService.addFriendlink(friendlink);
        model.addAttribute("message","友链添加成功");
        return "/Back/friendlink.jsp";
    }

}
