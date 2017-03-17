package cn.blog.service;


import cn.blog.dao.DanmuDao;
import cn.blog.entity.Danmu;
import cn.blog.util.GetDanmuTimeUtil;
import org.junit.Test;

import java.util.List;

/**
 * Created by lucode on 2017/2/15.
 */
public class DanmuService {
    private DanmuDao danmuDao;
    public void setDanmuDao(DanmuDao danmuDao) {
        this.danmuDao=danmuDao;
    }
    public void addDanmu(Danmu danmu) throws Exception{
        //调用工具类 设置弹幕出现的时间 随机出现
        danmu.setTime(GetDanmuTimeUtil.getDanmuTime());
        danmuDao.addDanmu(danmu);
    }

    public List<Danmu> getDanmu(int blogid) throws Exception{


        return danmuDao.getDanmu(blogid);
    }


}
