<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/3
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
</head>
<body>
<div class="main">

    <script type="text/javascript">

        window.onload = function (){
            allOrder();
        }
        function timestampToTime(timestamp) {
            var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            var Y = date.getFullYear() + '-';
            var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
            var D = date.getDate() + ' ';
            return Y + M + D;
        }
        function allOrder(){
            $.ajax({
                url:"${pageContext.request.contextPath}/order/getAllOrder",
                type:"get",
                dataType:"json",
                contentType :"application/x-www-form-urlencoded",
                success :function (res){
                    var result1 = JSON.stringify(res);
                    var result = JSON.parse(result1);
                    var html = "";
                    for(var i = 0; i < result.length; i++) {
                        var status = "";
                        if(result[i].status === 1){
                            status = "待处理";
                        } else if(result[i].status === 2){
                            status = "已退货";
                        } else if(result[i].status === 3){
                            status = "已退款";
                        } else if(result[i].status === 4){
                            status = "已关闭";
                        } else {
                            status = "已完成";
                        }
                        var date = result[i].orderDate;
                        date = timestampToTime(date);
                            html +=
                                '<tr>' +
                                '<td><a href="javascript:orderDetail(' + result[i].orderId + ')"> ' + result[i].orderId + '</a></td>' +
                                '<td>' + result[i].itemNum + '</td>' +
                                '<td>' + result[i].orderReceiver + '</td>' +
                                '<td>' + result[i].payment + '</td>' +
                                '<td>' + result[i].transType + '</td>' +
                                '<td>' + date + '</td>' +
                                '<td>'+status+'</td>' +
                                '<td><a href="javascript:chulituihuo(' + result[i].orderId + ')">退货 |</a>' +
                                '<a href="javascript:tuikuan(' + result[i].orderId + ')"> 退款 |</a>' +
                                '<a href="javascript:guanbi(' + result[i].orderId + ')"> 关闭</a></td>' +
                                '</tr>';
                            check = result[i].orderId;
                    }
                    $("#order").append(html);
                }
            })
        }
        function orderDetail(orderId){
            $.ajax({
                url:"${pageContext.request.contextPath}/order/findOrderById",
                type: "get",
                data:{"orderId":orderId},
                success:function (res){
                    if(res === "true"){
                        console.log("查询订单详情成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toOrderManageView";
                    }
                }
            })
        }
            //后台登出
            function logOut(){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/logOut",
                type:"get",
                success:function (res){
                    if(res === "true"){
                        alert("管理员退出成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toManage";
                    }
                }
            })
        }
        function chulituihuo(orderId){
            var type = 1;
            findOrderById(orderId);
            getAfterSale(orderId,type);
            window.open("${pageContext.request.contextPath}/user/toCheckReturnGoods","","width=500,height=300,top=300,left=300");
        }
        function tuikuan(orderId){
            var type = 2;
            findOrderById(orderId);
            getAfterSale(orderId,type);
            window.open("${pageContext.request.contextPath}/user/toCheckReturnMoney","","width=500,height=300,top=300,left=300");
        }
        function guanbi(orderId){
            findOrderById(orderId);
            window.open("${pageContext.request.contextPath}/user/toCloseOrder","","width=500,height=300,top=300,left=300");
        }
        function getAfterSale(orderId,type){
            $.ajax({
                url:"${pageContext.request.contextPath}/order/getAfterSale",
                type:"post",
                data: {"type":type,"orderId":orderId},
                success:function (res){
                    if (res === "true"){
                        console.log("查询售后成功！");
                    }
                }
            })
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
                    }
                }
            })
        }
    </script>

    <div class="top">
        <p>
            <a href="${pageContext.request.contextPath}/user/toGoodsManageList">商品管理</a> |
            <a href="${pageContext.request.contextPath}/user/toUserManageList">会员管理</a> |
            <a href="${pageContext.request.contextPath}/user/toOrderManageList">订单管理</a> |
            <a href="javascript:logOut()">退出后台</a>
        </p>
    </div>
    <div class="adm_con">
        <div class="bg_3">
            <div class="bg_1">
                <div class="bg_2">
                    <h3><img src="${pageContext.request.contextPath}/images/25.gif" class="flo_right" /><img src="${pageContext.request.contextPath}/images/23.gif" class="flo_left" /><span>订单管理</span></h3>
                    <div class="padd">
                        <p class="ali_center">



                        </p>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="order">
                            <tr>
                                <td scope="col" width="10%"> 订单号 </td>
                                <td scope="col" width="10%"> 品种数 </td>
                                <td scope="col" width="10%"> 收件人 </td>
                                <td scope="col" width="10%"> 付款方式 </td>
                                <td scope="col" width="10%"> 运送方式 </td>
                                <td scope="col" width="15%"> 订货日期 </td>
                                <td scope="col" width="10%"> 执行</td>
                                <td scope="col" width="25%"> 操作</td>
                            </tr>






                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
