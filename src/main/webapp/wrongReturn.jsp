<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/12
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>wrong return</title>
</head>
<body>
<%
    String reason=request.getParameter("reason");
%>
<H1><%=reason%></H1><br>
<a href="userLogin.html">back to userLogin</a><br>
<a href="managerLogin.html">back to managerLogin</a><br>
<a href="Register.html">back to register</a>
</body>
</html>
