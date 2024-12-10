<%@ page import="DataClass.ClassApply" %>
<%@ page import="java.util.List" %>
<%@ page import="DataClass.JoinApply" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/24
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Review Joiner</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            if(!sessionStorage.getItem('RJloaded'))
            {
                $.ajax({
                    //jApplicationsState数据状态标签，jApplicationsState存在时才显示数据
                    url:"applications?reviewType=3&jApplicationsState="+"jApplications",
                    type:"GET",
                    success:function(e){
                        alert("servlet调用成功！");
                        sessionStorage.setItem('RJloaded','true');
                        window.location.reload()
                    },

                });
            }else{sessionStorage.removeItem('RJloaded')}
        });
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6;
        }

        /* 页面整体布局居中 */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 40px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* 链接样式，作为选项显示 */
        a {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            margin: 0 0 20px 0;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #0056b3;
        }

        /* 列表容器 */
        .applications-list {
            max-height: 300px; /* 限制最大高度 */
            overflow-y: auto; /* 使列表可滚动 */
            margin: 10px 0;
            padding: 0;
            list-style-type: none;
        }

        .application-item {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .application-item h3 {
            margin: 0 0 10px 0;
            font-size: 18px;
            color: #333;
        }

        .application-item p {
            margin: 0;
            font-size: 14px;
            color: #666;
        }

        .application-item form {
            display: inline-block;
            margin-top: 10px;
            margin-right: 10px;
        }

        .application-item input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }

        .application-item input[type="submit"]:hover {
            background-color: #218838;
        }

        .application-item .refuse {
            background-color: #dc3545;
        }

        .application-item .refuse:hover {
            background-color: #c82333;
        }

        .application-item .pass {
            background-color: #007bff;
        }

        .application-item .pass:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
    List<JoinApply> itemList = (List<JoinApply>) session.getAttribute("memberApplications");
%>
<%--<%=itemList%><br>--%>
<div class="container">
    <h2>新班级成员申请</h2>
    <a href="classList.jsp">返回</a><br>

    <ul class="applications-list">
        <%
            //jApplicationsState存在时才显示数据，对应jApplications
            if(session.getAttribute("jApplications")!=null){
                for (JoinApply item : itemList) {
        %>
        <li class="application-item">
            <h3>用户名: <%= item.getMember() %></h3>
            <h3>身份: <%=item.getIdentity()%></h3>
            <h3>申请加入的班级: <%=item.getClassName()%></h3>

            <form method="get" action="changeApplications">
                <input type="hidden" name="applicationId" value="<%=item.getId()%>"/>
                <input type="hidden" name="changeType" value="3"/>
                <input type="hidden" name="ifPass" value="0"/>
                <input type="hidden" name="applyUsername" value="<%=item.getMember()%>"/>
                <input type="hidden" name="applyClassname" value="<%=item.getClassName()%>"/>
                <input type="hidden" name="applyCreator" value="<%=item.getCreator()%>"/>
                <input type="submit" value="refuse">
            </form>
            <form method="get" action="changeApplications">
                <input type="hidden" name="applicationId" value="<%=item.getId()%>"/>
                <input type="hidden" name="changeType" value="3"/>
                <input type="hidden" name="ifPass" value="1"/>
                <input type="hidden" name="applyUsername" value="<%=item.getMember()%>"/>
                <input type="hidden" name="applyClassname" value="<%=item.getClassName()%>"/>
                <input type="hidden" name="applyCreator" value="<%=item.getCreator()%>"/>
                <input type="submit" value="pass">
            </form>
        </li>
        <% } }%>
    </ul>
</div>
</body>
</html>
