<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/26
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="basepath.jsp"%>
<!-- start navigation -->
<nav class="main-navigation">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="navbar-header">
                        <span class="nav-toggle-button collapsed" data-toggle="collapse" data-target="#main-menu">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-bars"></i>
                        </span>
                </div>
                <div class="collapse navbar-collapse" id="main-menu">
                    <ul class="menu">
                        <li class="nav-current" role="presentation">
                            <a href="${pageContext.request.contextPath}/Back">后台管理</a>
                        </li>
                        <li class="nav-current" role="presentation">
                            <a href="${pageContext.request.contextPath}/Back/addblog.jsp">撰写博客</a>
                        </li>
                        <li class="nav-current" role="presentation">
                            <a href="${pageContext.request.contextPath}/Back/bloglist.jsp">文章管理</a>
                        </li>
                        <li class="nav-current" role="presentation">
                            <a href="${pageContext.request.contextPath}/Back/leavemsglist.jsp">留言管理</a>
                        </li>
                        <li class="nav-current" role="presentation">
                            <a href="${pageContext.request.contextPath}/Back/friendlink.jsp">友链管理</a>
                        </li>
                        <li class="nav-current" role="presentation">
                            <a href="${pageContext.request.contextPath}/Back/personalinfo.jsp">个人信息</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- end navigation -->