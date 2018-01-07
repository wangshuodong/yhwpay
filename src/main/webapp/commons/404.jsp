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

    <div class="content-wrapper" id="main-content">
        <section class="content">
            <div class="error-page">
                <div>
                    <h2 class="headline text-yellow">  <i class="fa fa-warning text-yellow"></i> 404, Page not found.</h2>
                    <p> 糟糕,您访问的页面不存在,您可以点击这里 <a href="/index.html">返回首页</a>或刷新页面重试！
                    </p>
                </div>
            </div>
        </section>
    </div>

    <div class="control-sidebar-bg"></div>
</div>
<%@ include file="/commons/importJs.jsp" %>
<script>

</script>
</body>
</html>
