<%@ page import="DataClass.ClassData" %>
<%@ page import="DataClass.SysNotification" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/21
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ClassList</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            if(!sessionStorage.getItem('classloaded'))
            {
                $.ajax({
                    //classDataState数据状态标签，classDataState存在时才显示数据
                    url:"classData?classDataState="+"classes",
                    type:"GET",
                    success:function(e){
                        alert("servlet调用成功！");
                        sessionStorage.setItem('classloaded','true');
                        window.location.reload()
                    },

                });
            }else{sessionStorage.removeItem('classloaded')}
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
    List<ClassData> itemList = (List<ClassData>) session.getAttribute("classData");
%>
<%--<%=itemList%><br>--%>
<div class="container">
    <h2>班级列表</h2>

    <div class="links-container">
        <%if(session.getAttribute("identity").equals("教师")) {%>
        <a href="transfer.jsp?aplType=3&tar=aplType&jsp=application.jsp"> 创建班级</a>
        <a href="reviewJoiner.jsp"> 审核班级加入</a>
        <%}%>
        <a href="transfer.jsp?aplType=2&tar=aplType&jsp=application.jsp"> 加入班级</a>
        <a href="userMain.jsp">返回</a>
    </div>

    <ul>
        <%
            //classDataState存在时才显示数据，对应classes
            if(session.getAttribute("classes")!=null){
                for (ClassData item : itemList) {
        %>
        <li class="class-item">
            <a href="transfer.jsp?tar=IntoClass&IntoClass=<%=item.getClassName()%>&
creator=<%=item.getCreator()%>&jsp=intoClass.jsp">
                <div class="notification-header">班主任：<%=item.getCreator()%> 老师</div>
                <div class="notification-header">班级名：<%= item.getClassName() %></div>
            </a>
        </li>
        <% } }%>
    </ul>
</div>

</body>
</html>
