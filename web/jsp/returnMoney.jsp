<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/13
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退款</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="tuihuo">

    <form id="memberModify_action" name="memberRegisterForm" onsubmit="return true;" action="${pageContext.request.contextPath}/order/addAfterSale" method="post">

        <table width="60%" border="0" cellspacing="0" cellpadding="0" align = "center">
            <tr>
                <input type="hidden" value="${uid}" name="userId">
                <input type="hidden" value="${order.orderId}" name="orderId">
                <input type="hidden" value="2" name="type">
                <td>退款金额
                </td>
                <td><input type="text" name="money" value="" id="memberModify_action_member_cardno"/></td>
            </tr>
            <tr>
                <td>退款备注
                </td>
                <td><textarea name="remarks" rows="4" cols="30" id="memberModify_action_member_address"/></textarea></td>
            </tr>
            <tr>
                <td><img   src="${pageContext.request.contextPath}/images/12.gif"   onclick="document.memberRegisterForm.submit();" style= "CURSOR:hand"/>
                </td>
                <td><img   src="${pageContext.request.contextPath}/images/13.gif"   onclick="document.memberRegisterForm.reset();" style= "CURSOR:hand"/></td>
            </tr>

        </table>
    </form>
</div>
</body>
</html>
