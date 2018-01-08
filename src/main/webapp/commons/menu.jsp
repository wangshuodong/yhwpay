<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${staticPath }/static/app/img/admin.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>管理员</p>
                <a href="javascript:;"><i class="fa fa-circle text-lime"></i> Online</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">系统菜单</li>
            <li class="<c:if test="${cur == 0}">active</c:if>"><a href="${path }/index?t=0" class="myselect"><i class="fa fa-desktop"></i> <span>系统首页</span></a></li>
            <%--<li class="treeview active">
                <a href="javascript:;">
                    <i class="fa fa-cloud"></i> <span>服务商管理</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="${path }/pages/list.jsp">我的服务商</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="javascript:;">
                    <i class="fa fa-snowflake-o"></i> <span>物业管理</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:;">我的物业</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="javascript:;">
                    <i class="fa fa-bank"></i> <span>小区管理</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:;">我的小区</a></li>
                    <li><a href="javascript:;">房屋信息</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="javascript:;">
                    <i class="fa fa-bar-chart-o"></i> <span>账单管理</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:;">我的账单</a></li>
                    <li><a href="javascript:;">电子发票</a></li>
                    <li><a href="javascript:;">交易中心</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="javascript:;">
                    <i class="fa fa-user-circle-o"></i> <span>用户管理</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:;">用户中心</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="javascript:;">
                    <i class="fa fa-gears"></i> <span>系统设置</span>
                    <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:;">角色管理</a></li>
                    <li><a href="javascript:;">费用类型</a></li>
                </ul>
            </li>--%>
            <c:forEach items="${treeMenus}" var="item">

                <li class="treeview <c:if test="${res == item.id}">active</c:if>">
                    <a href="javascript:;">
                        <i class="${ item.icon }"></i> <span>${ item.menuName }</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <c:forEach items="${ item.children }" var="sonItem">
                            <li class="<c:if test="${cur == sonItem.id}">active</c:if>"><a href="${ sonItem.url }?p=${ item.id }&t=${ sonItem.id }"><i class="fa fa-circle-o"></i>${ sonItem.menuName }</a></li>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
            <li class="header">个人中心</li>
            <li class="<c:if test="${cur == -1}">active</c:if>"><a href="${path }/sysUser/info?t=-1" class="myselect"><i class="fa fa-circle-o text-red"></i> <span>个人信息</span></a></li>
            <li class="<c:if test="${cur == -2}">active</c:if>"><a href="${path }/sysUser/updatePassword?t=-2" class="myselect"><i class="fa fa-circle-o text-yellow"></i> <span>修改密码</span></a></li>
        </ul>
    </section>
</aside>