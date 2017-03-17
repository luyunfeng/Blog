package cn.blog.dao;
import cn.blog.entity.Friendlink;
import cn.blog.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;


/**
 * Created by lucode on 2017/2/22.
 */
public class FriendlinkDao {
    // 添加友链
    public void addFriendlink(Friendlink friendlink) {
        // 保存到数据库
        SqlSession sqlSession = null;
        try {
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            sqlSession.insert("friendlinkNamespace.addFriendlink", friendlink);

            //事务不用手动开始 但是必须手动提交
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            //出现问题 事务回滚
            sqlSession.rollback();
            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
        }
    }

    // 得到所有的 友链
    public List<Friendlink> getAllFriendlink() {
        // 保存到数据库
        SqlSession sqlSession = null;
        try {
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            return sqlSession.selectList("friendlinkNamespace.getAllFriendlink");
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
        }
    }


    //根据 id 号 删除友链
    public void deleteFriendlink(int id) {
        // 保存到数据库
        SqlSession sqlSession = null;
        try {
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            sqlSession.delete("friendlinkNamespace.deleteFriendlink", id);

            //事务不用手动开始 但是必须手动提交
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            //出现问题 事务回滚
            sqlSession.rollback();
            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
        }
    }



    // 添加测试
    @Test
    public void test(){
        FriendlinkDao dao=new FriendlinkDao();
        dao.addFriendlink(
                new Friendlink("百度一下","www.baidu.com","12345@baidu.com"));
    }

    // 获取测试
    @Test
    public void test2(){
        FriendlinkDao dao=new FriendlinkDao();
        System.out.println(dao.getAllFriendlink().get(0).toString());

    }
    // 删除测试
    @Test
    public void test3(){
        FriendlinkDao dao=new FriendlinkDao();
       dao.deleteFriendlink(5);

    }
}
