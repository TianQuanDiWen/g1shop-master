<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/28
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Sytel.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/register.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/register.js"></script>

    <script type="text/javascript"> // 待实现——重复用户名的判断
        $(function (){
            createCode();
        })

        function register() {
            var username = $("#username").val();
            var password = $("#password").val();
            var city = $("#city").val();
            var actualName = $("#name").val();
            var phone = $("#tel").val();
            var email = $("#email").val();
            $.ajax({
                url: "${pageContext.request.contextPath}/user/checkUsername",
                type: "get",
                data: {"username":username},
                success:function (res){
                    if(res === "true"){
                        $.ajax({
                            url:"${pageContext.request.contextPath}/user/register",
                            type:"post",
                            dataType : "JSON",
                            contentType:"application/x-www-form-urlencoded",
                            data:{
                                "username":username,"password":password,"actualName":actualName,"city":city,
                                "phone":phone,"email":email
                            } ,
                            success:function (result){
                                if(result.toString() === "false1"){
                                    alert("注册失败！");
                                } else {
                                    window.location.href="${pageContext.request.contextPath}/user/toLogin";
                                    alert("注册成功！");
                                }
                            }
                        })
                    } else {
                        alert("该用户名已存在！");
                    }
                }
            })


        }
    </script>

</head>
<body>

<div class="header">
</div>
<div class="navigation">

    <div class="navigation--head">

        <div class="seckill-container">
            <div class="rg_layout">
                <div class="rg_left">
                    <p>新用户注册</p>
                    <p>USER REGISTER</p>
                </div>
                <div class="rg_center">
                    <div class="rg_form">

                            <table>
                                <tr><!--label 标签的作用是当点击文字也会跳到文本输出框-->
                                    <!--for属性与ID属性对应规定 label 绑定到哪个表单元素。-->
                                    <td class="td_left"><label for="username">用户名</label> </td>
                                    <td class="td_right"><input type="text" name="username" id="username"> </td>
                                </tr>
                                <tr>
                                    <td class="td_left"><label for="password">密码</label> </td>
                                    <td class="td_right"><input type="password" name="password" id="password"> </td>
                                </tr>
                                <tr>
                                    <td class="td_left"><label for="repeatpassword">确认密码</label> </td>
                                    <td class="td_right"><input type="password" name="repeatpassword" id="repeatpassword"> </td>
                                </tr>
                                <tr>
                                    <td class="td_left"><label for="city">所在城市</label> </td>
                                    <td class="td_right"><input type="text" name="city" id="city"> </td>
                                </tr>

                                <tr>
                                    <td class="td_left"><label for="name">姓名</label> </td>
                                    <td class="td_right"><input type="text" name="name" id="name"> </td>
                                </tr>
                                <tr><!--label 标签的作用是当点击文字也会跳到文本输出框-->
                                    <td class="td_left"><label for="email">email</label> </td>
                                    <td class="td_right"><input type="email" name="email" id="email"> </td>
                                </tr>
                                <tr>
                                    <td class="td_left"><label for="tel">联系电话</label> </td>
                                    <td class="td_right"><input type="text" name="tel" id="tel"> </td>
                                </tr>

                                <tr>
                                    <td class="td_left"><label for="inputCode">验证码</label> </td>
                                    <td class="td_right">
                                        <input type="text" name="inputCode" id="inputCode">
                                        <span  id="checkCode" onclick="createCode()"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td id="codeTag">
                                        <p id="remind_3"></p>
                                        <a  href="#" class="no-clear" id="changeCode" onclick="return createCode()">看不清换一张</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">
                                        <input  type="button" value="注册" id="btn_sub" onclick="if(validateCode()!==false)register()">
                                    </td>
                                </tr>

                            </table>

                    </div>
                </div>
                <div class="rg_right">
                    <p>已有账号？<a href="${pageContext.request.contextPath}/user/toLogin">立即登录</a></p>
                </div>
            </div>

        </div>
    </div>
</div>


</div>

</body>
</html>
