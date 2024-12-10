<%@ page import="DataClass.ClassNotification" %>
<%@ page import="DataClass.SysNotification" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/25
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Class Notification</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            if(!sessionStorage.getItem('CNloaded'))
            {
                $.ajax({
                    //classNoticesState数据状态标签，classNoticesState存在时才显示数据
                    url:"notifications?NoticeType=3&classNoticesState="+"classnotice",
                    type:"GET",
                    success:function(e){
                        alert("servlet调用成功！");
                        sessionStorage.setItem('CNloaded','true');
                        window.location.reload()
                    },

                });
            }else{sessionStorage.removeItem('CNloaded')}
        });
    </script>
    <style>
        /* 整体布局：内容居中 */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        .container {
            width: 80%;
            max-width: 900px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        /* 链接的样式 */
        .links-container {
            text-align: center; /* 中心对齐 */
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }

        /* 系统通知列表 */
        ul {
            list-style-type: none;
            padding: 0;
            max-height: 400px;
            overflow-y: auto;
            margin-top: 20px;
        }

        li {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            padding: 15px;
            text-align: left;
        }

        li .notification-header {
            font-weight: bold;
            font-size: 16px;
            color: #007bff;
        }

        li .notification-date {
            font-size: 14px;
            color: #888;
        }

        li .notification-content {
            font-size: 14px;
            color: #333;
            margin-top: 10px;
        }

    </style>
</head>
<body>
<%
    List<ClassNotification> itemList = (List<ClassNotification>) session.getAttribute("classNotifications");
%>
<%--<%=itemList%><br>--%>
<div class="container">
    <h2>班级通知</h2>

    <div class="links-container">
        <%if(session.getAttribute("identity").equals("教师")) {%>
        <a href="creatNotification.jsp"> 发布班级通知</a>
        <a href="delClassNotifications.jsp">删除我已发布的通知</a>
        <%}%>
        <a href="intoClass.jsp">返回</a>
    </div>

    <ul>
        <%
            //classNoticesState存在时才显示数据，对应classnotice
            if(session.getAttribute("classnotice")!=null){
                for (ClassNotification item : itemList) {
        %>
        <li>
            <div class="notification-header">教师：<%= item.getNotifierId() %></div>
            <div class="notification-date">时间：<%= item.getDate() %></div>
            <div class="notification-content">内容：<br><%= item.getContent() %></div>
        </li>
        <% } }%>
    </ul>
</div>

</body>
</html>
