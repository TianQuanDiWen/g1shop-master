<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/14
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="container">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>

    <script type="text/javascript">
        function checkLogin() { //判断是否是汉字、字母、数字组成
            var user = document.getElementById("hidden").value;
            if (user == null || user == "") {
                alert("您尚未登录，请先登录！");
            }
        }

        function register() {
            var username = $("#member_username").val();
            var password = $("#renewpassword").val();
            var actualName = $("#member_realname").val();
            var city = $("#member_city").val();
            var address = $("#member_address").val();
            var postCode = $("#member_postcode").val();
            var licenceNum = $("#member_cardno").val();
            var licenceType = $('input[type=radio][name=member_cardtype]:checked').val();
            var phone = $("#member_tel").val();
            var email = $("#member_email").val();

            $.ajax({
                url:"${pageContext.request.contextPath}/user/register",
                type:"post",
                dataType : "JSON",
                contentType:"application/x-www-form-urlencoded",
                data:{
                    "username":username,"password":password,"actualName":actualName,"city":city,
                    "address":address,"postCode":postCode,"licenceNum":licenceNum,"licenceType":licenceType,
                    "phone":phone,"email":email
                } ,
                success:function (result){
                    if(result === "false"){
                        alert("注册失败！");
                    } else {
                        window.location.href="login1.jsp";
                        alert("注册成功！");
                    }
                }
            })
        }
    </script>

    <header>

        <div class="nav-bg">
            <div class="container">

                <ul class="nav-top">

                    <li><a href="gouwuche.html"><i class="iconfont" >&#xe623;</i>购物车0件</a></li>

                    <li id="gundong">您 的 满 意 是 我 们 最 大 的 幸 福， 祝 你 购 物 愉 快!</li>

                    <li style="float: left;">有 问 题 请 您 及 时 拨 打 24 小 时 服 务 热 线 4 0 0 8 0 0 6 0 0</li>
                </ul>
                <b>  <a > 会员等级 <img src="images/baijin.png"/></a></b>
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
            <a href="index.jsp">首页</a> |
            <a href="${pageContext.request.contextPath}/user/toUpdate">会员资料修改</a> |
            <a href="gouwuche.html">购物车</a> |
            <a href="chankan.html">查看订单</a> |
            <a href="manage1.html">后台管理</a> |
            <a href="${pageContext.request.contextPath}/user/toLogin">会员登录</a> |
            <a href="${pageContext.request.contextPath}/user/toRegister">会员注册</a>

        </div>
    </div>

    <div id="content">
        <div class="userinfo">
            <div>
                <font class="red"></font>
            </div>


                <input type="hidden" name="member.id" value="" id="memberModify_action_member_id" />
                <ul>
                    <li><span>用户名：</span><input type="text" name="member.username" value="" id="member_username" />
                        <font class="red"> *</font>
                    </li>
                    <li><span>真实姓名：</span><input type="text" name="member.realname" value="" id="member_realname" />
                        <font class="red"> *</font>
                    </li>
                    <li style="width:100%"><span>原密码：</span><input type="password" name="member.password" value="" id="member_password" />
                        <font class="red"> *</font>

                    </li>

                    <li><span>新密码：</span><input type="password" name="newpassword" id="newpassword" />
                        <font class="red">*</font>

                    </li>
                    <li><span>确认新密码：</span><input type="password" name="renewpassword" id="renewpassword" />
                        <font class="red"> *</font>
                    </li>
                    <li><span>所在城市：</span><input type="text" name="member.city" value="" id="member_city" />
                    <li><span>联系地址：</span><input type="text" name="member.address" value="" id="member_address" />
                    <li><span>邮政编码：</span><input type="text" name="member.postcode" value="" id="member_postcode" />
                    <li><span>证件号码：</span><input type="text" name="member.cardno" value="" id="member_cardno" />
                        <font class="red"> *</font>
                    </li>
                    <li><span>证件类别：</span><input type="radio" name="member.cardtype" id="member_cardtype身份证" value="1" /><label for="member_cardtype身份证">身份证</label>
                        <input type="radio" name="member.cardtype" id="member_cardtype军官证" value="2" /><label for="member_cardtype军官证">军官证</label>
                        <input type="radio" name="member.cardtype" id="member_cardtype学生证" value="3" /><label for="member_cardtype学生证">学生证</label>

                    </li>
                    <li><span>联系电话：</span><input type="text" name="member.tel" value="" id="member_tel" />
                    <li><span>Email:</span><input type="text" name="member.email" value="" id="member_email" />
                        <font class="red"> *</font>
                    </li>
                    <li class="button_img">
                        <img src="${pageContext.request.contextPath}/images/12.gif" onclick="register()"  />
                        <img src="${pageContext.request.contextPath}/images/13.gif" onclick="document.memberRegisterForm.reset();" style="CURSOR:hand" />
                    </li>
                </ul>

        </div>
    </div>
</div>
</body>
</html>
