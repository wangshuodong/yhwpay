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
        <div class="col-md-12">
            <div class="box box-widget">
                <div class="box-body">
                    <form class="form-horizontal layui-form" action="${ path }/sysRole/insertRole">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色名</label>
                            <div class="col-sm-10">
                                <input type="text" name="roleName" lay-verify="required|check" placeholder="角色名"
                                       autocomplete="off" class="layui-input" check-url="${ path }/sysRole/checkRole" check-id="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色描述</label>
                            <div class="col-sm-10">
                                <input type="text" name="roleDesc" placeholder="角色描述"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色类型</label>
                            <div class="col-sm-10">
                                <select name="roleType" lay-verify="required">
                                    <option value=""></option>
                                    <option value="99">系统管理员</option>
                                    <option value="1">服务商</option>
                                    <option value="2">物业</option>
                                    <option value="3">小区</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色状态</label>
                            <div class="col-sm-10">
                                <input type="radio" name="roleState" value="1" title="启用" checked>
                                <input type="radio" name="roleState" value="0" title="禁用" >
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button class="layui-btn" lay-submit lay-filter="save">保 存</button>
                                <a class="layui-btn btn-default" href="javascript:parent.layer.closeAll('iframe');">取 消</a>
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

</script>
</body>
</html>
