<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/15
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font-family: "Microsoft YaHei" ! important;
            font-color:#222;
        }
        pre {
            line-height: 2em;
            font-family: "Microsoft YaHei" ! important;
        }
        h4 {
            line-height: 2em;
        }
        #danmuarea {
            position: relative;
            background: #222;
            width:800px;
            height: 445px;
            margin-left: auto;
            margin-right: auto;
        }
        .center {
            text-align: center;
        }
        .ctr {
            font-size: 1em;
            line-height: 2em;
        }
    </style>
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <script src="jquery.danmu.min.js"></script>
</head>
<body>

<body class="center">
Demo<br><br>
<!--黑背景和弹幕区-->
<div id="danmuarea">
    <div id="danmu" >
    </div>
</div>
<!--控制区-->
<div class="ctr" >
    <button type="button"  onclick="resumer() ">弹幕开始/继续</button>&nbsp;&nbsp;&nbsp;&nbsp;
    <button type="button"  onclick="pauser()">弹幕暂停</button>  &nbsp;&nbsp;&nbsp;&nbsp;
    显示弹幕:<input type='checkbox' checked='checked' id='ishide' value='is' onchange='changehide()'> &nbsp;&nbsp;&nbsp;&nbsp;
    弹幕透明度:
    <input type="range" name="op" id="op" onchange="op()" value="100"> <br>
    当前弹幕运行时间(秒)：<span id="time"></span>&nbsp;&nbsp;
    设置当前弹幕时间(秒)： <input type="text" id="set_time" max=20 />
    <button type="button"  onclick="settime()">设置</button>
    <br>
    发弹幕:
    <select  name="color" id="color" >
        <option value="white">白色</option>
        <option value="red">红色</option>
        <option value="green">绿色</option>
        <option value="blue">蓝色</option>
        <option value="yellow">黄色</option>
    </select>
    <select name="size" id="text_size" >
        <option value="1">大文字</option>
        <option value="0">小文字</option>
    </select>
    <select name="position" id="position"   >
        <option value="0">滚动</option>
        <option value="1">顶端</option>
        <option value="2">底端</option>
    </select>
    <input type="textarea" id="text" max=300 />
    <button type="button"  onclick="send()">发送</button>
    <button  onclick="add()" />测试</button>
</div>
<script>
    //初始化
    $("#danmu").danmu({
        left:0,
        top:0,
        height:"100%",
        width:"100%",
        speed:20000,
        opacity:1,
        font_size_small:16,
        font_size_big:24,
        top_botton_danmu_time:6000
    });
    query();//  从后端获取弹幕并添加

    //再添加三个弹幕
    $("#danmu").danmu("addDanmu",[
        { text:"这是滚动弹幕" ,color:"white",size:1,position:0,time:2}
        ,{ text:"这是顶部弹幕" ,color:"yellow" ,size:1,position:1,time:2}
        ,{ text:"这是底部弹幕" , color:"red" ,size:1,position:2,time:2}
    ]);
    //一个定时器，监视弹幕时间并更新到页面上
    function timedCount(){
        $("#time").text($('#danmu').data("nowTime"));

        t=setTimeout("timedCount()",50)

    }
    timedCount();



    function starter(){
        $('#danmu').danmu('danmuStart');
    }
    function pauser(){
        $('#danmu').danmu('danmuPause');
    }
    function resumer(){
        $('#danmu').danmu('danmuResume');
    }
    function stoper(){
        $('#danmu').danmu('danmuStop');
    }
    function getime(){
        alert($('#danmu').data("nowTime"));
    }
    function getpaused(){
        alert($('#danmu').data("paused"));
    }
    //添加弹幕测试  这个函数没有调用
    function add() {
        var newd =
            [{"text": "卧槽", "color": "green", "size": "3", "position": "0", "time": 30},
                {"text": "卧槽2", "color": "green", "size": "3", "position": "0", "time": 30},
                {"text": "卧槽3", "color": "green", "size": "3", "position": "0", "time": 40},
                {"text": "卧槽666", "color": "green", "size": "3", "position": "0", "time": 60}
    ];
        $('#danmu').danmu("addDanmu", newd);
    }
    //向后端添加弹幕测试  这个函数没有调用
    function insert(){
        var newd= { "text":"new2" , "color":"green" ,"size":"1","position":"0","time":50};
        str_newd=JSON.stringify(newd);
        $.post("stone.php",{danmu:str_newd},function(data,status){alert(data)});
    }
    //从后端获取到弹幕并添加
    function query() {
        //$.get("query.php",function(data,status){
        var data=[
            { text:"这是滚动弹幕" ,color:"white",size:1,position:0,time:2}
            ,{ text:"这是顶部弹幕" ,color:"yellow" ,size:1,position:1,time:2}
            ,{ text:"这是底部弹幕" , color:"red" ,size:1,position:2,time:2}
        ];
        var obj = JSON.parse(data);
        var danmu_from_sql=eval(data);
        for (var i=0;i<danmu_from_sql.length;i++){
            /*var danmu_ls=eval('('+danmu_from_sql[i]+')');
             $('#danmu').danmu("addDanmu",danmu_ls);*/
            alert(obj);
        }
        //});
    }
    //发送弹幕，使用了文档README.md第7节中推荐的方法
    function send(){
        var text = document.getElementById('text').value;
        var color = document.getElementById('color').value;
        var position = document.getElementById('position').value;
        var time = $('#danmu').data("nowTime")+1;
        var size =document.getElementById('text_size').value;
        var text_obj='{ "text":"'+text+'","color":"'+color+'","size":"'+size+'","position":"'+position+'","time":'+time+'}';
        $.post("stone.php",{danmu:text_obj});
        var text_obj='{ "text":"'+text+'","color":"'+color+'","size":"'+size+'","position":"'+position+'","time":'+time+',"isnew":""}';
        var new_obj=eval('('+text_obj+')');
        $('#danmu').danmu("addDanmu",new_obj);
        document.getElementById('text').value='';
    }
    //调整透明度函数
    function op(){
        var op=document.getElementById('op').value;
        $('#danmu').danmu("setOpacity",op/100);
    }

    //调隐藏 显示
    function changehide() {
        var op = document.getElementById('op').value;
        op = op / 100;
        if (document.getElementById("ishide").checked) {
            $("#danmu").danmu("setOpacity",1)
        } else {
            $("#danmu").danmu("setOpacity",0)

        }
    }

    //设置弹幕时间
    function settime(){
        var t=document.getElementById("set_time").value;
        t=parseInt(t)
        $('#danmu').danmu("setTime",t);
    }
</script>

</body>
</body>
</html>
