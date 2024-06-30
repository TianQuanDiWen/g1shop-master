<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/14
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head >
    <title>电子商城</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iconfont/iconfont.css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script>
        window.onload =function (){
            findGoodsList1();
            findGoodsList11();
            findGoodsList2();
            findGoodsList3();
            findGoodsList4();
            findGoodsList5();
            findGoodsList6();
            findGoodsList7();
            findGoodsList8();
            findGoodsList9();
            findGoodsList10();
        }
        //1、查询手机列表
        function findGoodsList1(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList1",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList1").html(goodsList);
                }
            })

        }
        //2、查询平板列表
        function findGoodsList2(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList2",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList2").html(goodsList);
                }
            })

        }
        //3、查询电视列表
        function findGoodsList3(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList3",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList3").html(goodsList);
                }
            })

        }
        //4、查询笔记本列表
        function findGoodsList4(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList4",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList4").html(goodsList);
                }
            })

        }
        //5、查询家电列表
        function findGoodsList5(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList5",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList5").html(goodsList);
                }
            })

        }
        //6、查询路由器列表
        function findGoodsList6(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList6",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList6").html(goodsList);
                }
            })

        }
        //7、查询智能硬件列表
        function findGoodsList7(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList7",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList7").html(goodsList);
                }
            })

        }
        //8、查询移动配件列表
        function findGoodsList8(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList8",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList8").html(goodsList);
                }
            })

        }

        //9、查询智能养生列表
        function findGoodsList9(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList9",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList9").html(goodsList);
                }
            })

        }
        //10、查询生活箱包
        function findGoodsList10(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList10",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                        '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<span>'+result[i].goodsName+'</span>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                        '</li>';
                    }
                    $("#goodsList10").html(goodsList);
                }
            })

        }
        //11、查询折扣商品列表
        function findGoodsList11(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/findGoodsList11",
                type:"get",
                dataType:"json",
                success:function (res){
                    var res1 = JSON.stringify(res);
                    var result = JSON.parse(res1);
                    console.log(res1);
                    var goodsList = "";
                    for (let i = 0; i < result.length; i++) {
                        goodsList +=
                            '<li>'+
                            '<img src="${pageContext.request.contextPath}/images/'+result[i].goodsImg+'" width="100px" height="100px" />'+
                            '<div>'+result[i].goodsName+'</div>'+
                            '<span>单价：'+result[i].goodsPrice+'</span>'+
                            '<span><br/><img src="${pageContext.request.contextPath}/images/08.gif" alt="详细信息" onclick="goodsDetails('+result[i].goodsId+')" style="border:0; cursor:hand;"/>&nbsp;'+
                            '<img src="images/33.gif" alt="订购" onclick="addCart('+result[i].goodsId+')" style="border:0; cursor:hand;"/></span>'+
                            '</li>';
                    }
                    $("#goodsList11").html(goodsList);
                }
            })

        }
        //查询商品细节
        function goodsDetails(goodsId){
            console.log(goodsId);
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/goodsDetails",
                type:"get",
                data:{"goodsId":goodsId},
                success:function (res){
                    if(res === "true"){
                        console.log("查询商品成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toDetails";
                    } else {
                        console.log("查询商品失败！")
                    }
                }
            })
        }
        //加入购物车
        function addCart(goodsId){
            sessionStorage.setItem("uid",${uid});
            var userId =sessionStorage.getItem("uid");
            console.log("用户id为:"+userId);
            $.ajax({
                url:"${pageContext.request.contextPath}/cart/addCart",
                type:"post",
                data:{"goodsId":goodsId,"userId":userId},
                success:function (res){
                    if(res === "true"){
                        alert("加入购物车成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toCart";
                    } else {
                        console.log("加入购物车失败！");
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
</head>
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
<!--轮播-->
<div class="banner">
    <div id="gal-wrap">
        <ul id="gallery">
            <li>
                <a><img src="${pageContext.request.contextPath}/images/lunbo4.jpg" /></a>
            </li>
            <li>
                <a><img src="${pageContext.request.contextPath}/images/lunbo5.jpg" /></a>
            </li>
            <li>
                <a><img src="${pageContext.request.contextPath}/images/lunbo6.jpg" /></a>
            </li>
        </ul>
    </div>
    <div class="fenlei">
        <ul class="ul-nav">
            <li><a href="#zhineng">智能手机</a></li>
            <li><a href="#pingban">平板电脑</a></li>
            <li><a href="#dianshi">电视</a></li>
            <li><a href="#bijiben">笔记本</a></li>
            <li><a href="#jiadian">家电</a> </li>
            <li><a href="#luyouqi">路由器</a></li>
            <li><a href="#yingjian">智能硬件</a></li>
            <li><a href="#peijian">移动配件</a></li>
            <li><a href="#yangsheng">智能养生</a></li>
            <li><a href="#xiangbao">生活箱包</a></li>


        </ul>
        <ul class="xianshi" >
            <b>限时折扣</b>
            <ul id="goodsList11">
            </ul>
        </ul>

    </div>

</div>



<div id="content">
    <h3 id="zhineng">智能手机</h3>
    <ul class="ul_list" id="goodsList1">

    </ul>
</div>
<div id="content">
    <h3 style="background: #867bc5;" id="pingban">平板电脑</h3>
    <ul class="ul_list2" id="goodsList2">

    </ul>
</div>
<div id="content">
    <h3 style="background:#53c7ff;" id="dianshi">电视</h3>
    <ul class="ul_list2"id="goodsList3">

    </ul>
</div>

<div id="content">
    <h3 style="background:pink;" id="bijiben">笔记本</h3>
    <ul class="ul_list2" id="goodsList4">
>
    </ul>
</div>

<div id="content">
    <h3 style="background:skyblue;" id="jiadian">家电</h3>
    <ul class="ul_list2" id="goodsList5">
    </ul>
</div>

<div id="content">
    <h3 style="background:greenyellow;" id="luyouqi">路由器</h3>
    <ul class="ul_list2"id="goodsList6">

    </ul>
</div>

<div id="content">
    <h3 style="background:mediumpurple;" id="yingjian">智能硬件</h3>
    <ul class="ul_list2" id="goodsList7">

    </ul>
</div>

<div id="content">
    <h3 style="background:brown;" id="peijian">移动配件</h3>
    <ul class="ul_list2" id="goodsList8">

    </ul>
</div>

<div id="content">
    <h3 style="background:palevioletred;" id="yangsheng">智能养生</h3>
    <ul class="ul_list2" id="goodsList9">

    </ul>
</div>

<div id="content">
    <h3 style="background:orange;" id="xiangbao">生活箱包</h3>
    <ul class="ul_list2" id="goodsList10">

    </ul>
</div>


<%--<div id="content">--%>
<%--    <p class="ali_center">--%>

<%--        首页 上一页 | 下一页 尾页--%>

<%--    </p>--%>
<%--</div>--%>

</body>
<script type="text/javascript">

    setInterval(changer, 3000)
    var index = 0;

    function changer() {
        var gallery = document.getElementById("gallery");
        var li = gallery.getElementsByTagName("li");
        var start = index;

        index -= 1000;
        var total = 1000 * li.length;
//				var a =  3 >2 ? "true" :"false"
        index = index ==  -total ? 0 : index;

        var end = index;

        //gallery.style.left = end + "px";

        var timeIndex = setInterval(slider,10)
//0,-500,-1000,
        function slider() {
            if (end == 0) {
                start += 40;
                if (start <= end) {
                    gallery.style.left = start + "px";
                } else {
                    clearInterval(timeIndex);
                }
            } else {
                start -= 20;
                if (start >= end) {
                    gallery.style.left = start + "px";
                } else {
                    clearInterval(timeIndex);
                }
            }
        }

    }

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
