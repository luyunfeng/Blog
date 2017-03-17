<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/15
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="basepath.jsp" %>
<script src="${pageContext.request.contextPath}/res/js/jquery.danmu.min.js"></script>
<aside class="col-md-4 sidebar">

    <div style="background-image:url('/res/img/bamboo.jpg');position:fixed ;" class="widget" id="gundong">
        <div style=" position: relative; width:200px; height: 300px;margin-left: auto;margin-right: auto;">
            <div id="danmu">
            </div>
        </div>
        <!--控制区-->
        <div class="ctr">
            显示弹幕:<input type='checkbox' checked='checked' id='ishide' value='is' onchange='changehide()'><br/>
            弹幕透明度:
            <input type="range" name="op" id="op" onchange="op()" value="100"> <br>

            发弹幕:
            <select name="color" id="color">
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
            <br/>
            <input type="textarea" id="text" style="width: 100% ;height: 50px"
                   placeholder="不要刷屏哦"
            /><br/><br/>
            <input type="text" id="user" placeholder="客官,留下大名" style="height: 30px;width: 100%"><br/>
            <button type="button" onclick="send()">发射</button>

        </div>
    </div>
    <!-- end tag cloud widget -->
    <!--异步加载 得到弹幕信息-->
    <script type="text/javascript">
        $(document).ready(function () {
            var url = "${pageContext.request.contextPath}/Home/getdanmu.action?blogid=${blog.id}";
            $.get(url, function (backData, textStaut, ajax) {
                var json = JSON.parse(ajax.responseText);
                /*
                 * [{"id":1,"userid":11,"content":"这是弹幕","time":50,"blog_id":12,"blog":null},
                 *
                 *将上面的 转换成下面这样的形式
                 * {"text": "卧槽", "color": "green", "size": "3", "position": "0", "time": 30}
                 * */
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
                            time: danmu.time
                        };
                    } else if (n >= 3 && n < 6) {
                        newdanmu = {
                            text: danmu.user + ":" + danmu.content,
                            color: "yellow",
                            size: 3,
                            position: 0,
                            time: danmu.time
                        };
                    } else if (n >= 6 && n < 9) {
                        newdanmu = {
                            text: danmu.user + ":" + danmu.content,
                            color: "blue",
                            size: 3,
                            position: 0,
                            time: danmu.time
                        };
                    } else {
                        newdanmu = {
                            text: danmu.user + ":" + danmu.content,
                            color: "blue",
                            size: 3,
                            position: 0,
                            time: danmu.time
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
            setTimeout("reback()", 25000);
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


        //发送弹幕 到服务器 并实时显示出来
        function send() {
            var text = document.getElementById('text').value;
            var user = document.getElementById('user').value;
            var color = document.getElementById('color').value;
            var position = document.getElementById('position').value;
            var time = $('#danmu').data("nowTime") + 1;
            var size = document.getElementById('text_size').value;

            if (text=="") {
                alert("不能发送空内容哦!");
                return false;

            }

            if (user=="") {
                alert("少侠!你的名字?");
                return false;
            }


            var url = "${pageContext.request.contextPath}" +
                "${pageContext.request.contextPath}/Home/adddanmu.action?user=" + user + "&blogid=${blog.id}&content=" + text;
            //发送到后台处理弹幕 (添加)
            $.get(url);
            //实时显示弹幕
            var text_obj = '{ "text":"' + text + '","color":"' + color + '","size":"' + size + '","position":"' + position + '","time":' + time + ',"isnew":""}';
            var new_obj = eval('(' + text_obj + ')');
            $('#danmu').danmu("addDanmu", new_obj);
            //清空 输入框
            document.getElementById('text').value = '';
            document.getElementById('user').value = '';
        }
        //调整透明度函数
        function op() {
            var op = document.getElementById('op').value;
            $('#danmu').danmu("setOpacity", op / 100);
        }

        //调隐藏 显示
        function changehide() {
            var op = document.getElementById('op').value;
            op = op / 100;
            if (document.getElementById("ishide").checked) {
                $("#danmu").danmu("setOpacity", 1)
            } else {
                $("#danmu").danmu("setOpacity", 0)
            }
        }

    </script>
</aside>