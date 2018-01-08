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
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
    <%@ include file="/commons/header.jsp" %>
    <%@ include file="/commons/menu.jsp" %>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                系统设置
                <small>角色管理</small>
            </h1>
        </section>

        <section class="content">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">角色列表</h3>
                </div>
                <div class="box-body">
                    <form class="layui-form" action="">
                        <div class="row">
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <button class="layui-btn layui-btn-normal">查询</button>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-xs-12">
                                <a class="layui-btn layui-btn-normal" id="test2">添加角色</a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="box-footer">
                    Footer
                </div>
            </div>
        </section>

    </div>
</div>
<%@ include file="/commons/importJs.jsp" %>
<script>
    $('#test2').on('click', function(){
        layer.open({
            type: 2,
            title: '添加角色',
            maxmin: true,
//            shadeClose: true, //点击遮罩关闭层
            area : ['55%' , '70%'],
            content: '${path}/sysRole/add'
        });
    });
</script>
</body>
</html>
