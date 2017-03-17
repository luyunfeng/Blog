package cn.blog.service;

import cn.blog.dao.BloggerDao;
import cn.blog.dao.LeavemsgDao;
import cn.blog.entity.Blogger;
import cn.blog.entity.Leavemsg;
import cn.blog.util.BloggerClassUtil;
import cn.blog.util.GetDateUtil;

import java.util.List;

/**
 * Created by lucode on 2017/2/20.
 */
public class LeavemsgService {

    private LeavemsgDao leavemsgDao;
    public void setLeavemsgDao(LeavemsgDao leavemsgDao) {
        this.leavemsgDao=leavemsgDao;
    }
    // 增加 留言
    public void addLeavemsg(Leavemsg leavemsg) throws Exception{
        leavemsg.setDate(GetDateUtil.getData());
        leavemsgDao.addLeavemsg(leavemsg);
    }

    //得到所有的留言
    public List<Leavemsg> getAllLeavemsg() throws Exception{
        return leavemsgDao.getAllLeavemsg();

    }
    // 删除 指定的 id 的留言
    public void deleteLeavemsgById(int id) throws  Exception{
         leavemsgDao.deleteLeavemsgById(id);
    }


}
