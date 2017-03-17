package cn.blog.action;

import cn.blog.service.BlogService;
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
public class Back_deleteFriendlinkAction {
    private FriendlinkService friendlinkService;
    @Resource(name = "FriendlinkServiceID")
    public void setFriendlinkService(FriendlinkService friendlinkService) {
        this.friendlinkService=friendlinkService;
    }

    @RequestMapping(value = "/deletefriendlink" ,method = RequestMethod.GET)
    public String ddeletefriendlink(int id,Model model) throws Exception {
        //System.out.println("blogid"+id);
        this.friendlinkService.deleteFriendlink(id);
        model.addAttribute("message","删除成功");
        return "/Back/friendlink.jsp";
    }
}
