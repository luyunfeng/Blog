<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/9
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="basepath.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="include_head.jsp"/>
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
<div style="font-size: 30px;margin: 10px 5px">
    <ol>
        <div id="bloglist">
            <!--li>
                <span class="label label-warning"><a class="alikebutton" href="#">修改文章</a></span>
                <span class="label label-danger"><a class="alikebutton" href="#">删除文章</a></span>
                &nbsp;&nbsp;&nbsp;&nbsp;标题:
                <span class="label label-primary">这是文章标题demo</span>
            </li>
            <br/-->
        </div>
    </ol>
</div>
<!-- List<Blog>转JSON -->
<script type="text/javascript">
    $(document).ready(function () {
        var url = "${pageContext.request.contextPath}/Public/getallblog.action";
        var sendData = null;
        $.post(url, sendData, function (backData, textStaut, ajax) {
            //将字符串转换成json对象
            var obj = JSON.parse(ajax.responseText);
            $.each(obj, function (i, blog) {
                var html = "<li> <span class=\"label label-warning\">" +
                    "<a class=\"alikebutton\" href=\""+
                    "${pageContext.request.contextPath}/Back/getblogbyid.action?id="+
                    blog.id+
                    "\">修改文章</a></span> <span class=\"label label-danger\">" +
                    "<a onclick=\"if (confirm('确定提交吗？')) " +
                    "return true; else return false;\" " +
                    "class=\"alikebutton\" href=\"" +
                    "${pageContext.request.contextPath}/Back/deleteblog.action?id="+
                    blog.id+
                    "\">删除文章</a></span> &nbsp;&nbsp;&nbsp;&nbsp;标题:&nbsp;<span class=\"label label-primary\">" +
                    blog.title+
                    "</span></li><br/>";

                $("#bloglist").append(html);
            });

        });
    });
</script>
</body>
</html>