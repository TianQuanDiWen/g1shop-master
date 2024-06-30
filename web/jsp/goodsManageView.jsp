<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/3
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<head>
    <title>商品详细信息</title>
</head>
<body>
<div class="main">
    <script>
        //后台登出
        function logOut(){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/logOut",
                type:"get",
                success:function (res){
                    if(res === "true"){
                        alert("管理员退出成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toManage";
                    }
                }
            })
        }
    </script>


    <div class="top">
        <p>
            <a href="${pageContext.request.contextPath}/user/toGoodsManageList">商品管理</a> |
            <a href="${pageContext.request.contextPath}/user/toUserManageList">会员管理</a> |
            <a href="${pageContext.request.contextPath}/user/toOrderManageList">订单管理</a> |
            <a href="javascript:logOut()">退出后台</a>
        </p>
    </div>
    <div class="adm_con">
        <div class="bg_3">
            <div class="bg_1">
                <div class="bg_2">
                    <h3><img src="${pageContext.request.contextPath}/images/25.gif" class="flo_right" />
                        <img src="${pageContext.request.contextPath}/images/23.gif" class="flo_left" /><span>商品管理</span></h3>
                    <div class="padd">
                        <p> [商品详细信息]</p>
                        <div style="width:500px;height:300px;margin:10px auto;">
                            <img src="${pageContext.request.contextPath}/images/${goods.goodsImg}" width="100px" height="100px" >
                            <p>商品编号:  ${goods.goodsId}</p>
                            <p>商品名称:  ${goods.goodsName}</p>
                            <p>商品类别:  <c:if test="${goods.goodsType == 1}">
                                智能手机
                                </c:if>
                                <c:if test="${goods.goodsType == 2}">
                                    平板电脑
                                </c:if>
                                <c:if test="${goods.goodsType == 3}">
                                    电视
                                </c:if>
                                <c:if test="${goods.goodsType == 4}">
                                    笔记本
                                </c:if>
                                <c:if test="${goods.goodsType == 5}">
                                    家电
                                </c:if>
                                <c:if test="${goods.goodsType == 6}">
                                    路由器
                                </c:if>
                                <c:if test="${goods.goodsType == 7}">
                                    智能硬件
                                </c:if>
                                <c:if test="${goods.goodsType == 8}">
                                    移动配件
                                </c:if>
                                <c:if test="${goods.goodsType == 9}">
                                    智能养生
                                </c:if>
                                <c:if test="${goods.goodsType == 10}">
                                    服装
                                </c:if>
                            </p>
                            <p>价&nbsp;&nbsp;&nbsp;&nbsp;格: ${goods.goodsPrice}</p>
                            <p>发布日期:  ${goods.goodsDate}</p>
                            <p>商品简介:  ${goods.goodsIntroduce}</p>

                            <p class="ali_center">
                                <img src="${pageContext.request.contextPath}/images/29.gif" onclick="window.location.href='${pageContext.request.contextPath}/user/toGoodsManageList'" style="border:0; cursor:hand"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
