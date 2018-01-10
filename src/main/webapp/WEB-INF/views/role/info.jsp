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
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <!-- Box Comment -->
            <div class="box box-widget">
                <div class="box-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">Email</label>

                            <div class="col-sm-10">
                                <input type="text" name="title" required lay-verify="required" placeholder="请输入标题"
                                       autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label">Password</label>

                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="inputPassword3"
                                       placeholder="Password">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Remember me
                                    </label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.box-footer -->
            </div>
            <!-- /.box -->
        </div>
    </div>

</section>

<%@ include file="/commons/importJs.jsp" %>
<script>

</script>
</body>
</html>
