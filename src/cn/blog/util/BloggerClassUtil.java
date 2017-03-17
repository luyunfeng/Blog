package cn.blog.util;

import cn.blog.entity.Blogger;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by lucode on 2017/2/12.
 * 工具类
 * 1. 判断blogger对象中 属性值如果为空字符串  将它赋值为null
 * 2. 将 touxiang url 链接提取出来 返回一个字符串
 */
public class BloggerClassUtil {
    /*
    * 如果 实例中的Blogger 字符串类型为空 将它赋值为 null
    * */
    public static Blogger  bloggerClassUtil(Blogger blogger){
        if(blogger.getUsername().equals("")){
            blogger.setUsername(null);
        }
        if(blogger.getPassword().equals("")){
            blogger.setPassword(null);
        }
        if(blogger.getNickname().equals("")){
            blogger.setNickname(null);
        }
        if(blogger.getSign().equals("")){
            blogger.setSign(null);
        }
        if(blogger.getTouxiang().equals("")){
            blogger.setTouxiang(null);
        }else {
            //如果 有字符存在 就提取中间的 img标签
           blogger.setTouxiang(getImgUrl(blogger.getTouxiang()));

        }

        return blogger;
    }
    //返回 url链接
    public static String getImgUrl(String str){
        String pattern = "src=\".*?\"";

        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern);

        // 现在创建 matcher 对象
        Matcher m = r.matcher(str);
        if (m.find( )) {
            return  m.group(0).replace("\"","").replace("src=","");
        } else {
            return null;
        }


    }
    public static void main( String args[] ){

        // 按指定模式在字符串查找
        String line = "<p><img src=\"/ueditor/" +
                "jsp/upload/image/20170212/1486874614968041836.jpeg\"" +
                " title=\"1486874614968041836.jpeg\" alt=\"miku.jpeg\"/></p>'";
        System.out.println(getImgUrl(line));
    }



}
