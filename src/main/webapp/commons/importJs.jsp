<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- jQuery 3 -->
<script src="${staticPath}/static/plugins/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${staticPath}/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck 1.0.1 -->
<%--<script src="${staticPath}/static/plugins/iCheck/icheck.min.js"></script>--%>
<!-- nice-validator-1.0.8 -->
<%--<script src="${staticPath}/static/plugins/nice-validator-1.1.3/dist/jquery.validator.js?local=zh-CN"></script>--%>

<!-- AdminLTE App -->
<script src="${staticPath}/static/app/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${staticPath}/static/app/js/demo.js"></script>

<script src="${staticPath}/static/plugins/layui/layui.js"></script>
<!-- 自定义系统初始化话JS -->
<%--<script src="${staticPath}/static/app/js/init.js"></script>



<script src="${staticPath}/static/app/js/x-layui.js" charset="utf-8"></script>--%>

<script type="text/javascript">
    var layer;
    layui.use('layer', function(){
        layer = layui.layer;
    });
    /*layui.config({
        version:true,
        debug:true,
        base: 'static/app/js/modules/'
    }).use('xform'); //加载入口*/
    <%--layui.config({--%>
        <%--dir: '${staticPath }/static/plugins/layui/' //layui.js 所在路径（注意，如果是script单独引入layui.js，无需设定该参数。），一般情况下可以无视--%>
        <%--, version: false //一般用于更新模块缓存，默认不开启。设为true即让浏览器不缓存。也可以设为一个固定的值，如：201610--%>
        <%--, debug: false //用于开启调试模式，默认false，如果设为true，则JS模块的节点会保留在页面--%>
        <%--, base: '${staticPath }/commons/js/' //设定扩展的Layui模块的所在目录，一般用于外部模块扩展--%>
    <%--});--%>

</script>

