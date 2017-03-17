<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/22
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="include_head.jsp"/>
</head>
<body class="post-template" style="background-image:url('${pageContext.request.contextPath}/res/img/articlebg.jpg');">
<jsp:include page="include_menu.jsp"/>

<!-- start site's main ontent area -->
<section class="content-wrap">
    <div class="container">
        <div class="row">

            <main class="col-md-8 main-content">

                <article id="72" class="post" style="background-image:url('/res/img/bamboo.jpg');">

                    <header class="post-head">
                        <h1 class="post-title">${blog.title}</h1>
                    </header>
                    <br/>

                    <section class="post-content">
                        ${blog.content}
                    </section>
                </article>
            </main>

            <jsp:include page="include_danmu.jsp"/>
        </div>
    </div>
</section>


<jsp:include page="include_footer.jsp"/>

</body>
</html>
