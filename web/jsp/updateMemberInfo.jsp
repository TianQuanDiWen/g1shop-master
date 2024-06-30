<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/15
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>会员资料修改</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iconfont/iconfont.css" />
</head>

<body>
<div id="container">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>

    <script type="text/javascript">

        function updateUser() {
            var uid = $("#member_id").val();
            var username = $("#member_username").val();
            if($("#renewpassword").val() !== $("#newpassword").val() ){
                alert("两次密码输入不一致，请重试");
                return false;
            }
            if($("#renewpassword").val() !== null && $("#renewpassword").val() !== ""){
                var password = $("#renewpassword").val();
            } else {
                var password = $("#member_password").val();
            }
            var actualName = $("#member_realname").val();
            var city = $("#member_city").val();
            var address = $("#member_address").val();
            var postCode = $("#member_postcode").val();
            var licenceNum = $("#member_cardno").val();
            var licenceType = $('input[type=radio][name=member_cardtype]:checked').val();
            var phone = $("#member_tel").val();
            var email = $("#member_email").val();

            $.ajax({
                url:"${pageContext.request.contextPath}/user/update",
                type:"post",
                dataType : "JSON",
                contentType:"application/x-www-form-urlencoded",
                data:{
                    "uid":uid,"username":username,"password":password,"actualName":actualName,"city":city,
                    "address":address,"postCode":postCode,"licenceNum":licenceNum,"licenceType":licenceType,
                    "phone":phone,"email":email
                } ,
                success:function (result){
                    if(result === "false"){
                        alert("修改失败！");
                    } else {
                        window.location.href="${pageContext.request.contextPath}/index.jsp";
                        alert("修改成功！");
                    }
                }
            })
        }
    //登出
    function logOut(){
        $.ajax({
            url:"${pageContext.request.contextPath}/user/logOut",
            type:"get",
            success:function (res){
                if(res === "true"){
                    alert("用户退出成功！");
                    window.location.href="${pageContext.request.contextPath}/index.jsp";
                }
            }
        })
    }
    </script>

    <header>

        <div class="nav-bg">
            <div class="container">
                <script type="text/javascript">
                    function checkLogin(){//判断是否是汉字、字母、数字组成
                        var user = document.getElementById("hidden").value;
                        if(user == null || user ==""){
                            alert("您尚未登录，请先登录！");
                        }
                    }
                </script>
                <input type="hidden" name="loginInfo" value="${user}" id="hidden"/>

                <ul class="nav-top">

                    <li><a href="${pageContext.request.contextPath}/user/toCart"><i class="iconfont" >&#xe623;</i>购物车0件</a></li>
                    <li><a onclick="logOut()"><i class="iconfont" >&#xe6c8;</i>  退出登录</a></li>

                    <li id="gundong">您 的 满 意 是 我 们 最 大 的 幸 福， 祝 你 购 物 愉 快!</li>

                    <li style="float: left;">有 问 题 请 您 及 时 拨 打 24 小 时 服 务 热 线 4 0 0 8 0 0 6 0 0</li>
                </ul>
                <b>
                    <a > 会员等级
                        <c:if test="${user.level == 1}">
                            <img src="${pageContext.request.contextPath}/images/tongpai.png" id="img" onclick="logOut()"/>
                        </c:if>
                        <c:if test="${user.level == 2}">
                            <img src="${pageContext.request.contextPath}/images/yinpai.png" id="img" onclick="logOut()"/>
                        </c:if>
                        <c:if test="${user.level == 3}">
                            <img src="${pageContext.request.contextPath}/images/jinpai.png" id="img" onclick="logOut()"/>
                        </c:if>
                        <c:if test="${user.level == 4}">
                            <img src="${pageContext.request.contextPath}/images/baijin.png" id="img" onclick="logOut()"/>
                        </c:if>
                        <c:if test="${user.level == 5}">
                            <img src="${pageContext.request.contextPath}/images/zuanshi.png" id="img" onclick="logOut()"/>
                        </c:if>
                    </a>
                </b>
            </div>
        </div>
        <div class="container">

            <marquee width="500px" style="float: left;">
                <p style="font-size:30px;color:orange; margin-top: 22px;">欢迎您!  ${user.username}</p>
            </marquee>

        </div>

    </header>
    <div class="nav">
        <div class="container">
            <a href="${pageContext.request.contextPath}/index.jsp" >首页</a> |
            <a href="${pageContext.request.contextPath}/user/toUpdate">会员资料修改</a> |
            <a href="${pageContext.request.contextPath}/user/toCart">购物车</a> |
            <a href="${pageContext.request.contextPath}/user/toOrder">查看订单</a> |
            <a href="${pageContext.request.contextPath}/user/toManage">后台管理</a> |
            <a href="${pageContext.request.contextPath}/user/toLogin">会员登录</a>
            <a href="${pageContext.request.contextPath}/user/toRegister">会员注册</a>

        </div>
    </div>

    <div id="content">
        <div class="userinfo">
            <div>
                <font class="red"></font>
            </div>

                <input type="hidden" name="member.id" value="${user.uid}" id="member_id"  />
                <ul>
                    <li><span>用户名：</span><input type="text" name="member.username" value="${user.username}" id="member_username" />
                        <font class="red"> *</font>
                    </li>
                    <li><span>真实姓名：</span><input type="text" name="member.realname" value="${user.actualName}" id="member_realname" />
                        <font class="red"> *</font>
                    </li>
                    <li style="width:100%"><span>原密码：</span><input type="password" name="member.password" value="${user.password}" id="member_password" />
                        <font class="red"> *</font>

                    </li>

                    <li><span>新密码：</span><input type="password" name="newpassword" id="newpassword" />
                        <font class="red">*</font>

                    </li>
                    <li><span>确认新密码：</span><input type="password" name="renewpassword" id="renewpassword" />
                        <font class="red"> *</font>
                    </li>
                    <li><span>所在城市：</span><input type="text" name="member.city" value="${user.city}" id="member_city" />
                    <li><span>联系地址：</span><input type="text" name="member.address" value="${user.address}" id="member_address" />
                    <li><span>邮政编码：</span><input type="text" name="member.postcode" value="${user.postCode}" id="member_postcode" />
                    <li><span>证件号码：</span><input type="text" name="member.cardno" value="${user.licenceNum}" id="member_cardno" />
                        <font class="red"> *</font>
                    </li>
                    <li>
                        <c:if test="${user.licenceType == 1}">
                        <span>证件类别：</span>
                        <input type="radio"  name="member_cardtype" id="member_cardtype身份证" value="1" checked="checked"/><label for="member_cardtype身份证">身份证</label>
                        <input type="radio" name="member_cardtype" id="member_cardtype军官证" value="2" /><label for="member_cardtype军官证">军官证</label>
                        <input type="radio" name="member_cardtype" id="member_cardtype学生证" value="3" /><label for="member_cardtype学生证">学生证</label>
                        </c:if>
                        <c:if test="${user.licenceType == 2}">
                            <span>证件类别：</span>
                            <input type="radio"  name="member_cardtype" id="member_cardtype身份证" value="1" /><label for="member_cardtype身份证">身份证</label>
                            <input type="radio" name="member_cardtype" id="member_cardtype军官证" value="2" checked="checked"/><label for="member_cardtype军官证">军官证</label>
                            <input type="radio" name="member_cardtype" id="member_cardtype学生证" value="3" /><label for="member_cardtype学生证">学生证</label>
                        </c:if>
                        <c:if test="${user.licenceType == 3}">
                            <span>证件类别：</span>
                            <input type="radio"  name="member_cardtype" id="member_cardtype身份证" value="1" /><label for="member_cardtype身份证">身份证</label>
                            <input type="radio" name="member_cardtype" id="member_cardtype军官证" value="2" /><label for="member_cardtype军官证">军官证</label>
                            <input type="radio" name="member_cardtype" id="member_cardtype学生证" value="3"checked="checked" /><label for="member_cardtype学生证">学生证</label>
                        </c:if>
                    </li>
                    <li><span>联系电话：</span><input type="text" name="member.tel" value="${user.phone}" id="member_tel" />
                    <li><span>Email:</span><input type="text" name="member.email" value="${user.email}" id="member_email" />
                        <font class="red"> *</font>
                    </li>
                    <li class="button_img">
                        <img src="${pageContext.request.contextPath}/images/12.gif" onclick="updateUser()" />
                        <img src="${pageContext.request.contextPath}/images/13.gif" onclick="document.memberRegisterForm.reset();" style="CURSOR:hand" />
                    </li>
                </ul>

        </div>
    </div>
</div>
</body>

</html>