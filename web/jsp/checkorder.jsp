<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/29
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link href="../styles/style.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/iconfont/iconfont.css" />

<head>
    <title>查看订单</title>
    <script type="application/javascript">
        window.onload = function (){
            findOrder(${user.uid});
            // update();
        }
        //查询所有订单
        function findOrder(userId){
            $.ajax({
                url:"${pageContext.request.contextPath}/order/findOrder",
                type:"get",
                dataType:"json",
                data:{"userId":userId},
                success:function (res){
                    if(res === "false"){
                        console.log("查询订单失败！");
                    } else {
                        var res1 = JSON.stringify(res);
                        var result = JSON.parse(res1);
                        console.log(res1);
                        var html1 =
                            '<tr>'+
                                '<th scope="col" width="15%">订单号</th>'+
                                '<th scope="col" width="10%">品种数</th>'+
                                '<th scope="col" width="10%">收件人</th>'+
                                '<th scope="col" width="10%">付款方式</th>'+
                                '<th scope="col" width="20%">运送方式</th>'+
                                '<th scope="col" width="20%">订货日期</th>'+
                                '<th scope="col" width="20%">操作</th>'+
                            '</tr>';

                        var html2 = "";
                        for (let i = 0; i < result.length; i++) {
                                var date = timestampToTime(result[i].orderDate)
                                html2 +=
                                    '<tr>'+
                                    '<td><a href="javascript:findOrderById('+result[i].orderId+')">'+result[i].orderId+'</a>'+
                                    '</td>'+
                                    '<td>'+result[i].itemNum+'</td>'+
                                    '<td>'+result[i].orderReceiver+'</td>'+
                                    '<td>'+result[i].payment+'</td>'+
                                    '<td>'+result[i].transType+'</td>'+
                                    '<td id="order_date">'+date+'</td>'+
                                    '<td><a href="javascript:tuihuo('+result[i].orderId+')">退货</a> <a href="javascript:tuikuan('+result[i].orderId+')">退款</a></td>'+
                                    '</tr>';
                                check = result[i].orderId;
                        }
                        var html = html1 + html2;
                        $("#resultOrder").html(html);

                    }
                }
            })
        }
        //将时间戳转化为正常时间
        function timestampToTime(timestamp) {
            var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            var Y = date.getFullYear() + '-';
            var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
            var D = date.getDate() + ' ';
            return Y + M + D;
        }
        //通过Id查询订单
        function findOrderById(orderId){
            $.ajax({
                url:"${pageContext.request.contextPath}/order/findOrderById",
                type:"get",
                data:{"orderId":orderId},
                success:function (res){
                    if(res === "true"){
                        console.log("查询订单成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toOrderInfo";
                    }
                }
            })
        }
        // //修改时间格式
        // function update(){
        //   var  date =  document.getElementById("order_date");
        //   date.innerText= dateFormatFn(date);
        //   alert(dateFormatFn(date));
        // }

        function dateFormatFn(date,format='YYYY-MM-DD'){
            let config = {
                YYYY:date.getFullYear(),
                MM:date.getMonth()+1 >10?date.getMonth()+1:'0'+(date.getMonth()+1),
                DD:date.getDate(),
            }
            for(const key in config){
                format = format.replace(key,config[key])
            }
            return format
        }
    </script>
</head>
<body>
<div id="container">
    <div id="head">

        <script type="text/javascript">

            function tuihuo(orderId) {
                findOrderById(orderId);
                alert("您确定要退货吗");
                window.open("${pageContext.request.contextPath}/user/toReturnGoods", "", "width=500,height=300,top=250,left=300");
            }

            function tuikuan(orderId) {
                findOrderById(orderId);
                alert("您确定要退款吗");
                window.open("${pageContext.request.contextPath}/user/toReturnMoney", "", "width=500,height=300,top=250,left=300");
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
        <div id="container">

            <header>

                <div class="nav-bg">
                    <div class="container">

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

                <div class="cartDet">
                    <div class="order_bg">
                        <h4>查看订单</h4>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="resultOrder">

                        </table>
                        <p class="ali_center">

                            首页 上一页 | 下一页 尾页

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
