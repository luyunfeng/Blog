<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/8
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  pageEncoding="UTF-8" %>
<%@ include file="basepath.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="include_head.jsp"/>

</head>
<body class="home-template" style="background-image:url('${pageContext.request.contextPath}/res/img/articlebg.jpg');">
<jsp:include page="include_headr.jsp"/>

<!-- start site's main content area -->
<section class="content-wrap">
    <div class="container">
        <div class="row">
            <main class="col-md-8 main-content">
                <div id="article">
                </div>
                <!-- List<Blog>转JSON
                注意 这里面用的是瀑布加载方式(无限拉成网页直到全部加载结束)
                当滑动条 到一半的时候尝试获取下面两篇文章()
                -->
                <script type="text/javascript">
                    $(document).ready(function () {
                        var url = "${pageContext.request.contextPath}/Public/getallblog.action";
                        var sendData = null;
                        $.post(url, sendData, function (backData, textStaut, ajax) {
                            var obj = JSON.parse(ajax.responseText);
                            // 得到 json 的数量
                            var jsonNum=JSONLength(obj);
                            // 目前显示条数
                            var t=0;
                            //每次滑动 显示显示条数
                            var page=2;
                            $.each(obj, function (i, item) {
                                if(i<page) {
                                    add(item);
                                    t++;
                                }else {
                                    window.onscroll=function(){
                                        if(checkscrollside()){
                                            var k=0;
                                            $.each(obj, function (j, item2) {
                                                if (j>=t&&j<t+page) {
                                                    add(item2);
                                                    k++;
                                                }
                                            });
                                            t+=k;
                                        }
                                    }
                                }
                            });
                        });
                    });
                    //得到 json 数据的长度
                    function JSONLength(obj) {
                        var size = 0, key;
                        for (key in obj) {
                            if (obj.hasOwnProperty(key)) size++;
                        }
                        return size;
                    };
                    // 将 json 中的数据 传入 构建一个div id="article"盒子
                    function add(item) {
                        var html = "";
                        html += "<article style=\"background-image:url(\'/res/img/bamboo.jpg\');\" " +
                            "id=72 class=\"post\"> <div class=\"post-head\">" +
                            " <h2 class=\"post-title\">" +
                            "<a href=\"" + "${pageContext.request.contextPath}/Home/getblogbyid.action?id=" +
                            item.id +
                            "\">" +
                            item.title +
                            "</a> </h2> <div class=\"post-meta\"> &bull;<time class=\"post-date\">" +
                            item.releaseDate +
                            "</time> </div> </div> <footer class=\"post-footer clearfix\"> ";
                        $.each(item.tagList, function (j, tag) {
                            html += "<span class=\"glyphicon glyphicon-tags\">&nbsp;" +
                                "<span class=\"label label-info\">" +
                                tag.tagName +
                                "</span></span>&nbsp;&nbsp;&nbsp;&nbsp;";
                        });
                        html += "</footer> </article>";
                        $("#article").append(html);

                    }
                    // 滑动检测
                    function checkscrollside(){
                        var $aPin = $( "#article>article" );
                        // 最后一个块框的距离网页顶部+自身高的一半(实现未滚到底就开始加载)
                        var lastPinH = $aPin.last().get(0).offsetTop + Math.floor($aPin.last().height()/2);
                        var scrollTop = $( window ).scrollTop()//注意解决兼容性
                        var documentH = $( document ).width();//页面高度
                        return (lastPinH < scrollTop + documentH ) ? true : false;//到达指定高度后 返回true，触发waterfall()函数
                    }
                </script>

            </main>
            <jsp:include page="include_rigth.jsp"/>
        </div>
    </div>
</section>
<jsp:include page="include_footer.jsp"/>
</body>
</html>