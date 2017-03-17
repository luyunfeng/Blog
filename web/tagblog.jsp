<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/27
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="basepath.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="include_head.jsp"/>
</head>
<body class="home-template" style="background-image:url('/res/img/articlebg.jpg');">
<jsp:include page="include_headr.jsp"/>

<!-- start site's main content area -->
<section class="content-wrap">
    <div class="container">
        <div class="row">
            <main class="col-md-8 main-content">
                <div style="text-align: center;"><span class="label label-success" style="font-size:30px">标签:${tagname}相关的文章</span></div>
                <br>
                <div style="font-size: 30px;margin: 10px 5px ;text-align: center;">
                    <ol>
                        <div id="titlelist">
                            <!--li>
                                <span class="label label-warning"><a class="alikebutton" href="#">这是标题啊</a></span>
                            </li-->
                            <br/>
                        </div>
                    </ol>
                </div>
            </main>
            <script type="text/javascript">
                $(document).ready(function () {
                    var html = "";
                    <c:forEach items="${blogs}" varStatus="i" var="item">
                    html += "<li><span class=\"label label-warning\">" +
                        "<a class=\"alikebutton\" href=\"" +
                        "${pageContext.request.contextPath}/Home/getblogbyid.action?id=" +
                       ${item.id}+
                        "\">${item.title}</a>"+
                        "</span></li> <br/>";
                    </c:forEach>
                    $("#titlelist").append(html);
                });
            </script>
            <jsp:include page="include_rigth.jsp"/>
        </div>
    </div>
</section>
<jsp:include page="include_footer.jsp"/>
</body>
</html>