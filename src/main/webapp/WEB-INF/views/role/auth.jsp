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
    <link rel="stylesheet" type="text/css" href="${staticPath}/static/plugins/zTree/v3/css/zTreeStyle/zTreeStyle.css">

</head>
<body>

<section class="content" >
    <div class="row">
        <div class="col-md-12">
            <div class="box box-widget">
                <div class="box-body">
                    <form class="form-horizontal layui-form" action="${ path }/sysRole/insertRole">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">角色菜单</label>
                            <div class="col-sm-10">
                                <ul id="treeDemo" class="ztree"></ul>
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
<script src="${staticPath}/static/plugins/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script>
    var setting = {
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true,
                pIdKey: "parentId"
            }
        }
    };

    var zNodes =[
        { id:1, parentId:0, name:"随意勾选 1", open:true},
        { id:11, parentId:1, name:"随意勾选 1-1", open:true},
        { id:111, parentId:11, name:"随意勾选 1-1-1"},
        { id:112, parentId:11, name:"随意勾选 1-1-2"},
        { id:12, parentId:1, name:"随意勾选 1-2", open:true},
        { id:121, parentId:12, name:"随意勾选 1-2-1"},
        { id:122, parentId:12, name:"随意勾选 1-2-2"},
        { id:2, parentId:0, name:"随意勾选 2", checked:true, open:true},
        { id:21, parentId:2, name:"随意勾选 2-1"},
        { id:22, parentId:2, name:"随意勾选 2-2", open:true},
        { id:221, parentId:22, name:"随意勾选 2-2-1", checked:true},
        { id:222, parentId:22, name:"随意勾选 2-2-2"},
        { id:23, parentId:2, name:"随意勾选 2-3"}
    ];

    var code;

    function setCheck() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
            py = $("#py").attr("checked")? "p":"",
            sy = $("#sy").attr("checked")? "s":"",
            pn = $("#pn").attr("checked")? "p":"",
            sn = $("#sn").attr("checked")? "s":"",
            type = { "Y":py + sy, "N":pn + sn};
        zTree.setting.check.chkboxType = type;
        showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
    }
    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>"+str+"</li>");
    }

    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });
</script>
</body>
</html>
