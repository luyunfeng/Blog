<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/26
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/res/css/register-login.css">
    <jsp:include page="include_head.jsp"/>

</head>

<body>
<!-- start header -->
<header class="main-header"  style="background-image: url(${pageContext.request.contextPath}/res/img/headerbg.jpeg)">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1 style="color: black "> Blog后台管理系统</h1>
                <img src="${pageContext.request.contextPath}/res/img/headerbg.jpeg"  class="hide">
            </div>
        </div>
    </div>
</header>
<!-- end header -->

<div class="cent-box">
    <div class="cont-main clearfix">
        <div class="index-tab">
            <div class="index-slide-nav">
                <a href="#" class="active">登录</a>
                <div class="slide-bar"></div>
            </div>
        </div>
       <form action="${pageContext.request.contextPath}/Back/login.action" method="post">
        <div class="login form">
            <div class="group">
                <div class="group-ipt email">
                    <input type="text" name="username" id="username" value="${username}" class="ipt" placeholder="登陆账号" required>
                </div>
                <div class="group-ipt password">
                    <input type="password" name="password" id="password"  value="${password}" class="ipt" placeholder="输入您的登录密码" required>
                </div>
                <div class="group-ipt verify">
                    <input type="text" name="verify" id="verify" class="ipt" placeholder="输入验证码" required>
                    <a href="javascript:_change()">
                        <img id="vCode" class="imgcode" src="<c:url value='${pageContext.request.contextPath}/Back/getvcode.action'/>"/>
                    </a>
                </div>
                <script type="text/javascript">
                    // 点击 图片 换验证码
                    function _change() {
                        var ele = document.getElementById("vCode");
                        ele.src = "<c:url value='${pageContext.request.contextPath}/Back/getvcode.action'/>?xxx="
                            + new Date().getTime();

                    }
                </script>
            </div>
        </div>
           <br/>
           <div style="text-align: center;">
               <span class="label label-danger" style="font-size:30px">${message}</span>
           </div>
        <div class="button">
            <button type="submit" class="login-btn register-btn" id="button" >登录</button>
        </div>
       </form>
        <div class="remember clearfix">
            <label class="remember-me"><span class="icon"><span class="zt"></span></span><input type="checkbox" name="remember-me" id="remember-me" class="remember-mecheck" checked>记住我</label>
            <label class="forgot-password">
                <a href="#">忘记密码？</a>
            </label>
        </div>
    </div>
</div>

</body>
</html>
