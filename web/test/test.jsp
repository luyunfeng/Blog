<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="cn.blog.entity.Blog" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    List list = new ArrayList();
    for (int i = 0; i < 10; i++) {
        List list1=new ArrayList();
        for (int j = 0; j < 10; j++){
            Blog blog=new Blog("标题"+j, "releaseDate", "content");
            list1.add(blog);
        }
            list.add(list1);
    }
    session.setAttribute("list", list);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <style type="text/css">
        tr.foreach_tr1 {
            background-color: #D7E9FD;
            color: black;
        }

        tr.foreach_tr2 {
            background-color: #A7DBFF;
            color: black;
        }
    </style>
</head>

<body>


    <c:forEach items="${tags}" varStatus="i" var="item">
            <h2>${item.id}</h2><br/>
    </c:forEach>


    <c:forEach items="${tags}" varStatus="i" var="item">
        <span class="glyphicon glyphicon-tags"/>&nbsp;
        <span class="label label-info">${item.id}</span>
    </c:forEach>

</body>
</html>