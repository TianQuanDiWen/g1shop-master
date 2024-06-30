<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/29
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单号</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="container">


    <div id="head">
        <input type="hidden" name="loginInfo" value="com.shop.web.common.UserInfo@18192b6" id="hidden"/>
        <input type="hidden" name="loginInfo" value="" id="loginInfo"/>
        <div class="banner">

            <marquee><p style="font-size:14px;color:orange;text-align:center;">欢迎您!  ${user.username}</p></marquee>

        </div>
        <div class="nav"><a href="${pageContext.request.contextPath}/index.jsp">首页</a> |
            <a href="${pageContext.request.contextPath}/user/toUpdate" >会员资料修改</a> |
            <a href="${pageContext.request.contextPath}/user/toCart" >购物车</a> |
            <a href="${pageContext.request.contextPath}/user/toOrder" >查看订单</a> |
            <a href="${pageContext.request.contextPath}/user/toManage">后台管理</a>
        </div>
    </div>>
    <div id="content">
        <div class="userinfo" style="background:url(${pageContext.request.contextPath}/images/38.gif) no-repeat;">
            <ul>
                <li>
                    您的订单号：<font style="color:red;">${orderId}</font><br>
                </li>
            </ul>
            <div class="button_img">
                <center><a href="${pageContext.request.contextPath}/index.jsp">继续购物</a>
                </center>

            </div>
        </div>
    </div>
</div>
</body>
</html>
