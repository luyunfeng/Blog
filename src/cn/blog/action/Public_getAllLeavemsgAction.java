package cn.blog.action;

import cn.blog.entity.Blog;
import cn.blog.entity.Leavemsg;
import cn.blog.service.BlogService;
import cn.blog.service.LeavemsgService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lucode on 2017/2/21.
 */
@Controller
@RequestMapping("/Public")
public class Public_getAllLeavemsgAction {
    private LeavemsgService leavemsgService;
    @Resource(name = "LeavemsgServiceID")
    public void setLeavemsgService(LeavemsgService leavemsgService) {
        this.leavemsgService = leavemsgService;
    }

    //异步方式得到 数据
    @RequestMapping(value = "/getallleavemsg")
    public  @ResponseBody List<Leavemsg> getallleavemsg() throws Exception {
        //将 list转成json文本
        return leavemsgService.getAllLeavemsg();
    }
}
