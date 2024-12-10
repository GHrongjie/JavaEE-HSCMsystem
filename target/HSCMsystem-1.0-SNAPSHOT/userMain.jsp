<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/13
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UserMain</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            if(!sessionStorage.getItem('UMloaded'))
            {
                $.ajax({
                    url:"getIdentity?username=<%=request.getSession().getAttribute("SESSIONID")%>",//servlet文件的名称
                    type:"GET",
                    success:function(e){
                        alert("servlet调用成功！");
                        sessionStorage.setItem('UMloaded',true);
                        window.location.reload()
                    },
                });
            }else{sessionStorage.removeItem('UMloaded')}
        });
    </script>
    <style>
        /* 设置页面的基本样式 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        /* 标题样式 */
        h1 {
            margin-bottom: 30px;
            font-size: 2rem;
            color: #333;
        }

        /* 选项容器样式 */
        .menu-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }

        /* 每个链接的样式 */
        .menu-item {
            display: block;
            width: 250px; /* 设置固定宽度，使选项宽度一致 */
            padding: 15px;
            font-size: 1.2rem;
            text-decoration: none;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            text-align: center; /* 确保文本居中 */
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .menu-item:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .menu-item:active {
            background-color: #00408d;
        }
    </style>
</head>
<body>
<%if(session.getAttribute("identity")!=null){%>
<h1><%=session.getAttribute("identity")%> <%=session.getAttribute("SESSIONID")%> Welcome Back</h1><br>

<div class="menu-container">
    <%
        if(session.getAttribute("identity").equals("家长")) {
    %>
    <a href="transfer.jsp?aplType=1&tar=aplType&jsp=application.jsp" class="menu-item">申请成为教师</a><br>
    <%}}%>
    <a href="classList.jsp" class="menu-item">班级列表</a><br>
    <a href="systemNotification.jsp" class="menu-item">系统通知</a><br>
</div>
</body>
</html>
