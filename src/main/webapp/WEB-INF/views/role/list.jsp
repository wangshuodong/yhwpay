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
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入标题"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入标题"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入标题"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入标题"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入标题"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <div class="col-sm-6 col-lg-2">
                                <button class="layui-btn">查询</button>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-xs-12">
                                <a class="layui-btn" id="test2">添加角色</a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="box-footer">
                    <table id="test" lay-filter="layui-hide"></table>
                </div>
            </div>
        </section>

    </div>
</div>

<script type="text/html" id="roleStateTpl">
        <input type="checkbox" name="roleState" value="{{String(d.id)}}" lay-skin="switch" lay-text="启用|禁用"
               lay-filter="roleStateFilter" {{ d.roleState == 1 ? 'checked' : '' }}>
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
<%@ include file="/commons/importJs.jsp" %>
<script>
    layui.use(['table', 'form'], function () {
        var table = layui.table
        ,form = layui.form;
        table.render({
            elem: '#test'
            , url: '${staticPath}/sysRole/dataGrid'
            , cols: [[
                {type:'checkbox'}
                , {field: 'id', title: '角色名'}
                , {field: 'roleName', title: '角色名'}
                , {field: 'roleDesc', title: '角色描述'}
                , {field: 'roleType', title: '角色类型', templet: '#roleTypeTpl'}
                , {field: 'createTime', title: '创建时间'}
                , {field: 'roleState', title: '角色状态', templet: '#roleStateTpl'}
            ]]
            , page: true
            , skin: 'line'
            , even: true //开启隔行背景
        });
        //监听锁定操作
        form.on('switch(roleStateFilter)', function(obj){
            var n = 948573251449737217+"";
            alert(n+'');
            layer.tips(this.value + ' ' + this.name + '：'+ obj.elem.checked, obj.othis);
            $.ajax({
                type: 'POST',
                url: '${ path }/sysRole/updateRole',
                dataType: 'json',
                data:{
                    id : this.value + '',
                    roleState : obj.elem.checked
                },
                success: function(data){
                    if (!data.success) {
                        layer.msg(data.message);
                    }
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    });

    $('#test2').on('click', function () {
        layer.open({
            type: 2,
            title: '添加角色',
            maxmin: true,
//            shadeClose: true, //点击遮罩关闭层
            area: ['55%', '70%'],
            content: '${path}/sysRole/add'
        });
    });
</script>
</body>
</html>
