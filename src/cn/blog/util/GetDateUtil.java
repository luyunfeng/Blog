package cn.blog.util;

import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lucode on 2017/2/10.
 */
public class GetDateUtil {
    /*
    * 工具类 得到当前时间
    * return 字符串类型的时间
    * */
    public static  String getData(){
        SimpleDateFormat formatter   =   new   SimpleDateFormat
                ("yyyy年MM月dd日 HH:mm:ss");
        Date curDate   =   new   Date(System.currentTimeMillis());

        return formatter.format(curDate);
    }
    @Test
    public void fun(){

        System.out.println(getData());
    }

}
