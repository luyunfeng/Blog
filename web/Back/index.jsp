<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/9
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="basepath.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="include_head.jsp"/>
</head>
<body class="home-template">
<jsp:include page="include_headr.jsp"/>
<!--从session 读取用户登录的信息 显示在这里-->
<c:choose>
    <c:when test="${empty sessionScope.username }">
        <%
            response.sendRedirect("/Back/login.jsp");
        %>
    </c:when>
    <c:otherwise>
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;登陆身份:&nbsp;&nbsp;${sessionScope.username}</h1>
        <hr2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现在你可以管理的你的个人博客了</hr2>
    </c:otherwise>
</c:choose>

</body>
</html>