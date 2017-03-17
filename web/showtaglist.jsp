<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/23
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
            <main class="col-md-8 main-content" id="taglist">
                <!-- Single button -->
                <!--div class="btn-group">
                    <button style="width: 600px" type="button" class="btn btn-info dropdown-toggle"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Action
                        <span class="caret"></span>
                    </button>
                    <ul style="width: 600px" class="dropdown-menu">
                        <li><a href="#">ction</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div>
                <br>
                <br-->
            </main>
            <script type="text/javascript">
                $(document).ready(function () {
                    var url = "${pageContext.request.contextPath}/Home/getalltag.action";
                    var sendData = null;
                    $.post(url, sendData, function (backData, textStaut, ajax) {
                        //将字符串转换成json对象

                        var obj = JSON.parse(ajax.responseText);

                        $.each(obj, function (i, tag) {
                            var html = "<div class=\"btn-group\">" +
                                "<button style=\"width: 600px\" type=\"button\" class=\"";
                                if((i+1)%5==1){
                                    html+="btn btn-default dropdown-toggle";
                                }else if((i+1)%5==2){
                                    html+="btn btn-info dropdown-toggle";
                                }
                                else if((i+1)%5==3){
                                    html+="btn btn-danger dropdown-toggle";
                                }
                                else if((i+1)%5==4){
                                    html+="btn btn-success dropdown-toggle";
                                }else {
                                    html+="btn btn-warning dropdown-toggle";
                                }

                                html+="\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">" +
                                tag.tagName +
                                "<span class=\"caret\"></span></button> <ul style=\"width: 600px\" class=\"dropdown-menu\">";
                            $.each(tag.blogList, function (j, blog) {
                                html += "<li><a href=\"${pageContext.request.contextPath}/Home/getblogbyid.action?id=" +
                                    blog.id + "\">" +
                                    blog.title +
                                    "</a></li>";
                            });
                            html+=" </ul> </div> <br> <br>";
                            $("#taglist").append(html);
                        });

                    });
                });
            </script>

            <jsp:include page="include_rigth.jsp"/>
        </div>
    </div>
</section>
<jsp:include page="include_footer.jsp"/>
</body>
</html>
