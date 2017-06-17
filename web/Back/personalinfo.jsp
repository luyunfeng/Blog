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
<div style="font-size: 13px; margin:0 auto; text-align: center; width: 50%" >
    <form
    action="${pageContext.request.contextPath}/Back/updateinfo.action"
    method="post">
          <span style="font-size:20px" class="label label-warning">用户登录</span>
        <input type="text" name="username" size="31" placeholder="不填表示不改"/><br/><br/>


        <span style="font-size:20px" class="label label-warning">登陆密码</span>
        <input type="password" name="password" size="31" placeholder="不填表示不改"/><br/><br/>


        <span style="font-size:20px" class="label label-warning">你的昵称</span>
        <input type="text" name="nickname" size="31" placeholder="不填表示不改"><br/><br/>


        <span style="font-size:20px" class="label label-warning">你的签名</span>
        <input type="text" name="sign" size="80" placeholder="不填表示不改"><br/><br/>

        <span style="font-size:20px" class="label label-warning">
                        上传头像
                   </span>

        <textarea id="touxiang" name="touxiang" placeholder="不填表示不改"></textarea>

        <script type="text/javascript">

            var editor = UE.getEditor('touxiang', {
                //这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
                toolbars: [['simpleupload']],
                //focus时自动清空初始化时的内容
                autoClearinitialContent: true,
                //关闭字数统计
                wordCount: false,
                //关闭elementPath
                elementPathEnabled: false,
                //默认的编辑区域高度
                initialFrameHeight: 100,
                initialFrameWidth:600
                //更多其他参数，请参考ueditor.config.js中的配置项
            });

        </script>
        <input type="submit"
               style="width: 100%"
               onclick="if (confirm('确定提交吗？')) return true; else return false;"
               value="提交"
               class="btn btn-danger"/>
    </form>
</div>




</body>
</html>