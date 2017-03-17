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
public class Home_getDanmuAction {
    private DanmuService danmuService;
    @Resource(name = "DanmuServiceID")
    public void setDanmuService(DanmuService danmuService) {
        this.danmuService = danmuService;
    }

    // 请求路径为 /Home/getdanmu.action
    @RequestMapping(value = "/getdanmu")
    public @ResponseBody List<Danmu> getdanmu(int blogid, Model model) throws Exception {
        // 异步方式将数据传到前端页面
        return danmuService.getDanmu(blogid);
    }
}
