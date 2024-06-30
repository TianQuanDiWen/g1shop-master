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
    <title>会员管理</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
</head>
<body>
<div class="main">
    <script>
        window.onload = function (){
            allUser();
        }
        //查询所有用户
        function allUser(){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/getAllUser",
                type:"get",
                dataType:"json",
                contentType :"application/x-www-form-urlencoded",
                success :function (res){
                    var result1 = JSON.stringify(res);
                    var result = JSON.parse(result1);
                    var html = "";
                    for(var i = 0; i < result.length; i++){
                        var level = result[i].level;
                        var status = result[i].status;
                        var img = "";
                        if(level === 1){
                             level ="铜牌会员";
                        } else if(level === 2){
                            level ="银牌会员";
                        } else if(level === 3){
                            level ="金牌会员";
                        } else if(level === 4){
                            level ="白金会员";
                        } else if(level === 5){
                            level ="钻石会员";
                        }
                        if (status === 1){
                            img = "dongjie.png";
                        } else if(status === 2){
                            img = "jiedong.png";
                        }
                        html +=
                            '<tr>'+
                                '<td><a href="javascript:userDetail('+result[i].uid+')">'+result[i].username+'</a></td>'+
                                '<td>'+result[i].actualName+'</td>'+
                                '<td>'+level+'</td>'+
                                '<td>'+result[i].city+'</td>'+
                                '<td>'+result[i].phone+'</td>'+
                                '<td>'+result[i].email+'</td>'+
                                '<td>'+
                                    '<img alt="正常" src="${pageContext.request.contextPath}/images/'+img+'" onclick="closeAndOpenUser('+result[i].uid+')" style="border:0; cursor:hand;"/>'+
                                '</td>'+
                            '</tr>';
                    }
                    $("#user").append(html);
                }
            })
        }
        //冻结解冻
        function  closeAndOpenUser(uid){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/closeAndOpenUser",
                type:"post",
                data: {"uid":uid},
                success:function (res){
                    if(res === "true"){
                        alert("已成功解冻！");
                        window.location.href="${pageContext.request.contextPath}/user/toUserManageList";
                    } else if(res == "false"){
                        alert("已成功冻结！");
                        window.location.href="${pageContext.request.contextPath}/user/toUserManageList";
                    }
                }
            })
        }
        //查询用户详情
        function userDetail(uid){
            $.ajax({
                url: "${pageContext.request.contextPath}/user/userDetail",
                type: "get",
                data:{"uid":uid},
                success :function (res){
                    if(res === "true"){
                        console.log("查询用户详情成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toUserManageView";
                    } else {
                        console.log("查询用户详情失败！");
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
                    <h3><img src="${pageContext.request.contextPath}/images/25.gif" class="flo_right" /><img src="${pageContext.request.contextPath}/images/23.gif" class="flo_left" /><span>会员管理</span></h3>
                    <div class="padd">

                        <p class="ali_center">


                        </p>
                        <p> [会员列表]</p>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="user">
                            <tr>
                                <td scope="col" width="10%"> 用户名 </td>
                                <td scope="col" width="10%"> 真实姓名 </td>
                                <td scope="col" width="10%"> 用户等级 </td>
                                <td scope="col" width="15%"> 城 市 </td>
                                <td scope="col" width="10%"> 电 话 </td>
                                <td scope="col" width="20%"> E-mail </td>
                                <td scope="col" width="10%"> 冻结/解冻 </td>
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
