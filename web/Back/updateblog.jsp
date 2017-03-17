<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/17
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="basepath.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="include_head.jsp"/>
</head>
<body class="home-template">
<jsp:include page="include_headr.jsp"/>


<div style="font-size: 13px;margin: 10px 5px">
    <form action="${pageContext.request.contextPath}/Back/updateblog.action" method="post">
        <table border="1" width="100%">
            <tr>
                <td>
                    <span style="font-size:20px" class="label label-warning">
                        数据库中的id号
                    </span>
                </td>
                <td>
                    <span style="font-size:20px" class="label label-warning">
                        标题
                    </span>
                </td>
                <td><span style="font-size:20px" class="label label-warning">
                        标签tag(多个标签空格分开)
                    </span>
                </td>
            </tr>


            <td><input type="text" name="id" value="${blog.id}" readonly="true"/></td>
            <td><input type="text" style="width: 100%" name="title" value="${blog.title}"/></td>
            <td><input type="text" style="width: 100%" name="tags" id="tags" value=""/></td>

            <tr>
            </tr>
            <tr>
                <td colspan="3">
                    <textarea id="content" name="content" style="width: 100% ;height: 300px">
                        ${blog.content}
                    </textarea>
                </td>
                <script type="text/javascript">

                    var ue = UE.getEditor('content');
                    $(document).ready(function () {
                        var tags = "";
                        <c:forEach items="${tags}" varStatus="i" var="item">
                        tags += "${item.tagName} "
                        </c:forEach>
                        $("#tags").val(tags);
                    });
                </script>
            </tr>

            <tr>
                <td colspan="3" align="center">
                    <input type="submit"
                           style="width: 50%"
                           onclick="if (confirm('确定提交吗？')) return true; else return false;"
                           value="提交"
                           class="btn btn-danger"
                    />
                </td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>
