# 可以刷弹幕的个人博客哦!

先看看再说  
这是博客首页  
![image](/附件/首页.png)

这是后台写博客的地方
![image](/附件/后台.png)

#### 架构说明

![image](/附件/架构说明.png)

#### 配置文件
* Mybatis.xml
> 1.Mybatis 框的总配置文件  
> 2.保存数据库的登陆信息

* xxxMapper.xml 
> 1.与dao 层的每一个类对应  
> 2.对数据库操作的语句都写在这里
* springmvc.xml  
> 配置 springmvc框架的文件

* web.xml
> 1.注册springmvc核心控制器  
> 2.注册spring核心编码过滤器  


#### 弹幕功能(文章评论和留言版块)  
> 采用 JQuery 方式异步加载后台数据库中的得到的弹幕,异步发送弹幕

使用方法介绍  

1.第一步引入本插件的js文件,需要和jQuery一起引用。

```html
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery.danmu.js.js"></script>
```
2.新建一个div，这里把id值设为danmu
```html
<div id="danmu"></div>
```

3.在初始化弹幕插件之前，先向米娜桑介绍插件中的一个灰常重要的类 "danmu"
danmu对象意指具一条弹幕，它有如下属性：
```html
text——弹幕文本内容。
color——弹幕颜色。
position——弹幕位置 0为滚动 1 为顶部 2为底部
size——弹幕文字大小。 0为小字 1为大字
time——弹幕所出现的时间。 单位为分秒（十分之一秒）
isnew——当出现该属性时（属性值可为任意），会认为这是用户新发的弹幕，从而弹幕在显示的时候会有边框。
举例：
var aDanmu={ text:"这是弹幕" ,color:"white",size:1,position:0,time:2};
要显示边框的新弹幕：
var aDanmu={ text:"这是弹幕" ,color:"white",size:1,position:1,time:2,isnew:1};
```




