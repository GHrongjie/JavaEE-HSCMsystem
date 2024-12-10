<%@ page import="DataClass.ClassMember" %>
<%@ page import="java.util.List" %>
<%@ page import="DataClass.ChatData" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/26
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        function loadMessages() {
            $.ajax({
                url:"chatData",
                type:"GET",
                success:function(response){
                    $('#time-list').html(response);
                },

            });
        }

        // 发送消息
        function sendMessage() {
            var message = $("#message").val();
            if(message!=null){
                $.ajax({
                    url:"chatData?message="+message,
                    type:"POST",
                    success:function(res){
                        loadMessages();
                        $("#message").val(""); // 清空输入框
                    },

                });
            }
        }

        $(document).ready(function() {
            loadMessages();
            setInterval(loadMessages, 3000); // 每隔1秒刷新一次聊天记录
        });
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f7f7f7;
            position: relative; /* 保证返回链接可以放置在左上角 */
        }

        .chat-container {
            width: 60%;
            height: 90vh; /* 使高度与浏览器窗口高度一致 */
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            position: relative; /* 保证容器内的元素不会遮挡返回链接 */
        }

        .chat-header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .message-list {
            width: 100%;
            height: 400px;
            overflow-y: scroll;
            margin-bottom: 20px;
            padding-right: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        #time-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        textarea {
            width: 75%;
            height: 50px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
            margin-right: 10px;
            resize: none;
            box-sizing: border-box;
        }

        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            align-self: flex-start;
        }

        button:hover {
            background-color: #45a049;
        }

        .input-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            align-items: flex-start;
        }

        /* 返回链接的样式 */
        .back-link {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 16px;
            color: #007bff;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        ul.conversation {
            list-style-type: none;  /* 去除列表项的默认样式 */
            padding: 0;  /* 去除内边距 */
        }

        li {
            display: flex;  /* 使用Flexbox使发言人和发言内容水平排列 */
            align-items: flex-start;  /* 保证发言人的位置与发言内容顶部对齐 */
            margin-bottom: 10px;  /* 每个<li>之间的间距 */
        }

        .speaker {
            font-weight: bold;  /* 发言人的字体加粗 */
            margin-right: 10px;  /* 发言人与内容之间的间距 */
        }

        .content {
            max-width: 80%;  /* 发言内容最大宽度为容器的80%，避免过长 */
            word-wrap: break-word;  /* 自动换行 */
            white-space: normal;  /* 允许内容折行 */
        }
    </style>
</head>
<body>
<div class="chat-container">
    <a href="selectChat.jsp" class="back-link">返回</a>
    <div class="chat-header">站内沟通</div>

    <div class="message-list">
        <ul id="time-list" class="conversation"></ul>
    </div>

    <div class="input-container">
        <textarea id="message" placeholder="输入消息..."></textarea>
        <button onclick="sendMessage()">发送</button>
    </div>
</div>

</body>
</html>
