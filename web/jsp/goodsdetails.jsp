<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/30
  Time: 0:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
</head>
<body>
<div id="container">



    <script type="text/javascript">

        //加入购物车
        function addCart(goodsId,userId){
            console.log(goodsId);
            console.log(userId);
            $.ajax({
                url:"${pageContext.request.contextPath}/cart/addCart",
                type:"post",
                data:{"goodsId":goodsId,"userId":userId},
                success:function (res){
                    if(res === "true"){
                        console.log("加入购物车成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toCart";
                    } else {
                        console.log("加入购物车失败！");
                    }
                }
            })
        }
    </script>
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
        <h3>&nbsp;</h3>
        <ul class="ul_list">
            <li>
                <span><img src="${pageContext.request.contextPath}/images/${goods.goodsImg}"  width="100px" height="100px" /></span>
                <span>${goods.goodsName}</span>
                <span>单价：${goods.goodsPrice}</span>
                <span>商品简介:${goods.goodsIntroduce}</span>
                <img src="${pageContext.request.contextPath}/images/33.gif" alt="订购" onclick="addCart(${goods.goodsId},${user.uid})" style="border:0; cursor:hand;"/></span>
         	<img src="${pageContext.request.contextPath}/images/29.gif" alt="返回" onclick="window.location.href='${pageContext.request.contextPath}/index.jsp'"  style="border:0; cursor:hand;"/>
         </span>
            </li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
