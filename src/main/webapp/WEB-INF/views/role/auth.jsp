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
                <h2 class="layui-colla-title">系统设置</h2>
                <div class="layui-colla-content layui-show">
                    <input type="checkbox" name="" title="角色管理" lay-skin="primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" name="" title="添加角色" lay-skin="primary">
                    <input type="checkbox" name="" title="批量删除" lay-skin="primary">
                    <input type="checkbox" name="" title="授权" lay-skin="primary">
                    <input type="checkbox" name="" title="修改" lay-skin="primary">
                    <input type="checkbox" name="" title="删除" lay-skin="primary">
                </div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title">李清照</h2>
                <div class="layui-colla-content layui-show">内容区域</div>
            </div>
            <div class="layui-colla-item">
                <h2 class="layui-colla-title">鲁迅</h2>
                <div class="layui-colla-content layui-show">内容区域</div>
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
