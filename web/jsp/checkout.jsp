<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/29
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收银结账</title>
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
    <div id="content">
        <div class="userinfo" style="background:url(${pageContext.request.contextPath}/images/38.gif) no-repeat;">
            <!--  <div class="bg">
             <h4>收银结账</h4>-->

            <form id="toCartConfirm" name="checkForm" onsubmit="return true;" action="${pageContext.request.contextPath}/order/submitOrder" method="post">

                <input type="hidden" name="userId" value="${user.uid}" id="toCartConfirm_shopOrder_id"/>

                <ul>
                    <li><span>收 件 人：</span><input type="text" name="orderReceiver" value="" id="toCartConfirm_shopOrder_username"/>
                        <font class="red"> *</font>
                    </li>
                    <li><span>邮寄地址：</span><input type="text" name="address" value="" id="toCartConfirm_shopOrder_address"/>
                        <font class="red"> *</font></li>
                    <li><span>邮政编码：</span><input type="text" name="postCode" maxlength="6" value="" id="toCartConfirm_shopOrder_postcode"/>
                        <font class="red"> *</font></li>
                    <li><span>联系电话：</span><input type="text" name="telCode" maxlength="11" value="" id="toCartConfirm_shopOrder_tel"/>
                        <font class="red"> *</font></li>
                    <li><span>付款方式：</span><input type="text" name="payment" value="" id="toCartConfirm_shopOrder_pay"/>
                        <font class="red"> *</font></li>
                    <li><span>运送方式：</span><input type="text" name="transType" value="" id="toCartConfirm_shopOrder_carry"/>
                        <font class="red"> *</font></li>
                    <li><span>备    注：</span><textarea name="remarks" cols="50" rows="5" id="toCartConfirm_shopOrder_bz"></textarea>
                        <font class="red"> *</font></li>
                    <li></li>
                    <li></li>
                </ul>
                <div class="button_img">
                    <img   src="${pageContext.request.contextPath}/images/12.gif"   onclick="document.checkForm.submit();" style= "CURSOR:hand"/>
                    <img   src="${pageContext.request.contextPath}/images/13.gif"   onclick="document.checkForm.reset();" style= "CURSOR:hand"/>
                    <img   src="${pageContext.request.contextPath}/images/29.gif"   onclick="window.location.href='${pageContext.request.contextPath}/user/toCart'" style= "CURSOR:hand"/>
                </div>
            </form>

        </div>
    </div>
</div>
</body>
</html>
