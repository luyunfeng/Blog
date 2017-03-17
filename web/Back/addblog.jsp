<%--
  Created by IntelliJ IDEA.
  User: lucode
  Date: 2017/2/9
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="basepath.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="include_head.jsp"/>
</head>
<body class="home-template">
<jsp:include page="include_headr.jsp"/>
<div style="text-align: center;"><span class="label label-success" style="font-size:30px">${message}</span></div>
<div style="font-size: 13px;margin: 10px 5px">
    <form action="${pageContext.request.contextPath}/Back/addblog.action" method="post">
        <table border="1" width="100%">
            <tr>
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
            <td><input type="text" style="width: 100%" name="title"/></td>
            <td><input type="text" style="width: 100%" name="tags"/></td>
            <tr>

            </tr>
            <tr>
                <td colspan="2">
                    <textarea id="content" name="content" style="width: 100% ;height: 300px"></textarea>
                </td>
                <script type="text/javascript">
                    var ue = UE.getEditor('content');
                </script>
            </tr>

            <tr>
                <td colspan="2" align="center">
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