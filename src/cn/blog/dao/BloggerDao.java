package cn.blog.dao;


import cn.blog.entity.Blogger;
import cn.blog.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;


/**
 * Created by lucode on 2017/2/11.
 * 将 信息写入数据库
 */
public class BloggerDao {

    // 更新博主用户信息
    public void updateBlogger(Blogger blogger) throws Exception{
        //打印数据
        //System.out.println("Dao层"+blogger.toString());

        SqlSession sqlSession = null;
        try{
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();

            sqlSession.update("bloggerNamespace.updateBlogger",blogger);
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

    // 从数据库中提取 博主的信息
    public Blogger getBlogger() throws Exception{

        SqlSession sqlSession = null;
        // 用户只有一个 所以直接提取 id
        Blogger blogger=new Blogger(1);
        try{
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            blogger= sqlSession.selectOne("bloggerNamespace.findById",blogger.getId());
        }catch(Exception e){
            e.printStackTrace();

            throw e;
        }finally{

            MybatisUtil.closeSqlSession();
            return blogger;
        }
    }



    // 测试
    public static void main(String[] args) throws Exception{

         BloggerDao dao=new BloggerDao();
        System.out.println(dao.getBlogger().toString());

    }
}
