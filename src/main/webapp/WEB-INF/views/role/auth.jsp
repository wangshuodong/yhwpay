<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>系统首页</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@ include file="/commons/importCss.jsp" %>

</head>
<body>

<section class="content">
    <form class="form-horizontal layui-form" action="${ path }/sysRole/insertRole">
        <div class="layui-collapse">
            <div class="layui-colla-item">
                <c:forEach items="${treeMenu}" var="item">
                    <h2 class="layui-colla-title">${item.menuName}</h2>
                    <c:forEach items="${item.children}" var="two">
                    <div class="layui-colla-content layui-show">
                        <input type="checkbox" name="" title="${two.menuName}" lay-skin="primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <c:forEach items="${two.children}" var="three">
                            <input type="checkbox" name="" title="${three.menuName}" lay-skin="primary">
                        </c:forEach>
                    </div>
                    </c:forEach>
                </c:forEach>
            </div>
        </div>
    </form>
</section>

<%@ include file="/commons/importJs.jsp" %>
<script>
    layui.use('element', function () {
        var element = layui.element;


    });
</script>
</body>
</html>
