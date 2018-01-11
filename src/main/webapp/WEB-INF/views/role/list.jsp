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
            <%--<div class="callout callout-info">
                <h4>
                    系统设置
                    <small>角色管理</small>
                </h4>
            </div>--%>
        </section>

        <section class="content">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">角色列表</h3>
                </div>
                <div class="box-body">
                    <form class="layui-form">
                        <div class="row">
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="search" placeholder="请输入角色名称"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <button class="layui-btn" lay-submit lay-filter="search">查 询</button>
                                <button class="layui-btn" lay-submit lay-filter="search"><i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop" style="font-size: 30px;">&#x1002;</i></button>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-xs-12">
                                <a class="layui-btn dialog" data-url="${path}/sysRole/add" data-title="添加角色">添加角色</a>
                                <a class="layui-btn layui-btn-danger del-all" data-url="${path}/sysRole/deleteAll" data-title="添加角色">批量删除</a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="box-footer">
                    <table id="table" lay-filter="table"></table>
                </div>
            </div>
        </section>

    </div>
</div>

<script type="text/html" id="roleStateTpl">
    <input type="checkbox" name="roleState" value="{{String(d.id)}}" lay-skin="switch" lay-text="启用|禁用"
           lay-filter="roleStateFilter" {{ d.roleState== 1 ? 'checked' : '' }}>
</script>

<script type="text/html" id="roleTypeTpl">
    {{#  if(d.roleType == 99){ }}
    系统管理员
    {{#  } else if(d.roleType == 1){ }}
    服务商
    {{#  } else if(d.roleType == 2){ }}
    物业
    {{#  } else if(d.roleType == 3){ }}
    小区
    {{#  } }}
</script>

<script type="text/html" id="barDemo">
    <a href="javascript:;" class="layui-table-link" lay-event="edit" data-url="${ path }/sysRole/edit" data-title="修改角色">修改</a>
    <a href="javascript:;" class="layui-table-link" lay-event="del" data-url="${ path }/sysRole/deleteRole">删除</a>
</script>
<%@ include file="/commons/importJs.jsp" %>
<script src="${staticPath}/static/app/js/x-layui.js"></script>
<script src="${staticPath}/static/app/js/xtable.js"></script>
<script>
    layui.use(['table', 'form'], function () {
        var table = layui.table
            , form = layui.form;
        table.render({
            elem: '#table'
            , url: '${staticPath}/sysRole/dataGrid'
            , cols: [[
                {type: 'checkbox'}
                , {field: 'roleName', title: '角色名'}
                , {field: 'roleDesc', title: '角色描述'}
                , {field: 'roleType', title: '角色类型', templet: '#roleTypeTpl'}
                , {field: 'createTime', title: '创建时间'}
                , {field: 'roleState', title: '角色状态', templet: '#roleStateTpl'}
                , {field: 'right', title: '操作', align: 'center', toolbar: '#barDemo'}
            ]]
            , page: true
            , skin: 'line'
            , even: true //开启隔行背景
        });

        //修改角色状态
        form.on('switch(roleStateFilter)', function (obj) {
            //layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
            $.ajax({
                type: 'POST',
                url: '${ path }/sysRole/updateRole',
                dataType: 'json',
                data: {
                    id: this.value,
                    roleState: obj.elem.checked
                },
                success: function (data) {
                    if (data.code == 200) {
                        layer.alert(data.msg, {
                            icon: 1,
                            title: '成功提示'
                        });
                    } else {
                        layer.alert(data.msg, {
                            icon: 2,
                            title: '失败提示'
                        });
                    }
                }
            });
        });

    });
</script>
</body>
</html>
