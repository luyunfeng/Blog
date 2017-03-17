<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/8
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="basepath.jsp" %>
<aside class="col-md-4 sidebar">
    <div class="widget" style="background-image:url('${pageContext.request.contextPath}/res/img/bamboo.jpg');">
        <input type="text" max="10" id="keyword"
               placeholder="输入要搜索的内容"
               style="background-color:#f0ad4e;border:1px solid #FFFFFF">
        <a id="search_id" class="btn btn-warning">全文搜索</a>
        <script>

            // a标签的点击事件(jQuery 完成)
            $("#search_id").click(function () {

                var keyword = document.getElementById('keyword').value;
                keyword = Trim(keyword, "g");
                if (keyword == "") {
                    alert("关键字不能为空");
                    return false;
                }
                var url = "${pageContext.request.contextPath}" +
                    "/Home/search.action?keyword=" + keyword;
                $('#search_id').attr('href', url);
            });


            // 去掉所有的空格
            function Trim(str, is_global) {
                var result;
                result = str.replace(/(^\s+)|(\s+$)/g, "");
                if (is_global.toLowerCase() == "g") {
                    result = result.replace(/\s/g, "");
                }
                return result;
            }
        </script>
    </div>
    <div style="background-image:url('/res/img/bamboo.jpg');" class="widget" id="aboutme">
    </div>

    <!--异步加载 博主信息-->
    <script type="text/javascript">
        $(document).ready(function () {
            var url = "${pageContext.request.contextPath}/Home/blogerinfo.action";
            var sendData = null;
            $.post(url, sendData, function (backData, textStaut, ajax) {
                //alert(ajax.responseText);
                var nickname = backData.nickname;
                var sign = backData.sign;
                var touxiang = backData.touxiang;
                var html = "<h4 class=\"title\">关于我</h4>" +
                    "<div id=\"img\"><img src=\"${pageContext.request.contextPath}" + touxiang + "\" class=\"img-circle\"width=\"50%\" height=\"50%\"  " +
                    "style='vertical-align:middle;' /></div><br/><br/>" +
                    "<span class=\"label label-warning\">你可以叫我: " + nickname + "</span><br/><br/>" +
                    " <span class=\"label label-success\">" + sign + "</span>";
                $("#aboutme").html(html);
            });
        });
    </script>
    <!--头像图片旋转 代码-->
    <script>
        var Img = function () {
            var T$ = function (id) {
                return document.getElementById(id);
            }
            var ua = navigator.userAgent,
                isIE = /msie/i.test(ua) && !window.opera;
            var i = 0, sinDeg = 0, cosDeg = 0, timer = null;
            var rotate = function (target, degree) {
                target = T$(target);
                var orginW = target.clientWidth, orginH = target.clientHeight;
                clearInterval(timer);
                function run(angle) {
                    if (isIE) { // IE
                        cosDeg = Math.cos(angle * Math.PI / 180);
                        sinDeg = Math.sin(angle * Math.PI / 180);
                        with (target.filters.item(0)) {
                            M11 = M22 = cosDeg;
                            M12 = -(M21 = sinDeg);
                        }
                        target.style.top = (orginH - target.offsetHeight) / 2 + 'px';
                        target.style.left = (orginW - target.offsetWidth) / 2 + 'px';
                    } else if (target.style.MozTransform !== undefined) {  // Mozilla
                        target.style.MozTransform = 'rotate(' + angle + 'deg)';
                    } else if (target.style.OTransform !== undefined) {   // Opera
                        target.style.OTransform = 'rotate(' + angle + 'deg)';
                    } else if (target.style.webkitTransform !== undefined) { // Chrome Safari
                        target.style.webkitTransform = 'rotate(' + angle + 'deg)';
                    } else {
                        target.style.transform = "rotate(" + angle + "deg)";
                    }
                }

                timer = setInterval(function () {
                    i += 10;
                    run(i);
                    if (i > degree - 1) {
                        i = 0;
                        clearInterval(timer);
                    }
                }, 10);
            }
            return {rotate: rotate}
        }();
        window.onload = function () {
            Img.rotate('aboutme', 360);
            document.getElementById('aboutme').onclick = function () {
                Img.rotate('aboutme', 360);
            }

        }
    </script>

    <!--热门标签模块-->
    <div class="widget" style="background-image:url('${pageContext.request.contextPath}/res/img/bamboo.jpg');">
        <h4 class="title">热门标签</h4>
        <div class="content tag-cloud" id="taglistxxx">
            <!--a href="/Home/getblogbytagname.action?tagname=xxx">
                Laravel 5.2
            </a-->
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var url = "${pageContext.request.contextPath}/Home/gethottag.action";
            //post 请求发送数据,为空
            var sendData = null;
            // 开始发送数据
            $.post(url, sendData, function (backData, textStaut, ajax) {
                //将返回来的字符串数据 转换成json对象(必须严格遵循 json 格式才能完成转换)
                var obj = JSON.parse(ajax.responseText);
                $.each(obj, function (i, tag) {
                    // 拼接好内容 添加到 html
                    var html = "<a href=\"${pageContext.request.contextPath}/Home/getblogbytagname.action?tagname=" +
                        tag.tagName + "\">" +
                        tag.tagName + "</a>";
                    $("#taglistxxx").append(html);
                });
            });
        });
    </script>


    <!--友链模块-->
    <div class="widget" style="background-image:url('${pageContext.request.contextPath}/res/img/bamboo.jpg');">
        <h4 class="title">友情链接</h4>
        <div class="content tag-cloud" id="friendlink">
        </div>
    </div>
    <!--异步加载 友链-->
    <script type="text/javascript">
        $(document).ready(function () {
            var url = "${pageContext.request.contextPath}/Public/getallfriendlink.action";
            var sendData = null;
            $.post(url, sendData, function (backData, textStaut, ajax) {
                //alert(ajax.responseText);
                // 转成 json 对象
                var json = JSON.parse(ajax.responseText);
                /*[{"id":1,
                 "linkname":"百度一下",
                 "linkurl":"www.baidu.com",
                 "mail":"12345@baidu.com"}]
                 */
                $.each(json, function (i, link) {
                    var html = "<a href=\"http://" +
                        link.linkurl +
                        "\" target=\"_blank\">" +
                        link.linkname +
                        "</a><br/>";
                    $("#friendlink").append(html);
                });

            });
        });
    </script>


</aside>

