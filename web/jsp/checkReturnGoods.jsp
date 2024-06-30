<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/13
  Time: 19:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理退货</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script>
    window.onbeforeunload = function() {
        window.opener.location.reload();
    };


</script>
<div class="tuihuo">


    <form id="memberModify_action" name="memberRegisterForm" onsubmit="return true;" action="${pageContext.request.contextPath}/order/checkAfterSale" method="post">

        <table width="60%" border="0" cellspacing="0" cellpadding="0" align = "center">
            <tr>
                <input type="hidden" name="orderId" value="${afterSale.orderId}">
                <td>处理结果
                </td>
                <td><select name="status"><option value="2">同意退货</option><option value="0">拒绝退货</option></select></td>
            </tr>
            <tr>
                <td>退货地址
                </td>
                <td><input type="text" name="address" value="${order.address}" id="memberModify_action_member_cardno"/></td>
            </tr>
            <tr>
                <td>退货理由
                </td>
                <td><textarea name="remarks" rows="4" cols="30" id="memberModify_action_member_address"/>${afterSale.remarks}
                    </textarea></td>
            </tr>
            <tr>
                <td><img   src="${pageContext.request.contextPath}/images/12.gif"  onclick="document.memberRegisterForm.submit();"  style= "CURSOR:hand"/>
                </td>
                <td><img   src="${pageContext.request.contextPath}/images/13.gif"   onclick="document.memberRegisterForm.reset();" style= "CURSOR:hand"/></td>
            </tr>

        </table>
    </form>
</div>
</body>
</html>
