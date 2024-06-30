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
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/js/login.js"></script>
<script>
    $(document).ready(function () {
        //如果以前选择了记住密码，则设置复选框的值，将密码和用户名取出来。 否则取消选中。
        if ($.cookie("remember") == "true") {
            //设置前端的复选框被选中
            $("#autologin").prop("checked", true);
            $("#username").val($.cookie("userName"));
            $("#password").val($.cookie("userPW"));
        }else{
            $("#autologin").prop("checked", false);
        }
        //单击登录按钮，执行on_click方法。
        $("#btn_sub").click(on_click);

        if($.cookie("uname") == "true"){
            $("#savename").prop("checked", true);
            $("#username").val($.cookie("username"));
        } else {
            $("#savename").prop("checked", false);
        }
    });
    //记住用户名密码
    function Save() {
        //如果选择了记住用户名
        if($("#savename").prop("checked")){
            var str_username = $("#username").val();
            $.cookie("uname", "true", { expires: 7 });
            $.cookie("username", str_username, { expires: 7 });
        }else{
            $.cookie("uname", "false", { expires: 7 });
            $.cookie("username", "", { expires: -1 });
        }
        //如果选择了自动登录
        if ($("#autologin").prop("checked")) {
            //取出页面上用户名和密码的值
            var str_username = $("#username").val();
            var str_password = $("#password").val();
            //利用cookie.js，放置到cookie中。 将用户名，密码，是否保存，放置到cookie中.
            $.cookie("remember", "true", { expires: 7 }); //存储一个带7天期限的cookie
            $.cookie("userName", str_username, { expires: 7 });
            $.cookie("userPW", str_password, { expires: 7 });
        }
        //如果没有选择了,则取消cookie存储的值
        else {
            $.cookie("remember", "false", { expire: -1 });
            $.cookie("userName", "", { expires: -1 });
            $.cookie("userPW", "", { expires: -1 });
        }
    };
    function on_click(){
        Save();
    }

    $(function (){
        createCode();
    })
    function login(){
        var uname = $("#username").val();
        var pwd = $("#password").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/user/login",
            data:{"uname":uname,"pwd":pwd},
            type:"post",
            success:function (res){
                if (res.toString() === "false1"){
                    alert("该用户不存在！") ;
                } else if (res.toString() === "false2"){
                    alert("账号或密码错误，请重新登录！");
                } else if(res.toString() === "false3"){
                    alert("该账号已冻结");
                } else {
                    window.location.href="${pageContext.request.contextPath}/index.jsp";
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

                            <tr>
                                <td class="td_left"><label for="inputCode">验证码</label> </td>
                                <td class="test-code">
                                    <input type="text" placeholder="请输入验证码" name="inputCode" id="inputCode" >
                                    <span class="btn-code"  id="checkCode" onclick="return createCode()"></span>
                                </td>
                            </tr>
                            <tr>
                                <td ></td>
                                <td id="codeTag">
                                    <p id="remind_3"></p>
                                    <a  href="#" class="no-clear" id="changeCode" onclick="return createCode()">看不清换一张</a>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_left"></td>
                                <td class="td_right">
                                    <label>
                                        <input type="checkbox" id="autologin">自动登录
                                    </label>&emsp;&emsp;
                                    <label>
                                        <input type="checkbox" name="savename" id="savename" value="ok">记住用户名
                                    </label>
                                </td>
                            </tr>
                            <tr>

                                <td colspan="2" align="center">
                                    <input type="button" value="登录" id="btn_sub" onclick=" if(validateCode()!==false)login()">
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
