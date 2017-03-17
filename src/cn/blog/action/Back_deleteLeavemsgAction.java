package cn.blog.action;

import cn.blog.service.BlogService;
import cn.blog.service.LeavemsgService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by lucode on 2017/2/21.
 */
@Controller
@RequestMapping("/Back")
public class Back_deleteLeavemsgAction {
    private LeavemsgService leavemsgService;

    @Resource(name = "LeavemsgServiceID")
    public void setLeavemsgService(LeavemsgService leavemsgService) {
        this.leavemsgService = leavemsgService;
    }
    @RequestMapping(value = "/deleteleavemsg" ,method = RequestMethod.GET)
    public String deleteleavemsg(int id,Model model) throws Exception {

        this.leavemsgService.deleteLeavemsgById(id);
        model.addAttribute("message","删除成功");
        return "/Back/leavemsglist.jsp";
    }
}
