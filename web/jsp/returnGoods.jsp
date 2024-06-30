<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/13
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退货</title>
    <link href="${pageContext.request.contextPath}/styles/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="tuihuo">

    <form id="memberModify_action" name="memberRegisterForm" onsubmit="return true;" action="${pageContext.request.contextPath}/order/addAfterSale" method="post">

        <table width="60%" border="0" cellspacing="0" cellpadding="0" align = "center">
            <tr>
                <td>退货理由
                </td>
                <input type="hidden" value="${uid}" name="userId">
                <input type="hidden" value="${order.orderId}" name="orderId">
                <input type="hidden" value="1" name="type">
                <td><textarea name="remarks" rows="4" cols="30" id=""/></textarea></td>
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
