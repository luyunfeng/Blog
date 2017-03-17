<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/22
  Time: 15:59
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
        <div id="linklist">
            <!--li>
                <span class="label label-danger">
                    <a class="alikebutton"
                       onclick="if (confirm('确定提交吗？'))return true; else return false;"
                       href="#">删除</a>
                </span>
                &nbsp;&nbsp;&nbsp;&nbsp;网站名字:
                <span class="label label-primary">搜狐网</span>
                &nbsp;&nbsp;&nbsp;&nbsp;主页:
                <span class="label label-primary">www.sohu.com</span>
                &nbsp;&nbsp;&nbsp;&nbsp;联系人邮箱:
                <span class="label label-primary">12334444@qq.com</span>
            </li-->
            <br/>
        </div>
    </ol>
    <HR align=center width=300 color=#987cb9 SIZE=1>
    &nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-info">添加友链</span><br>
    <form action="${pageContext.request.contextPath}/Back/addfriendlink.action" method="post">
        &nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  id="linkname" name="linkname" placeholder="网站名字">
        <input type="text"  id="linkurl" name="linkurl" placeholder="网站主页">
        <input type="text"  id="mail" name="mail" placeholder="友链提供者邮箱"><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" class="btn btn-info"
        onclick="if (confirm('确定提交吗？'))return true; else return false;"
               value="提交">
    </form>
</div>

<!-- 转JSON 添加到 页面 -->
<script type="text/javascript">
    $(document).ready(function () {
        var url = "${pageContext.request.contextPath}/Public/getallfriendlink.action";
        var sendData = null;
        $.post(url, sendData, function (backData, textStaut, ajax) {
            //将字符串转换成json对象
            var obj = JSON.parse(ajax.responseText);
            /**
             * [
             * {"id":1,
             * "linkname":"百度一下",
             * "linkurl":"www.baidu.com",
             * "mail":"12345@baidu.com"}
             * ]
             */
            $.each(obj, function (i, link) {
                var html="<li> <span class=\"label label-danger\">"+
                "<a class=\"alikebutton\" onclick=\"if (confirm(\'确定提交吗？\'))return true; else return false;\""+
                "href=\"${pageContext.request.contextPath}/Back/deletefriendlink.action?id="+
                link.id+
                "\">删除</a></span> &nbsp;&nbsp;&nbsp;&nbsp;网站名字: <span class=\"label label-primary\">"+
                link.linkname+
                "</span> &nbsp;&nbsp;&nbsp;&nbsp;主页: <span class=\"label label-primary\">"+
                link.linkurl+
                "</span> &nbsp;&nbsp;&nbsp;&nbsp;联系人邮箱: <span class=\"label label-primary\">"+
                link.mail+
                "</span> </li> <br/>";
                $("#linklist").append(html);
            });
        });
    });
</script>
</body>
</html>
