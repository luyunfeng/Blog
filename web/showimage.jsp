<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/3/5
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="basepath.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <!--暂时没用这个页面-->
    <jsp:include page="include_head.jsp"/>
</head>
<body class="home-template" style="background-image:url('${pageContext.request.contextPath}/res/img/articlebg.jpg');">
<jsp:include page="include_headr.jsp"/>

<!-- start site's main content area -->
<section class="content-wrap">
    <div class="row">
        <div class="col-xs-6 col-md-3">
            <a href="#" class="thumbnail">
                <img src="${pageContext.request.contextPath}/res/img/touxiang.jpeg">
            </a>
        </div>
        <div class="col-xs-6 col-md-3">
            <a href="#" class="thumbnail">
                <img src="${pageContext.request.contextPath}/res/img/touxiang.jpeg">
            </a>
        </div>
        <div class="col-xs-6 col-md-3">
            <a href="#" class="thumbnail">
                <img src="${pageContext.request.contextPath}/res/img/touxiang.jpeg">
            </a>
        </div>
    </div>
</section>
<jsp:include page="include_footer.jsp"/>
</body>
</html>
