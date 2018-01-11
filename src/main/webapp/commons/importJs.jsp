<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- jQuery 3 -->
<script src="${staticPath}/static/plugins/jquery.min.js"></script>
<%--<script src="${staticPath}/static/plugins/jquery.form.js"></script>--%>
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

<script type="text/javascript">
    var layer;
    layui.use('layer', function(){
        layer = layui.layer;
    });
    layui.config({
        version:true,//一般用于更新模块缓存，默认不开启。设为true即让浏览器不缓存。也可以设为一个固定的值，如：201610
        debug:true,//用于开启调试模式，默认false，如果设为true，则JS模块的节点会保留在页面
        base: '${staticPath}/static/app/js/'//设定扩展的Layui模块的所在目录，一般用于外部模块扩展
    }).use('xform'); //加载入口
</script>

