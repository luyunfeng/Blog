<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/21
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="basepath.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="include_head.jsp"/>
    <!--让 a 标签看起来像 按钮-->
    <style>

        .alikebutton{
            height: 21px;
            line-height: 21px;

            border-radius: 3px;
            color: #fff;
            display: inline-block;
            text-decoration: none;
            outline: none;
        }

    </style>
</head>
<body class="home-template">
<jsp:include page="include_headr.jsp"/>
<div style="text-align: center;"><span class="label label-success" style="font-size:30px">${message}</span></div>
<div style="font-size: 20px;margin: 10px 5px">
    <ol>
        <div id="leavemsglist">
            <!--li>
                <span class="label label-danger">
                    <a class="alikebutton"
                       onclick="if (confirm('确定提交吗？'))return true; else return false;"
                       href="#">删除</a>
                </span>
                &nbsp;&nbsp;&nbsp;&nbsp;客人:
                <span class="label label-primary">盖伦</span>
                &nbsp;&nbsp;&nbsp;&nbsp;时间:
                <span class="label label-primary">2017年02月21日 14:58:50</span>
                &nbsp;&nbsp;&nbsp;&nbsp;内容:
                <span class="label label-primary">这是内容</span>
            </li>
            <br/-->
        </div>
    </ol>
</div>
<!-- List<Leavemsg>转JSON -->
<script type="text/javascript">
    $(document).ready(function () {
        var url = "${pageContext.request.contextPath}/Public/getallleavemsg.action";
        var sendData = null;
        $.post(url, sendData, function (backData, textStaut, ajax) {
            //将字符串转换成json对象
            var obj = JSON.parse(ajax.responseText);
            /**
             [
             {
                 "id": 1,
                 "user": "盖伦",
                 "mail": "ooeoe@163.com",
                 "content": "哈哈",
                 "date": "2017年 12月30号"
             },
             {
                 "id": 2,
                 "user": "盖伦",
                 "mail": "1234@qq.com",
                 "content": "哈哈",
                 "date": "2017年02月21日 14:58:50"
             }
             */
            $.each(obj, function (i, leavemsg) {
                var html = "<li><span class=\"label label-danger\"><a class=\"alikebutton\" " +
                " onclick=\"if (confirm(\'确定提交吗？\'))return true; else return false;\""+
                "href=\"${pageContext.request.contextPath}/Back/deleteleavemsg.action?id="+
                leavemsg.id+
                "\">删除</a>"+
                "</span> &nbsp;&nbsp;&nbsp;&nbsp;客人: <span class=\"label label-primary\">"+
                leavemsg.user+
                "</span> &nbsp;&nbsp;&nbsp;&nbsp;时间: <span class=\"label label-primary\">"+
                leavemsg.date+
                "</span> &nbsp;&nbsp;&nbsp;&nbsp;内容: <span class=\"label label-primary\">"+
                leavemsg.content+
                "</span> </li> <br/>";

                $("#leavemsglist").append(html);
            });
        });
    });
</script>
</body>
</html>

