<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/21
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Application</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            if (!sessionStorage.getItem('applicationloaded')) {
                sessionStorage.setItem('applicationloaded','true');
                window.location.reload()
            }else {sessionStorage.removeItem('applicationloaded')}
        });
    </script>
    <style>
        /* 页面背景色和字体 */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* 创建一个容器来包裹表单 */
        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        /* 表单标题样式 */
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* 输入框样式 */
        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        /* 输入框聚焦时的样式 */
        input[type="text"]:focus {
            border-color: #007bff;
            outline: none;
        }

        /* 提交按钮样式 */
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        /* 提交按钮悬停时的样式 */
        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* 隐藏字段样式 (保持不变) */
        input[type="hidden"] {
            display: none;
        }

        /* 链接样式 */
        a {
            display: inline-block;
            margin-top: 10px;
            text-align: center;
            width: 100%;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }

        /* 链接容器样式 */
        .links {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <%if(session.getAttribute("aplType")!=null){%>
    <%if(session.getAttribute("aplType").equals("1")){%>
    <h2>成为教师</h2>
    <form action="createApplication" method="get">
        Reason:<input type="text" name="reason"/><br>
        <input type="hidden" name="username" value="<%=session.getAttribute("SESSIONID")%>"/>
        <input type="hidden" name="applicationType" value="1"/>
        <input type="submit" value="Submit">
    </form>
    <a href="userMain.jsp">返回</a>
    <%}else if(session.getAttribute("aplType").equals("2")){%>
    <h2>班级加入</h2>
    <form action="createApplication" method="get">
        ClassName:<input type="text" name="className"/><br>
        ClassCreatorName:<input type="text" name="creator"/><br>
        <input type="hidden" name="username" value="<%=session.getAttribute("SESSIONID")%>"/>
        <input type="hidden" name="applicationType" value="2"/>
        <input type="submit" value="Submit">
    </form>
    <a href="classList.jsp">返回</a>
    <%}else{%>
    <h2>创建班级</h2>
    <form action="createApplication" method="get">
        ClassName:<input type="text" name="className"/><br>
        <input type="hidden" name="username" value="<%=session.getAttribute("SESSIONID")%>"/>
        <input type="hidden" name="applicationType" value="3"/>
        <input type="submit" value="Submit">
    </form>
    <a href="classList.jsp">返回</a>
    <%}}%>
</div>

</body>
</html>
