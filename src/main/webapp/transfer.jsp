<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/24
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        String tar=request.getParameter("tar");//目标
        String res=request.getParameter(tar);//目标要被设置的值
        String creator=request.getParameter("creator");//进入班级界面时才用到，用来确定班级
        String selectMember=request.getParameter("selectMember");//进入教师聊天界面时才用到,用来确定聊天对象是哪个教师
        String sendto=request.getParameter("jsp");//跳到哪个界面
        session.setAttribute(tar,res);
        if(creator!=null){
            session.setAttribute("IntoClassCreator",creator);
        }
        if(selectMember!=null){
            session.setAttribute("selectMember",selectMember);
        }
        response.sendRedirect(sendto);
    %>
</head>
<body>

</body>
</html>
