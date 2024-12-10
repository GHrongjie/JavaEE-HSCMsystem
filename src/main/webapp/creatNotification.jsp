<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/19
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Creat Notification</title>
</head>
<style>
    /* 页面基本样式 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7f6;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    /* 表单容器样式 */
    .form-container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 100%;
        max-width: 500px;
        text-align: center;
    }

    h2 {
        color: #333;
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-size: 16px;
        margin-bottom: 10px;
        text-align: left;
    }

    textarea {
        width: 100%;
        height: 150px;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
        resize: vertical;
        margin-bottom: 20px;
    }

    input[type="submit"] {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 4px;
        width: 100%;
        margin-top: 10px;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        color: #007BFF;
        text-decoration: none;
        font-size: 16px;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
<body>
<div class="form-container">
    <%if(session.getAttribute("identity")!=null){%>
    <h2>创建班级通知</h2>
    <form action="changeNotifications" method="get">
        <label>Text:<textarea name="classNoticeContent"></textarea></label><br>
        <input type="hidden" name="changeType" value="3"/>
        <input type="submit" value="Submit">
    </form>
    <a href="classNotification.jsp">返回</a><br>
    <%}else{%>
    <h2>创建系统通知</h2>
    <form action="changeNotifications" method="get">
        <label>Text:<textarea name="sysNoticeContent"></textarea></label><br>
        <input type="hidden" name="changeType" value="1"/>
        <input type="submit" value="Submit">
    </form>
    <a href="systemNotification.jsp">返回</a><br>
    <%}%>
</div>


</body>
</html>
