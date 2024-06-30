<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/3
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<style>
    .paginate {
        不能 吧                                 不啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     不啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵啵                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            你                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           你你你你你你你你你你你你你你你你你你你n'b'b'b'b'b'b'b'b'b'b'b'b'b'b'b'b'b'b，           ，
        font-size:0;
    }
    .paginate li{
        font-size:14px;
        display: inline-block;
        margin-right:10px;
        text-align: center;
        width:30px;
        height:28px;
        line-height: 28px;
        border:1px solid #ddd;
    }
    .paginate [disabled]{
        color:gray;
    }
    .paginate li:not([disabled]):hover {
        cursor: pointer;
        color:#fff;
        background-color: #009688;
    }
    .paginate li.jump{
        border:none;
        width:auto;
    }
    .paginate li.jump .entrance{
        border:1px solid #ddd;
        text-align: center;
        width:30px;
        height:28px;
    }
</style>
<head>
    <title>商品列表管理</title>
    <script>
        function timestampToTime(timestamp) {
            var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
            var Y = date.getFullYear() + '-';
            var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
            var D = date.getDate() + ' ';
            return Y + M + D;
        }
        //全部商品
        function allGoods(){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/getAllGoods",
                type:"get",
                dataType:"json",
                contentType :"application/x-www-form-urlencoded",
                success :function (res){
                    var result1 = JSON.stringify(res);
                    var result = JSON.parse(result1);

                    var html = "";
                    for(var i = 0; i < result.length; i++){
                        var date =result[i].goodsDate;
                        date = timestampToTime(date);
                        html +=
                    '<tr>'+
                        '<td><a href="javascript:goodsDetail('+result[i].goodsId+')">'+result[i].goodsName+'</a></td>'+
                        '<td>'+result[i].goodsPrice+'</td>'+
                        '<td>'+date+'</td>'+
                            '<td><img src="${pageContext.request.contextPath}/images/34.gif" onclick="${pageContext.request.contextPath}/user/toGoodsManageEdit" style="border:0; cursor:hand;"/> </td>'+
                        '<td><img src="${pageContext.request.contextPath}/images/35.gif" onclick="${pageContext.request.contextPath}/user/toGoodsManageEdit" style="border:0; cursor:hand;"/> </td>'+
                    '</tr>';
                    }
                    $("#goods").append(html);
                }
            })
        }
        //商品详情
        function goodsDetail(goodsId){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/goodsDetails",
                type:"get",
                data:{"goodsId":goodsId},
                success:function (res){
                    if(res === "true"){
                        console.log("查询商品详情成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toGoodsManageView";
                    } else {
                        alert("查询商品详情失败！");
                    }

                }
            })
        }

        //加载数据，这个函数作用：1、页面初始化渲染，2、点击分页时调用。现在你可以理解为页面初始化用的。
        // currentId 当前第几页
        function loadData(currentId) {
            $.ajax({
                url: "${pageContext.request.contextPath}/goods/getGoodsByPage",
                type: "get",
                dataType: 'json',
                data: {"page":currentId},
                success: function (res) {
                    var result1 = JSON.stringify(res);
                    console.log(result1);
                    var result = JSON.parse(result1);
                    //paginatFactory函数是渲染页面的核心
                    paginatFactory(result, currentId);
                }, error: function (res) {
                    console.log(res);
                }
            })
        }
        function paginatFactory(res, currentId) {
            var html =
                '<tr>'+
                    '<th scope="col" width="30%"> 商品名称 </th>'+
                    '<th scope="col" width="15%"> 价格 </th>'+
                    '<th scope="col" width="20%"> 发布日期 </th>'+
                    '<th scope="col" width="10%"> 修改 </th>'+
                    '<th scope="col" width="10%"> 删除 </th>'+
                '</tr>';//html变量存储要展示的内容，下面循环不在赘述。

            for (var i = 0; i < res.rows.length; i++) {
                var date =res.rows[i].goodsDate;
                date = timestampToTime(date);
                html +=
                    '<tr>'+
                    '<td><a href="javascript:goodsDetail('+res.rows[i].goodsId+')">'+res.rows[i].goodsName+'</a></td>'+
                    '<td>'+res.rows[i].goodsPrice+'</td>'+
                    '<td>'+date+'</td>'+
                    '<td><img src="${pageContext.request.contextPath}/images/34.gif" onclick="updateGoods('+res.rows[i].goodsId+')" style="border:0; cursor:hand;"/> </td>'+
                    '<td><img src="${pageContext.request.contextPath}/images/35.gif" onclick="delGoods('+res.rows[i].goodsId+')" style="border:0; cursor:hand;"/> </td>'+
                    '</tr>';
            }
            $('#articlelist').html(html);    //请在body中加一个id为//articlelist的table标签来查看效果。

            //这里就是分页核心了，为了更好查看效果，请在刚才id为articlelist表格后创建一个class为paginate的ul标签。
            //disabled设置页码不能点击，如果当前页是第一页，«按钮不能点
            var pageHtml = "<li " + (res.previou ? "" : "disabled") + " data-pageid='" + res.previou + "'>«</li>";
            //pageTotal来设置分页显示数量，如果>=6的话，最多显示6条，否则你懂得
            var pageTotal = res.total >= 6 ? 6 : res.total;
            //由于是两种样式，所以根据当前页来更改
            if (currentId < 6) {
                for (var j = 1; j <= pageTotal; j++) {
                    pageHtml += "            <li " + (currentId === j ? "disabled" : "") + " data-pageid='" + j + "'>" + j + "</li>";
                }
            } else {
                //如果大于6，会加上...并且1、2页都在左侧留着
                for (var j = 1; j <= pageTotal; j++) {
                    //小于3的话 1、2页码一直存在
                    if (j < 3) {
                        pageHtml += "            <li " + (currentId === j ? "disabled" : "") + " data-pageid='" + j + "'>" + j + "</li>";
                    }
                    //等于3，加上...
                    if (j === 3) {
                        pageHtml += "<li disabled class='jump'>...</li>";
                    }
                    //如果当前页大于三。页码需要根据当前页来渲染。
                    if (currentId > 3) {
                        //当前页-1，如果当前页是7，左边显示7-1=6
                        if (j === 4) {
                            if (currentId === res.total) {
                                pageHtml += "<li data-pageid='" + (currentId - 2) + "'>" + (currentId - 2) + "</li>";
                            }
                            pageHtml += "<li data-pageid='" + (currentId - 1) + "'>" + (currentId - 1) + "</li>";
                        }
                        //当前页，注意disabled，不能在点击，
                        if (j === 5) {
                            pageHtml += "<li disabled data-pageid='" + currentId + "'>" + currentId + "</li>";
                        }
                        //这里当前页+1，你应该懂了。
                        if (j === 6 && currentId < res.total) {
                            pageHtml += "<li data-pageid='" + (currentId + 1) + "'>" + (currentId + 1) + "</li>";
                        }
                    }
                    //这里如果当前页小于总页数的倒数第二页，...就显示。否则后面每页数了就不显示。
                    if (j === 6 && currentId < (res.total - 1)) {
                        pageHtml += "<li disabled class='jump'>...</li>";
                    }
                }
            }
            //这里判断是不是最后一页，是就disabled
            pageHtml += "            <li " + (currentId >= res.total ? "disabled" : "") + " data-pageid='" + res.next + "'>»</li>";
            //这里就是页面直接跳转了。
            pageHtml += "<li class='jump' disabled>共" + res.total + "页, 到第<input class='entrance' value='" + currentId + "' type='text'>页</li><li data-total='" + res.total + "' class='confirm'>确定</li>"
            //最后渲染
            $('.paginate').html(pageHtml);
        }
        loadData(1);// 初始化 页面第一次渲染时，相当于获取第一页的数据，所以这里传1
        /*
        @ currentId 当前页数
         */
        $(document).on('click', '.paginate li:not([disabled])', function () {
            //confirm 判断点击的是确定还是页码
            if ($(this).hasClass('confirm')) {
                //是确定，要获取输入的是第几页。
                var page = parseInt($('.entrance').val());
                if (page <= 0 || page > $(this).data('total') || isNaN(page)) {
                    layer.msg('请输入正确的页码！');
                } else {
                    //符合正确页数后调用ajax方法。
                    loadData(page);
                }
            } else {
                //这里就是点击页码后的调用。
                var pageId = $(this).data('pageid');
                loadData(pageId);
            }
        });

        //修改商品
        function updateGoods(goodsId){
            goodsDetail(goodsId);
            window.location.href="${pageContext.request.contextPath}/user/toGoodsManageEdit";
        }
        //删除商品
        function delGoods(goodsId){
            $.ajax({
                url:"${pageContext.request.contextPath}/goods/delGoods",
                type:"post",
                data:{"goodsId":goodsId},
                success :function (res){
                    if(res === "true"){
                        alert("删除商品成功！");
                        window.location.href="${pageContext.request.contextPath}/user/toGoodsManageList";
                    } else {
                      alert("删除商品失败！");
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
</head>
<body>
<div class="main">


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
                        <img src="${pageContext.request.contextPath}/images/23.gif" class="flo_left" /><span>商品列表</span></h3>
                    <div class="padd">
                        <p class="ali_center">



                        </p>
                        <p>[ 商品列表 ] [ <a href="${pageContext.request.contextPath}/user/toGoodsManageAdd">添加商品信息</a>]</p>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="articlelist" >



                            <ul class="paginate"></ul>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
