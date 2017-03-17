package cn.blog.dao;

import cn.blog.entity.Blog;
import cn.blog.entity.Danmu;
import cn.blog.entity.Tag;
import cn.blog.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static java.sql.JDBCType.NULL;

/**
 * Created by lucode on 2017/2/9.9
 * blog 和 tag 表的 操作
 */
public class BlogDao {
    // 添加博客
    public void addBlog(Blog blog, ArrayList<Tag> tagArr) throws Exception {
        //打印数据
        //System.out.println("Dao层" + blog.toString());
        //System.out.println("Dao层" + tagArr.toString());

        // 保存到数据库
        SqlSession sqlSession = null;
        int newblogId;
        int oldblogid = blog.getId();
        try {
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            sqlSession.insert("blogNamespace.addBlog", blog);
            //事务不用手动开始 但是必须手动提交
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            //出现问题 事务回滚
            sqlSession.rollback();
            throw e;
        } finally {
            MybatisUtil.closeSqlSession();
            //返回刚刚 插入值的主键 id
            newblogId = blog.getId();
            //开始 插入tag 到数据库中
            addtag(newblogId, tagArr);
            //id 不等于表示 这个传来的是编辑后的博客 具有 id
            if (oldblogid != 0) {
                // 在删掉 原来的博客之前先把原来的弹幕  复制保存到新的博客中
                DanmuDao danmuDao = new DanmuDao();
                List<Danmu> danmus = danmuDao.getDanmu(oldblogid);
                for (int i = 0; i < danmus.size(); i++) {
                    System.out.println("修改之前弹幕中的博客 id" + danmus.get(i).getBlog_id());
                    danmus.get(i).setBlog_id(newblogId);
                    System.out.println("修改之后弹幕中的博客 id" + danmus.get(i).getBlog_id());

                    danmuDao.addDanmu(danmus.get(i));
                }
                //删除 原来的博客
                this.deleteBlog(oldblogid);
            }
        }

    }

    // 在把博客 写入数据后的后  调用这个方法写入博客相关的标签
    public void addtag(int blogId, ArrayList<Tag> tagArr) {
        // 保存到数据库
        SqlSession sqlSession = null;
        try {
            //加载 工具类
            sqlSession = MybatisUtil.getSqlSession();
            for (int x = 0; x < tagArr.size(); x++) {
                //开始 批量插入 标签
                tagArr.get(x).setBlog_id(blogId);
                sqlSession.insert("tagNamespace.addTag", tagArr.get(x));
            }
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

    //将博客和标签 数据库中读取
    public List<Blog> getAllBlog() {
        // 保存到数据库
        SqlSession sqlSession = null;
        List<Blog> blogs = new ArrayList<Blog>();
        try {
            sqlSession = MybatisUtil.getSqlSession();
            blogs = sqlSession.selectList("blogNamespace.getAllBlog");
            //根据 id再 去查和 博客相关的标签
            for (Blog blog : blogs) {
                // 在首页显示 所以把 内容设置为空 不需要展示
                blog.setContent(null);
                //根据 博客的id查 完成 赋值操作
                blog.setTagList(this.getTagByBlogId(blog.getId()));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
            return blogs;
        }
    }

    //根据 博客的名字查找 返回对应的博客
    public Blog getBlogByTitle(String title) {
        // 保存到数据库
        SqlSession sqlSession = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            return sqlSession.selectOne("blogNamespace.getBlogByTitle", title);

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
        }
    }

    //根据 博客的id查 返回所有相关的 标签
    public List<Tag> getTagByBlogId(int blogid) {
        SqlSession sqlSession = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            return sqlSession.selectList("tagNamespace.getTagByBlogId"
                    , blogid);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
        }
    }

    // 根据 博客的id 读取数据库中的博客
    public Blog getBlogById(int blogid) {
        // 保存到数据库
        SqlSession sqlSession = null;
        Blog blog = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            blog = sqlSession.selectOne("blogNamespace.getBlogById", blogid);

        } catch (Exception e) {
            e.printStackTrace();

            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
            blog.setTagList(this.getTagByBlogId(blogid));
            return blog;
        }


    }

    //根据 标签名字 查找相关的博客的 id
    public List<Blog> getBlogByTagName(String tagName) {

        SqlSession sqlSession = null;
        List<Blog> blogs = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            blogs = sqlSession.selectList("blogNamespace.getBlogByTagName",
                    tagName);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
            return blogs;
        }
    }

    // 得到所有的 标签(不重复)的 及其相关的 博客
    public List<Tag> getAllTag() {
        // 保存到数据库
        SqlSession sqlSession;
        List<String> tagNames;
        List<Tag> tags = new ArrayList<>();
        try {
            sqlSession = MybatisUtil.getSqlSession();
            // 取出 数据库中 不重复的标签
            tagNames = sqlSession.selectList("tagNamespace.getAllTag");
            // 根据标签名字找到相关的博客文章
            for (int i = 0; i < tagNames.size(); i++) {
                tags.add(new Tag(tagNames.get(i),
                        this.getBlogByTagName(tagNames.get(i))));
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
            return tags;
        }
    }

    //根据 博客的id去删除博客
    public void deleteBlog(int blogid) {

        SqlSession sqlSession = null;
        try {

            sqlSession = MybatisUtil.getSqlSession();
            sqlSession.delete("blogNamespace.deleteBlog", blogid);
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

    // 根据 关键字查找博客  即 实现搜索功能
    public List<Blog> getBlogByKeyWord(String keyword){
        SqlSession sqlSession;
        List<Blog> blogs = null;
        try {
            sqlSession = MybatisUtil.getSqlSession();
            blogs = sqlSession.selectList("blogNamespace.getBlogByKeyWord",
                    keyword);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            //关闭
            MybatisUtil.closeSqlSession();
            if (blogs.size()==0){
                return null;
            }else {
                return blogs;
            }

        }

    }





    //测试  根据 博客id 返回所有的标签
    @Test
    public void test() {
        BlogDao dao = new BlogDao();
        List<Tag> tags = dao.getTagByBlogId(32);
        System.out.println(tags.get(0).toString());
    }

    //删除文章
    @Test
    public void test2() {
        BlogDao dao = new BlogDao();
        dao.deleteBlog(14);
    }
    //根据 id得到 博客
    @Test
    public void test3() {
        BlogDao dao = new BlogDao();
        String str = dao.getBlogById(32).toString();
        System.out.println(str);
    }

    //根据 博客名字  查找博客
    @Test
    public void test4() {
        BlogDao dao = new BlogDao();
        System.out.println(dao.getBlogByTitle("面试准备——数据库").toString());
    }

    // 测试 查找所有的标签名字 并且 不重复
    @Test
    public void test5() {
        BlogDao dao = new BlogDao();
        System.out.println(dao.getAllTag().toString());
    }

    // 测试 根据标签名字查找相关的博客
    @Test
    public void test6() {
        BlogDao dao = new BlogDao();
        System.out.println(dao.getBlogByTagName(
                "java").toString()
        );
    }
     // 搜索功能测试
    @Test
    public void test7() {
        BlogDao dao = new BlogDao();
        System.out.println(dao.getBlogByKeyWord("33").toString());
    }


}
