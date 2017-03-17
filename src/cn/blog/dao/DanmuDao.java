package cn.blog.dao;


import cn.blog.entity.Danmu;
import cn.blog.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;


/**
 * Created by lucode on 2017/2/15.
 */
public class DanmuDao {
     //增加弹幕
    public void addDanmu(Danmu danmu) throws Exception {
        //打印数据
        //System.out.println("Dao层" + danmu.toString());

        // 保存到数据库
        SqlSession sqlSession = null;

        try {
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            sqlSession.insert("danmuNamespace.addDanmu", danmu);
            //事务不用手动开始 但是必须手动提交
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            //出现问题 事务回滚
            sqlSession.rollback();
            throw e;
        } finally {
            MybatisUtil.closeSqlSession();

        }

    }
   // 根据 博客的 id 得到与博客相关的弹幕
    public List<Danmu> getDanmu(int blogid) throws Exception {

        SqlSession sqlSession = null;
        List<Danmu> danmus=null;
        try {
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            danmus=sqlSession.selectList("danmuNamespace.getDanmu", blogid);

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            MybatisUtil.closeSqlSession();
            return danmus;
        }

    }
    //测试 弹幕增加
    @Test
    public void test() throws Exception{
        DanmuDao dao=new DanmuDao();
        dao.addDanmu(new Danmu("11", "这是弹幕", 50,12));
        dao.addDanmu(new Danmu("11", "这是弹幕", 60,12));
        dao.addDanmu(new Danmu("11", "这是弹幕", 70,12));
        dao.addDanmu(new Danmu("11", "这是弹幕666", 90,12));

    }

    //读取 弹幕增加
    @Test
    public void test2() throws Exception{
        DanmuDao dao=new DanmuDao();
        System.out.println(dao.getDanmu(12).toString());

    }

}
