<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/3
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>订单详情</title>
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
                        <img src="${pageContext.request.contextPath}/images/23.gif" class="flo_left" /><span>订单管理</span></h3>
                    <div class="padd">
                        <p> [订单详细信息]</p>
                        <div style="width:500px;height:300px;margin:10px auto;">
                            <p>会员姓名： ${uname}</p>
                            <p>订 单 号： ${order.orderId}</p>
                            <p>收 件 人： ${order.orderReceiver}</p>
                            <p>收件地址： ${order.address}</p>
                            <p>邮政编码： ${order.postCode}</p>
                            <p>收件电话： ${order.telCode}</p>
                            <p>备&nbsp;&nbsp;&nbsp;&nbsp;注： ${order.remarks}</p>
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
                                <img src="${pageContext.request.contextPath}/images/29.gif" onclick="window.location.href='${pageContext.request.contextPath}/user/toOrderManageList'" style="border:0; cursor:hand"/>
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
