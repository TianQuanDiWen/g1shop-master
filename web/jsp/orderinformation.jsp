<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/29
  Time: 23:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>订单信息</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">
    <div id="head">

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
        </div>
    <div id="content">
        <div class="cartDet">
            <div class="order_bg">
                <h4>订单详细信息</h4>
                <div style="width:500px;height:300px;margin:10px auto;">
                    <p>会员姓名： ${user.username}</p>
                    <p>订 单 号：${order.orderId}</p>
                    <p>收 件 人： ${order.orderReceiver}</p>
                    <p>收件地址：${order.address}</p>
                    <p>邮政编码： ${order.postCode}</p>
                    <p>收件电话：${order.telCode}</p>
                    <p>备&nbsp;&nbsp;&nbsp;&nbsp;注：${order.remarks}</p>
                    <table width="400" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="50%" >商品名称</td>
                            <td width="25%" >单&nbsp;&nbsp;价</td>
                            <td width="25%" >数&nbsp;&nbsp;量</td>
                        </tr>

                        <c:forEach items="${orderItems}" var="p">
                        <tr>
                            <td>${p.goodsName}</td>
                            <td>${p.goodsPrice}</td>
                            <td>${p.goodsNum}</td>
                        </tr>
                        </c:forEach>

                    </table>
                    <p class="ali_center">
                        <img src="${pageContext.request.contextPath}/images/29.gif" onclick="window.location.href='${pageContext.request.contextPath}/user/toOrder'" style="border:0; cursor:hand"/>
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
