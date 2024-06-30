<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/29
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>购物车</title>
    <link href="../styles/style.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iconfont/iconfont.css" />
</head>
<script type="text/javascript">

    $(function (){
        checkCart(${uid});
        <%--setAllmoney(${uid});--%>
    })
    //查看购物车
    function checkCart(userId){
        console.log(userId);
        $.ajax({
            url: "${pageContext.request.contextPath}/cart/checkCart",
            type: "get",
            dataType:"json",
            data:{"userId":userId},
            success:function (res){
                if(res === "false"){
                    console.log("查询购物车失败！");
                } else {
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    var cart =  '<tr>'+
                            '<th scope="col" width="15%">'+
                                '编号'+
                            '</th>'+
                            '<th scope="col" width="30%">'+
                                '商品名称'+
                            '</th>'+
                            '<th scope="col" width="15%">'+
                                '单价'+
                            '</th>'+
                            '<th scope="col" width="15%">'+
                                '数量'+
                            '</th>'+
                            '<th scope="col" width="15%">'+
                                '金额'+
                            '</th>'+
                            '<th scope="col" width="10%">'+
                                '删除'+
                            '</th>'+
                        '</tr>';
                    var summery = 0;
                    var allmoney = 0.0;
                    var index = 0;
                    var html = "";
                    for (let i = 0; i < result.length; i++) {
                        summery = result[i].goodsPrice * result[i].goodsNum;
                        allmoney += summery;
                        index = i+1;
                        cart +=
                        '<tr id="num">'+
                            '<td> '+ index +'</td>'+
                            '<td> '+result[i].goodsName+'</td>'+
                            '<td> ￥ '+result[i].goodsPrice+'</td>'+
                            '<td>'+
                                '<input id="count'+ index +'" name="count" size="8" value="'+result[i].goodsNum+'" class="input" onchange="updateCart('+ index +','+result[i].cartId+')"/>'+
                            '</td>'+
                            '<input type="hidden" name="hidden" value="'+result[i].goodsNum+'" id="hidden" />'+
                            '<td> ￥ <span id="summary'+ index+'">'+summery+'</span>'+
                            '</td>'+
                            '<td align="center">'+
                                '<img src="../images/35.gif"  onclick="delCart('+result[i].cartId+')"  style="border:0; float:inherit; cursor:hand" />'+
                            '</td>'+
                        '</tr>';
                    }
                    $("#cart").html(cart);
                    $("#label_money").html(allmoney);
                }
            }
        })
    }
    //修改商品数量
    function  updateCart(index,cartId){
        var goodsNum = $("#count"+index).val();
        console.log(goodsNum);
        $.ajax({
            url: "${pageContext.request.contextPath}/cart/updateCart",
            type: "post",
            data: {"cartId":cartId,"goodsNum":goodsNum},
            success:function (res){
                if(res === "true"){
                    alert("商品编号为:"+index+"的商品数量修改为:"+goodsNum);
                    checkCart(${uid});
                } else {
                    console.log("修改数量失败！");
                }
            }
        })
    }

    //删除购物车的某个商品
    function delCart(cartId){
        $.ajax({
            url:"${pageContext.request.contextPath}/cart/delCart",
            type:"post",
            data:{"cartId":cartId},
            success:function (res){
                if(res === "true"){
                    alert("删除成功！");
                    checkCart(${uid});
                } else {
                    alert("删除失败！");
                }
            }
        })
    }
    //清空购物车
    function clearCart(userId){
        $.ajax({
            url:"${pageContext.request.contextPath}/cart/clearCart",
            type:"post",
            data:{"userId":userId},
            success:function (res){
                if(res === "true"){
                    alert("购物车已清空！");
                    checkCart(${uid});
                } else {
                    alert("购物车清空失败！");
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
<body>

<header>

    <div class="nav-bg">
        <div class="container">

            <ul class="nav-top">

                <li><a href="${pageContext.request.contextPath}/user/toCart"><i class="iconfont" >&#xe623;</i>购物车0件</a></li>
                <li><a onclick="logOut()"><i class="iconfont" >&#xe6c8;</i>  退出登录</a></li>

                <li id="gundong" >您  的 满 意 是 我 们 最 大 的 幸 福， 祝 你 购 物 愉 快!</li>


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


<div id="container">
    <div id="content">
        <div class="cartDet">
            <div class="bg">
                <h4>
                    购物车
                </h4>


                    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="cart">

                    </table>

                    <p class="ali_right" >
                        合计总金额：￥<span id="label_money" ></span>
                    </p>

                    <p class="ali_center">
                        <a href="${pageContext.request.contextPath}/index.jsp">继续购物</a> |
                        <a href="${pageContext.request.contextPath}/user/toCheck">收银结账</a> |
                        <a href="javascript:clearCart(${uid})" >清空购物车</a>
                     </p>

            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">



    function gundong(){
        var div=document.getElementById("gundong")
        var txt=div.innerHTML;

        var arr=txt.split("");//把字符串变成数组

        // console.log(arr)

        var first=arr.shift(); //删除数组里
        // console.log(first)

        arr.push(first);
        // console.log(arr)
        txt=arr.join("")

        div.innerHTML=txt
        // console.log(txt);
    }

    setInterval(gundong,500)
</script>
</html>
