<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/3
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="main">
    <script>
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
                    <h3><img src="${pageContext.request.contextPath}/images/25.gif" class="flo_right" />
                        <img src="${pageContext.request.contextPath}/images/23.gif" class="flo_left" />
                        <span>商品列表</span>
                    </h3>
                    <div class="padd">
                        <p> [  添加商品信息]</p>
                        <form namespace="/" id="goodsManageAdd" name="addForm" action="${pageContext.request.contextPath}/goods/addGoods" method="post" >
                            <ul class="add">
                                <li><span> 商品名称： </span>
                                    <input type="text" name="goodsName" value="" id="goodsManageAdd_shopGoods_goodsname"/> <font color="red">*</font>
                                </li>
                                <li><span>上传图片：</span>
                                    <input type="file" name="goodsImg" value="" id="goodsManageAdd_upload"/> <font color="red">*</font>
                                </li>
                                <li><span>价&nbsp;&nbsp;&nbsp;&nbsp;格：</span>
                                    <input type="text" name="goodsPrice" value="" id="goodsManageAdd_shopGoods_price"/> <font color="red">*</font>
                                </li>
                                <li><span> 商品类型： </span>
                                    <select name="goodsType" >
                                        <option value="1">智能手机</option>
                                        <option value="2">平板电脑</option>
                                        <option value="3">电视</option>
                                        <option value="4">笔记本</option>
                                        <option value="5">家电</option>
                                        <option value="6">路由器</option>
                                        <option value="7">智能硬件</option>
                                        <option value="8">移动配件</option>
                                        <option value="9">智能养生</option>
                                        <option value="10">生活箱包</option>
                                    </select>
                                </li>
                                <li style="height:100px;"><span>商品简介：</span>
                                    <textarea name="goodsIntroduce" cols="60" rows="5" id="goodsManageAdd_shopGoods_introduce"></textarea>
                                </li>
                            </ul>
                            <p class="ali_center">
                                <img src="${pageContext.request.contextPath}/images/12.gif" onclick="document.addForm.submit();" style="border:0; cursor:hand"/>
                                <img src="${pageContext.request.contextPath}/images/13.gif" onclick="document.addForm.reset();" style="border:0; cursor:hand"/>
                                <img src="${pageContext.request.contextPath}/images/29.gif" onclick="window.location.href='${pageContext.request.contextPath}/user/toGoodsManageList'" style="border:0; cursor:hand"/>
                            </p>
                        </form>




                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
