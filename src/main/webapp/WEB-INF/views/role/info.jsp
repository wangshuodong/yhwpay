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
<body style="background-color: #ecf0f5;">

<section class="content" >
    <div class="row">
        <div class="col-md-8">
            <div class="box box-widget">
                <div class="box-body">
                    <form class="form-horizontal layui-form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色名</label>
                            <div class="col-sm-10">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入角色名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色描述</label>
                            <div class="col-sm-10">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入角色名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色类型</label>
                            <div class="col-sm-10">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入角色名"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色状态</label>
                            <div class="col-sm-10">
                                <input type="radio" name="sex" value="男" title="启用" checked>
                                <input type="radio" name="sex" value="女" title="禁用" >
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button class="layui-btn">保 存</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</section>

<%@ include file="/commons/importJs.jsp" %>
<script>
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</script>
</body>
</html>
