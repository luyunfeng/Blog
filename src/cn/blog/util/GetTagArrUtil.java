package cn.blog.util;

import cn.blog.entity.Tag;
import org.junit.Test;

import java.util.ArrayList;

/**
 * Created by lucode on 2017/2/10.
 */
public class GetTagArrUtil {
    public static ArrayList<Tag>  getTagArr(String tags){
        ArrayList<Tag> tagArr=new ArrayList<>();

        String[] strings = tags.split(" |,");//根据“ ”和“,”区分

        for (int x=0;x<strings.length;x++){
            //去除多余的空格
            if (strings[x].equals("")){
                continue;
            }else {
                //封装tag实体
                tagArr.add(new Tag(strings[x]));
            }

        }

        return tagArr;
    }

    @Test
    public void test(){
        String sss = "gogogogo 9     6666 java 哈哈";
        System.out.println(getTagArr(sss));
    }
}
