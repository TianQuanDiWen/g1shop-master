<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/29
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台登录</title>
    <link href="../styles/style.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script>
        function login(){
            var uname = $("#manager").val();
            var pwd = $("#password").val();
            if(!uname || uname == ""){
                alert("用户名不能为空")
                $("#manager").focus ();
                return false;
            }
            if(!pwd || pwd == ""){
                alert("密码不能为空")
                $("#password").focus ();
                return false;
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/user/manage",
                data:{"uname":uname,"pwd":pwd},
                type:"post",
                success:function (res){
                    if (res.toString() === "false1"){
                        alert("该用户不存在！") ;
                    } else if (res.toString() === "false2"){
                        alert("账号或密码错误，请重新登录！");
                    } else if (res.toString() === "false3"){
                        alert("非管理员无法登录！")
                    } else {
                        alert("用户 "+uname+" 登陆成功!");
                        window.location.href="${pageContext.request.contextPath}/user/toGoodsManageList";
                    }
                }
            })
        }
    </script>
    <style type="text/css">
        body{
            background: url("${pageContext.request.contextPath}/images/houtai.jpg")no-repeat center ;
            padding-top: 25px;
        }
    </style>
</head>

<body>

<div class="login_bg">

    <p>
        用户名：<input type="text" name="manager" size="12" value="" id="manager"/>
        密码：<input type="password" name="password" size="12" id="password"/>
        <img src="../images/19.gif" onclick="login()" style="border:0; cursor:hand"/>
        <img src="../images/22.gif" onclick="window.location.href='${pageContext.request.contextPath}/index.jsp';" style="border:0; cursor:hand"/>
    </p>

    <div style="width:446px;height:30px;margin:30px auto;">
    </div>
</div>



</body>
</html>
