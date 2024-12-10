<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2024/11/27
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Search Message</title>
    <style>
      .form-group {
        margin-bottom: 10px;
      }
      .hidden {
        display: none;
      }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      // 控制输入框的显示与隐藏
      function toggleFields() {
        var noticeType = document.getElementById("noticeType").value;

        var groupSelect = document.getElementById("groupSelect");

        var classInput = document.getElementById("classInput");
        var classCreatorInput = document.getElementById("classCreatorInput");

        var fromdateInput = document.getElementById("fromdateInput");
        var todateInput = document.getElementById("todateInput");

        var contentInput = document.getElementById("contentInput");
        var whoInput = document.getElementById("whoInput");

        // 隐藏所有输入框
        groupSelect.classList.add("hidden");

        classInput.classList.add("hidden");
        classCreatorInput.classList.add("hidden");

        fromdateInput.classList.add("hidden");
        todateInput.classList.add("hidden");

        contentInput.classList.add("hidden");

        whoInput.classList.add("hidden");

        if(noticeType!==""){
          if (noticeType === "站内信息"){
            groupSelect.classList.remove("hidden");
            whoInput.classList.remove("hidden");
          }
          classInput.classList.remove("hidden");
          classCreatorInput.classList.remove("hidden");
          fromdateInput.classList.remove("hidden");
          todateInput.classList.remove("hidden");
          contentInput.classList.remove("hidden");
        }
      }

      // 提交按钮的处理逻辑
      function handleSubmit() {
        var noticeType = document.getElementById("noticeType").value;
        var messageType = document.getElementById("messageType").value;

        var className = document.getElementById("class").value;
        var classCreator = document.getElementById("classCreator").value;
        var fromdate = document.getElementById("fromdate").value;
        var todate = document.getElementById("todate").value;
        var content = document.getElementById("content").value;
        var who = document.getElementById("who").value;
        $('#res-list').html();
        $.ajax({
          url:"searchMessage?noticeType="+noticeType+ "&messageType="+messageType +
                  "&className="+className+"&classCreator="+classCreator+
                  "&fromdate="+fromdate+"&todate="+todate+"&content="+content+ "&who="+who,
          type:"GET",
          success:function(res){
            alert("提交成功");
            $('#res-list').html(res)
          },
        });
      }
    </script>
    <style>
      /* 全局样式 */
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f7fa;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
      }

      /* 容器样式 */
      .container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        width: 60%;
        box-sizing: border-box;
      }

      h1 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
      }

      /* 表单项样式 */
      .form-group {
        margin-bottom: 20px;
      }

      label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #555;
      }

      input, select, textarea {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
        box-sizing: border-box;
      }

      textarea {
        resize: vertical;
      }

      button {
        width: 100%;
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
      }

      button:hover {
        background-color: #007bff;
      }

      /* 隐藏的内容 */
      .hidden {
        display: none;
      }

      /* Flexbox 排列 */
      .row {
        display: flex;
        justify-content: space-between;
        gap: 20px;
      }

      .row .form-group {
        flex: 1;
      }

      /* 列表样式 */
      #res-list {
        list-style-type: none;
        padding: 0;
      }

      #res-list li {
        padding: 8px;
        border-bottom: 1px solid #ddd;
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

      ul.conversation {
        list-style-type: none;  /* 去除列表项的默认样式 */
        padding: 0;  /* 去除内边距 */
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
  <div class="container">
    <h1>信息查找</h1>

    <div class="row">
      <!-- 选择框 - 班级通知或站内信息 -->
      <div class="form-group">
        <label for="noticeType">选择类型:</label>
        <select id="noticeType" name="noticeType" onchange="toggleFields()">
          <option value="">请选择</option>
          <option value="班级通知">班级通知</option>
          <option value="站内信息">站内信息</option>
        </select>
      </div>

      <!-- 站内信息类型的选择框 -->
      <div id="groupSelect" class="form-group hidden">
        <label for="messageType">选择信息类型:</label>
        <select id="messageType" name="messageType" onchange="toggleFields()">
          <option value="群聊">群聊</option>
          <option value="私聊">私聊</option>
        </select>
      </div>
    </div>

    <div class="row">
      <!-- 班级通知的输入框 -->
      <div id="classInput" class="form-group hidden">
        <label for="class">班级:</label>
        <input disabled="disabled" type="text" id="class" name="class" value="<%=session.getAttribute("IntoClass")%>"/>
      </div>

      <div id="classCreatorInput" class="form-group hidden">
        <label for="classCreator">班主任:</label>
        <input disabled="disabled" type="text" id="classCreator" name="class" value="<%=session.getAttribute("IntoClassCreator")%>"/>
      </div>

      <div id="fromdateInput" class="form-group hidden">
        <label for="fromdate">起始日期:</label>
        <input type="date" id="fromdate" name="date" />
      </div>

      <div id="todateInput" class="form-group hidden">
        <label for="todate">终止日期:</label>
        <input type="date" id="todate" name="date" />
      </div>
    </div>

    <div class="row">
      <div id="contentInput" class="form-group hidden">
        <label for="content">内容:</label>
        <textarea id="content" name="content"></textarea>
      </div>

      <!-- 显示 "谁" 输入框 -->
      <div id="whoInput" class="form-group hidden">
        <label for="who">发言者:</label>
        <input type="text" id="who" name="who" />
      </div>
    </div>

    <div class="row">
      <div class="form-group">
        <button type="button" onclick="handleSubmit()">提交</button>
      </div>
      <div class="form-group">
        <button type="button" onclick='location.href=("intoClass.jsp")'>返回</button>
      </div>
      <br><br>
    </div>
    <!-- 提交按钮 -->


    <div class="message-list">
      <ul id="res-list" class="conversation"></ul>
    </div>
  </div>

  </body>
</html>
