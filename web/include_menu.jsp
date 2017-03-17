<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- start navigation -->
<nav class="main-navigation" style="background-image:url('${pageContext.request.contextPath}/res/img/articlebg.jpg');">
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
                            <a href="/">首页</a>
                        </li>
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/showtaglist.jsp">归档浏览</a>
                        </li>
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/leavemsg.jsp">留言</a>
                        </li>
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/Public/aboutme.action">关于我</a>
                        </li>
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/Back/index.jsp" target="_blank">进入后台</a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>