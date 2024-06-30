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
    <title>会员详情</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
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
                    <h3><img src="${pageContext.request.contextPath}/images/25.gif" class="flo_right" /><img src="${pageContext.request.contextPath}/images/23.gif" class="flo_left" /><span>会员管理</span></h3>
                    <div class="padd">
                        <p> [会员详细信息]</p>
                        <div style="width:500px;height:300px;margin:10px auto;">
                            <p>会 员 名： ${userDetail.username}</p>
                            <p>真实姓名： ${userDetail.actualName}</p>
                            <p>会员等级：
                                <c:if test="${userDetail.level == 1}">
                                    铜牌会员
                                </c:if>
                                <c:if test="${userDetail.level == 2}">
                                    银牌会员
                                </c:if>
                                <c:if test="${userDetail.level == 3}">
                                    金牌会员
                                </c:if>
                                <c:if test="${userDetail.level == 4}">
                                    白金会员
                                </c:if>
                                <c:if test="${userDetail.level == 5}">
                                    钻石会员
                                </c:if>
                            </p>
                            <p>城&nbsp;&nbsp;&nbsp;&nbsp;市： ${userDetail.city}</p>
                            <p>地&nbsp;&nbsp;&nbsp;&nbsp;址： ${userDetail.address}</p>
                            <p>邮政编码： ${userDetail.postCode}</p>
                            <p>证件类型：
                                <c:if test="${userDetail.licenceType == 1}">
                                    身份证
                                </c:if>
                                <c:if test="${userDetail.licenceType == 2}">
                                    军官证
                                </c:if>
                                <c:if test="${userDetail.licenceType == 3}">
                                    学生证
                                </c:if>
                            </p>
                            <p>证件号码： ${userDetail.licenceType}</p>
                            <p>电&nbsp;&nbsp;&nbsp;&nbsp;话： ${userDetail.phone}</p>
                            <p>E-mail：  ${userDetail.email}</p>
                            <p class="ali_center">
                                <img src="${pageContext.request.contextPath}/images/29.gif" onclick="window.location.href='${pageContext.request.contextPath}/user/toUserManageList'" style="border:0; cursor:hand"/>
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
