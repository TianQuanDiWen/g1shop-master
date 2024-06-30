<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/11
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iconfont/iconfont.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script>
    function login(){
        var uname = $("#uname").val();
        var pwd = $("#pwd").val();
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
                    window.location.href="${pageContext.request.contextPath}/index.jsp";
                    alert("用户 "+uname+" 登陆成功!");
                }
            }
        })
    }
</script>

<style type="text/css">

    .denglv  marquee{
        height: 100px;
        line-height: 100px;
        font-size:20px;
        color:orange;

    }
    .denglv{
        margin: 0 auto;
        width: 875px;
    }

    .denglv  div{
        height: 369px;
        width:388px;
        position: relative;
        left: 216px;
        top: 75px;
        background: rgba(255,255,255,0.5);
        border-radius: 10px;
        padding: 50px 0 0 30px;
    }

    .denglv div ul{
        font-size: 15px;
        line-height:60px;
        padding-left:20px ;
    }

    .denglv div ul input{
        width: 250px;
        height: 33px;
        color: rgb(200,200,200);



    }
    .denglv  div ul i{
        display: inline-block;
        width: 50px;
        height: 38px;
        background:rgb(200,200,200);
        color: white;
        text-align: center;
        line-height: 34px;
    }

    .denglv div ul li:nth-child(4) input{
        width: 305px;
        background: #28b9ff;
        color: white;
        height: 35px;
    }

    .denglv  div ul a{
        position: relative;
        right: -168px;
        bottom: -21px;
        color: black;
    }
    .denglv div ul a:hover{
        color: #28b9ff;
    }
</style>

<body>

<div  class="denglv">
    <marquee>欢迎您!  ${user.username}</marquee>


    <div>
        <ul>
            <li>密码登录</li>
            <li><i class="iconfont">&#xe6df;</i><input type="text" name="uname" id="uname" placeholder="请输入帐号" /></li>
            <li><i class="iconfont">&#xe614;</i><input type="text" name="pwd"  id="pwd" placeholder="请输入密码" /></li>
            <li><input type="button" name="" id="submit" value="登&nbsp;&nbsp;录" onclick="login()"/></li>
            <li><a>忘记密码</a>&nbsp;<a href="${pageContext.request.contextPath}/user/toRegister">免费注册</a></li>
        </ul>

    </div>

</div>
</body>
</html>


