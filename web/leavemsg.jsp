<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/20
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="include_head.jsp"/>
    <script src="${pageContext.request.contextPath}/res/js/jquery.danmu.min.js"></script>
</head>
<body class="post-template" style="height:100%; background-image:url('${pageContext.request.contextPath}/res/img/articlebg.jpg');">
<jsp:include page="include_menu.jsp"/>
<div style="background-image:url('/res/img/bamboo.jpg');">
    <!--控制区-->
    <div class="ctr">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td rowspan="6">
                    <textarea id="text" style="height: 100% ;width: 100%" placeholder="不要刷屏哦"></textarea>
                </td>
                <td width="200px">留言:
                </td>
            </tr>
            <tr>
                <td><select name="color" id="color">
                    <option value="red">红色</option>
                    <option value="green">绿色</option>
                    <option value="blue">蓝色</option>
                    <option value="yellow">黄色</option>
                </select>
                    <select name="size" id="text_size">
                        <option value="1">大文字</option>
                        <option value="0">小文字</option>
                    </select>
                    <select name="position" id="position">
                        <option value="0">滚动</option>
                        <option value="1">顶端</option>
                        <option value="2">底端</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" id="user" width="100%" placeholder="客官,留下大名" style="">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text"  id="mail" width="300px" placeholder="客官,留下邮箱">
                </td>
            </tr>
            <tr>
                <td>
                    <button type="button" class="btn btn-success" style="width: 100% "
                            onclick="send()">发送</button>
                </td>
            </tr>
            <tr><td>&nbsp;</td></tr>
        </table>
    </div>
    <div style=" height: 480px;   position: relative; margin-left: auto;margin-right: auto;">
        <div id="danmu">
        </div>
    </div>
    <!--异步加载 弹幕信息-->
    <script type="text/javascript">
        $(document).ready(function () {
            var url = "${pageContext.request.contextPath}/Public/getallleavemsg.action";
            $.get(url, function (backData, textStaut, ajax) {
                var json = JSON.parse(ajax.responseText);
                var arr = new Array(); //声明一个动态数组对象arr
                $.each(json, function (i, danmu) {
                    n = parseInt(Math.random() * 10 + 1);
                    var newdanmu;
                    if (n < 3) {
                        newdanmu = {
                            text: danmu.user + ":" + danmu.content,
                            color: "red",
                            size: 3,
                            position: 0,
                            time: 10
                        };
                    } else if (n >= 3 && n < 6) {
                        newdanmu = {
                            text: danmu.user + ":" + danmu.content,
                            color: "yellow",
                            size: 3,
                            position: 0,
                            time: 20
                        };
                    } else if (n >= 6 && n < 9) {
                        newdanmu = {
                            text: danmu.user + ":" + danmu.content,
                            color: "blue",
                            size: 3,
                            position: 0,
                            time: 30
                        };
                    } else {
                        newdanmu = {
                            text: danmu.user + ":" + danmu.content,
                            color: "blue",
                            size: 3,
                            position: 0,
                            time: 40
                        };
                    }

                    arr[i] = newdanmu;
                });
                //添加 弹幕
                add(arr);
                //开始弹幕
                starter();
            });

            //反复 播放弹幕
            reback();
        });

    </script>
    <!--弹幕控制区域-->
    <script>
        // 回放弹幕
        function reback() {
            $('#danmu').danmu("setTime", 0);
            setTimeout("reback()", 40000);
        }
        //初始化
        $("#danmu").danmu({
            left: 0,
            top: 0,
            height: "100%",
            width: "100%",
            speed: 20000,
            opacity: 1,
            font_size_small: 16,
            font_size_big: 24,
            top_botton_danmu_time: 6000
        });

        //开始
        function starter() {
            $('#danmu').danmu('danmuStart');
        }

        //添加弹幕到页面
        function add(arrdanmu) {
            $('#danmu').danmu("addDanmu", arrdanmu);
        }

        function ischinese(s){
            for(var i=0;i<s.length;i++) {
                //遍历每一个文本字符
                // 判断文本字符的unicode值
                if((s.charCodeAt(i)>=10000)){
                    return true;
                }
            }
            return false;
        }
        function chk()
        {
            var str = document.getElementById('text').value;
            var val= ischinese(str);               //判断是否包含中文
            if(val){
                //alert("有中文");
                return true;

            } else{
                //alert("全是英文");
                // 如果全是英文就返回 false 禁止评论
                return false;
            }

        }
        // 统计字数，英文一个字符，中文两个
        function strlen(str){
            var len = 0;
            for (var i=0; i<str.length; i++) {
                var c = str.charCodeAt(i);
                //单字节加1
                if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {
                    len++;
                }
                else {
                    len+=2;
                }
            }
            return len;
        }
        //发送弹幕 到服务器 并实时显示出来
        function send() {
            var text = document.getElementById('text').value;
            var user = document.getElementById('user').value;
            var mail = document.getElementById('mail').value;
            var color = document.getElementById('color').value;
            var position = document.getElementById('position').value;
            var time = $('#danmu').data("nowTime") + 1;
            var size = document.getElementById('text_size').value;
            //alert(strlen(text));
            // 超过200个字符返回 false
            if(strlen(text)>200){
                alert("你话太多了");
                return false;
            }

            if(!chk()){
                alert("说点中文吧");
                return false;
            }
            if (text=="") {
                alert("不能发送空内容哦!");
                return false;

            }

            if (user=="") {
                alert("少侠!你的名字?");
                return false;
            }
            if (mail=="") {
                alert("少侠!你的邮箱?");
                return false;
            }
            var url = "${pageContext.request.contextPath}/Home/addleavemsg.action" +
            "?user="+user+"&mail="+mail+"&content="+text;

            //传到 后台
            $.get(url);
            //实时显示弹幕
            var text_obj = '{ "text":"' + text + '","color":"' + color + '","size":"' + size + '","position":"' + position + '","time":' + time + ',"isnew":""}';
            var new_obj = eval('(' + text_obj + ')');
            $('#danmu').danmu("addDanmu", new_obj);
            //清空 输入框
            document.getElementById('text').value = '';
            document.getElementById('user').value = '';
            document.getElementById('mail').value = '';

        }


    </script>
</div>
<jsp:include page="include_footer.jsp"/>

</body>
</html>