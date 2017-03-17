package cn.blog.dao;


import cn.blog.entity.Blogger;
import cn.blog.entity.Leavemsg;
import cn.blog.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.List;


/**
 * Created by lucode on 2017/2/11.
 * 将 信息写入数据库
 */
public class LeavemsgDao {

    // 向数据库增加 一条留言记录
    public void addLeavemsg(Leavemsg leavemsg) throws Exception{
        System.out.println("dao:"+leavemsg);
        // 保存到数据库
        SqlSession sqlSession = null;
        try{
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            sqlSession.insert("leavemsgNamespace.addLeavemsg",leavemsg);
            //事务不用手动开始 但是必须手动提交
            sqlSession.commit();
        }catch(Exception e){
            e.printStackTrace();
            //出现问题 事务回滚
            sqlSession.rollback();
            throw e;
        }finally{
            MybatisUtil.closeSqlSession();
        }
    }
    // 得到所有的留言
    public List<Leavemsg> getAllLeavemsg() throws Exception{


        SqlSession sqlSession = null;
        try{
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            return sqlSession.selectList("leavemsgNamespace.getAllLeavemsg");

        }catch(Exception e){
            e.printStackTrace();
            throw e;
        }finally{
            MybatisUtil.closeSqlSession();
        }
    }
    // 根据 id 后台删除留言
    public void deleteLeavemsgById(int id) throws Exception{
        SqlSession sqlSession = null;
        try{
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            sqlSession.selectList("leavemsgNamespace.deleteLeavemsgById",id);
            // 提交
            sqlSession.commit();

        }catch(Exception e){
            e.printStackTrace();
            // 回滚
            sqlSession.rollback();
            throw e;
        }finally{
            MybatisUtil.closeSqlSession();
        }
    }
     //向数据库 添加数据
    @Test
    public void test() throws Exception{
        LeavemsgDao dao=new LeavemsgDao();
        dao.addLeavemsg(new Leavemsg("德玛西亚","ooeoe@163.com","哈哈","2017年 12月30号"));
    }
    // 测试  得到 所有的留言
    @Test
    public void test2() throws  Exception{
        LeavemsgDao dao=new LeavemsgDao();
        List<Leavemsg> leavemsgs=dao.getAllLeavemsg();
        System.out.println(leavemsgs);

    }

    @Test
    public void test3() throws  Exception{
        LeavemsgDao dao=new LeavemsgDao();
        dao.deleteLeavemsgById(2);

    }


}
