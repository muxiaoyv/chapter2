<%--
  Created by IntelliJ IDEA.
  User: 小羽
  Date: 2017/10/5
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>小春论坛登录</title>
</head>
<body>
<c:if test="${!empty error}">
    <font color="red"><c:out value="${error}" /></font>
</c:if>
<form action="<c:url value='/j_spring_security_check'/>" method="post">
    用户名：
    <input type="text" name="j_username" />
    <br>
    密 码：
    <input type="password" name="j_password" />
    <br>
    <input type="submit" value="登录" />
    <input type="reset" value="重置" />
</form>
</body>
</html>
