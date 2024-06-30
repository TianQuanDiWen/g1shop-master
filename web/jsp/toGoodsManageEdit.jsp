<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/3
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>商品修改</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
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
                        <img src="${pageContext.request.contextPath}/images/23.gif" class="flo_left" />
                        <span>商品列表</span>
                    </h3>
                    <div class="padd">
                        <p> [  修改商品信息]</p>
                        <form namespace="/" id="goodsManageEdit" name="editForm" action="${pageContext.request.contextPath}/goods/updateGoods" method="post">
                            <input type="hidden" name="goodsId" value="${goods.goodsId}" id="goodsManageEdit_shopGoods_id"/>
<%--                            <input type="hidden" name="goodsImg" value="${goods.goodsImg}" id="goodsManageEdit_shopGoods_picture"/>--%>
                            <input type="hidden" name="goodsDate" value="${goods.goodsDate}">
                            <ul class="add">
                                <li><span> 商品名称： </span>
                                    <input type="text" name="goodsName" value="${goods.goodsName}" id="goodsManageEdit_shopGoods_goodsname"/> <font color="red">*</font>
                                </li>
                                <li><span></span>
                                    <img src="${pageContext.request.contextPath}/images/${goods.goodsImg}"width="85px" height="85px" />
                                </li>
                                <li><span>上传图片：</span>
                                    <input type="file" name="goodsImg" value="" id="goodsManageEdit_upload"/>
                                </li>
                                <li><span>价    格：</span>
                                    <input type="text" name="goodsPrice" value="${goods.goodsPrice}" id="goodsManageEdit_shopGoods_price"/> <font color="red">*</font>
                                </li>
                                <li><span> 商品类型： </span>
                                    <c:if test="${goods.goodsType == 1}">
                                    <select name="goodsType" >
                                        <option value="1" selected="selected">智能手机</option>
                                        <option value="2">平板电脑</option>
                                        <option value="3">电视</option>
                                        <option value="4">笔记本</option>
                                        <option value="5">家电</option>
                                        <option value="6">路由器</option>
                                        <option value="7">智能硬件</option>
                                        <option value="8">移动配件</option>
                                        <option value="9">智能养生</option>
                                        <option value="10">生活箱包</option>
                                    </select>
                                    </c:if>
                                    <c:if test="${goods.goodsType == 2}">
                                        <select name="goodsType" >
                                            <option value="1" >智能手机</option>
                                            <option value="2" selected="selected">平板电脑</option>
                                            <option value="3">电视</option>
                                            <option value="4">笔记本</option>
                                            <option value="5">家电</option>
                                            <option value="6">路由器</option>
                                            <option value="7">智能硬件</option>
                                            <option value="8">移动配件</option>
                                            <option value="9">智能养生</option>
                                            <option value="10">生活箱包</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${goods.goodsType == 3}">
                                        <select name="goodsType" >
                                            <option value="1">智能手机</option>
                                            <option value="2">平板电脑</option>
                                            <option value="3" selected="selected">电视</option>
                                            <option value="4">笔记本</option>
                                            <option value="5">家电</option>
                                            <option value="6">路由器</option>
                                            <option value="7">智能硬件</option>
                                            <option value="8">移动配件</option>
                                            <option value="9">智能养生</option>
                                            <option value="10">生活箱包</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${goods.goodsType == 4}">
                                        <select name="goodsType" >
                                            <option value="1">智能手机</option>
                                            <option value="2">平板电脑</option>
                                            <option value="3">电视</option>
                                            <option value="4" selected="selected">笔记本</option>
                                            <option value="5">家电</option>
                                            <option value="6">路由器</option>
                                            <option value="7">智能硬件</option>
                                            <option value="8">移动配件</option>
                                            <option value="9">智能养生</option>
                                            <option value="10">生活箱包</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${goods.goodsType == 5}">
                                        <select name="goodsType" >
                                            <option value="1">智能手机</option>
                                            <option value="2">平板电脑</option>
                                            <option value="3">电视</option>
                                            <option value="4">笔记本</option>
                                            <option value="5" selected="selected">家电</option>
                                            <option value="6">路由器</option>
                                            <option value="7">智能硬件</option>
                                            <option value="8">移动配件</option>
                                            <option value="9">智能养生</option>
                                            <option value="10">生活箱包</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${goods.goodsType == 6}">
                                        <select name="goodsType" >
                                            <option value="1">智能手机</option>
                                            <option value="2">平板电脑</option>
                                            <option value="3">电视</option>
                                            <option value="4">笔记本</option>
                                            <option value="5">家电</option>
                                            <option value="6" selected="selected">路由器</option>
                                            <option value="7">智能硬件</option>
                                            <option value="8">移动配件</option>
                                            <option value="9">智能养生</option>
                                            <option value="10">生活箱包</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${goods.goodsType == 7}">
                                        <select name="goodsType" >
                                            <option value="1">智能手机</option>
                                            <option value="2">平板电脑</option>
                                            <option value="3">电视</option>
                                            <option value="4">笔记本</option>
                                            <option value="5">家电</option>
                                            <option value="6">路由器</option>
                                            <option value="7" selected="selected">智能硬件</option>
                                            <option value="8">移动配件</option>
                                            <option value="9">智能养生</option>
                                            <option value="10">生活箱包</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${goods.goodsType == 8}">
                                        <select name="goodsType" >
                                            <option value="1">智能手机</option>
                                            <option value="2">平板电脑</option>
                                            <option value="3">电视</option>
                                            <option value="4">笔记本</option>
                                            <option value="5">家电</option>
                                            <option value="6">路由器</option>
                                            <option value="7">智能硬件</option>
                                            <option value="8" selected="selected">移动配件</option>
                                            <option value="9">智能养生</option>
                                            <option value="10">生活箱包</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${goods.goodsType == 9}">
                                        <select name="goodsType" >
                                            <option value="1">智能手机</option>
                                            <option value="2">平板电脑</option>
                                            <option value="3">电视</option>
                                            <option value="4">笔记本</option>
                                            <option value="5">家电</option>
                                            <option value="6">路由器</option>
                                            <option value="7">智能硬件</option>
                                            <option value="8">移动配件</option>
                                            <option value="9" selected="selected">智能养生</option>
                                            <option value="10">生活箱包</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${goods.goodsType == 10}">
                                        <select name="goodsType" >
                                            <option value="1">智能手机</option>
                                            <option value="2">平板电脑</option>
                                            <option value="3">电视</option>
                                            <option value="4">笔记本</option>
                                            <option value="5">家电</option>
                                            <option value="6">路由器</option>
                                            <option value="7">智能硬件</option>
                                            <option value="8">移动配件</option>
                                            <option value="9">智能养生</option>
                                            <option value="10" selected="selected">生活箱包</option>
                                        </select>
                                    </c:if>
                                </li>
                                <li style="height:100px;"><span>商品简介：</span>
                                    <textarea name="goodsIntroduce" cols="60" rows="5" id="goodsManageEdit_shopGoods_introduce">${goods.goodsIntroduce}</textarea>
                                </li>

                            </ul>
                            <p class="ali_center">
                                <img src="${pageContext.request.contextPath}/images/12.gif" onclick="document.editForm.submit();" style="border:0; cursor:hand"/>
                                <img src="${pageContext.request.contextPath}/images/13.gif" onclick="document.editForm.reset();" style="border:0; cursor:hand"/>
                                <img src="${pageContext.request.contextPath}/images/29.gif" onclick="window.location.href='${pageContext.request.contextPath}/user/toGoodsManageList'" style="border:0; cursor:hand"/>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
