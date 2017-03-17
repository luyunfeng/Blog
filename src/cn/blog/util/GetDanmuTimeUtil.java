package cn.blog.util;

import org.junit.Test;

import java.util.Random;

/**
 * Created by lucode on 2017/2/15.
 */
public class GetDanmuTimeUtil {
    // 获得随机 时间 单位1秒的十分之一
    public static int getDanmuTime(){
        Random random=new Random();// 定义随机类
        int a =random.nextInt(15)+2;// 返回[4,15)集合中的整数，注意不包括10
        return a*10;
    }

    @Test
    public void test(){
        System.out.println(getDanmuTime());
    }
}
