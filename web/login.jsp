<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/28
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Sytel.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />


<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/js/login.js"></script>
<script>
    $(function (){
        createCode();
    })
    function login(){
        var uname = $("#username").val();
        var pwd = $("#password").val();
        if(!uname || uname == ""){
            alert("用户名不能为空")
            $("#username").focus ();
            return false;
        }
        if(!pwd || pwd == ""){
            alert("密码不能为空")
            $("#password").focus ();
            return false;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/user/login",
            data:{"uname":uname,"pwd":pwd},
            type:"post",
            success:function (res){
                if (res.toString() === "false1"){
                    alert("该用户不存在！") ;
                } else if (res.toString() === "false2"){
                    alert("账号或密码错误，请重新登录！");
                } else {
                    window.location.href="../index.jsp";
                    alert("用户 "+uname+" 登陆成功!");
                }
            }
        })
    }
</script>
<body>

<div class="header">
</div>
<div class="navigation">

    <div class="navigation--head">

        <div class="seckill-container">
            <div class="rg_layout">
                <div class="rg_left">
                    <p>用户登录</p>
                    <p>USER LOGIN</p>
                </div>
                <div class="rg_center">
                    <div class="rg_form">

                        <table>
                            <p id="remind_1"></p>
                            <tr><!--label 标签的作用是当点击文字也会跳到文本输出框-->
                                <!--for属性与ID属性对应规定 label 绑定到哪个表单元素。-->
                                <td class="td_left"><label for="username">用户名</label> </td>
                                <td class="td_right"><input type="text" name="username" id="username"> </td>
                            </tr>
                            <p id="remind_2"></p>
                            <tr>
                                <td class="td_left"><label for="password">密码</label> </td>
                                <td class="td_right"><input type="password" name="password" id="password"> </td>
                            </tr>
                            <p id="remind_3"></p>
                            <tr>
                                <td class="td_left"><label for="inputCode">验证码</label> </td>
                                <td class="test-code">
                                    <input type="text" placeholder="请输入验证码" name="inputCode" id="inputCode" >
                                    <span class="btn-code"  id="checkCode" onclick="return createCode()"></span>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <a  href="#" class="no-clear" id="changeCode" onclick="return createCode()">看不清换一张</a>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"></td>
                                <td class="td_right">
                                    <label>
                                        <input type="checkbox" >自动登录
                                    </label>&emsp;&emsp;
                                    <label>
                                        <input type="checkbox" name="savename" value="ok">记住用户名
                                    </label>
                                </td>
                            </tr>
                            <tr>

                                <td colspan="2" align="center">
                                    <input type="button" value="登录" id="btn_sub" onclick=" login()">
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>
                <div class="rg_right">
                    <p>没有账号？<a href="${pageContext.request.contextPath}/user/toRegister">立即注册</a></p>
                </div>
            </div>

        </div>
    </div>
</div>


</div>

</body>
</html>
