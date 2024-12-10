<%@ page import="DataClass.ClassMember" %>
<%@ page import="DataClass.ClassNotification" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/26
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Select Chat</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            if(!sessionStorage.getItem('ChatMloaded'))
            {
                $.ajax({
                    //chatMemberState数据状态标签，chatMemberState存在时才显示数据
                    url:"chatMember?chatMemberState="+"chatMember",
                    type:"GET",
                    success:function(e){
                        alert("servlet调用成功！");
                        sessionStorage.setItem('ChatMloaded','true');
                        window.location.reload()
                    },

                });
            }else{sessionStorage.removeItem('ChatMloaded')}
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

        .links-container a {
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

        li a{

        }

        .class-item {
            cursor: pointer; /* 鼠标指针变为手型，表示该区域可点击 */
            padding: 10px;
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s, transform 0.3s;
        }

        .class-item:last-child {
            border-bottom: none;
        }

        /* 鼠标悬停时的效果 */
        .class-item:hover {
            transform: scale(1.02); /* 略微放大，增加交互感 */
        }

        .class-item a {
            text-decoration: none;
        }

        .notification-header {
            font-size: 16px;
            color: #333;
            margin-bottom: 5px;
        }

        .notification-header:first-child {
            font-weight: bold; /* 班主任字体加粗 */
            color: #4CAF50;
        }

        .notification-header:last-child {
            color: #2196F3; /* 班级名的字体颜色 */
        }
    </style>
</head>
<body>
<%
    List<ClassMember> itemList = (List<ClassMember>) session.getAttribute("chatMembers");
%>
<%--<%=itemList%><br>--%>
<div class="container">
    <h2>站内沟通</h2>

    <div class="links-container">
        <a href="intoClass.jsp">返回</a>
    </div>

    <ul>
        <li class="class-item">
            <a href="transfer.jsp?tar=chatType&chatType=1&jsp=chat.jsp">
                <div class="notification-header"><%=session.getAttribute("IntoClass")%> 群聊</div>

            </a>
        </li><br>
        <%
            //chatMemberState存在时才显示数据，对应chatMember
            if(session.getAttribute("chatMember")!=null){
                for (ClassMember item : itemList) {
        %>
        <li class="class-item">
            <a href="transfer.jsp?tar=chatType&chatType=2&selectMember=<%=item.getMemberID()%>&jsp=chat.jsp">
                <div class="notification-header"><%= item.getMemberID()%> <%=item.getIdentity()%></div>
            </a>
        </li><br>
        <% } }%>
    </ul>
</div>

</body>
</html>
