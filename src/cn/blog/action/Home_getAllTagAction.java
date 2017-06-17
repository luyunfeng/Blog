package cn.blog.action;

import cn.blog.entity.Tag;
import cn.blog.service.BlogService;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by lucode on 2017/2/23.
 */
@Controller
@RequestMapping("/Home")
public class Home_getAllTagAction {
    private BlogService blogService;

    @Resource(name = "BlogServiceID")
    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    //异步方式得到 数据
    @RequestMapping(value = "/getalltag")
    public
    @ResponseBody
    List<Tag> getalltag() throws Exception {
        return blogService.getAllTag();
    }

    //异步方式得到 数据
    // 热门标签 前面六个
    @RequestMapping(value = "/gethottag")
    public @ResponseBody
    List<Tag> gethottag() throws Exception {
        List<Tag> tags = blogService.getAllTag();
        List<Tag> newtags = new ArrayList<>();
        for (int i = 0; i < tags.size(); i++) {
            if (i < 6)
                newtags.add(tags.get(i));
        }

        return newtags;
    }


}
