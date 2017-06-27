/* 14130140361 xinxin
*/
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@	page import="com.classInfo.Entity.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>信息内容</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
p {
	
}

;
#message {
	color: #03A9F4;
}
;
</style>
</head>

<body style="padding-right: 200px;padding-left: 200px;">
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		NewsList newslist = (NewsList) session.getAttribute("newsList");

		List<News> list = newslist.getList();
		News news = new News();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getId() == id) {
				news = list.get(i);
			}
		}
	%>

	<h2 align="center" id="top"><%=news.getTitle()%></h2>
	<p>
		发布时间:<%=news.getDate()%></p>
	<p>
		发布人:<%=news.getUserId()%></p>
	<br>
	<p align="justify">
		<b>通知内容:</b>
	</p>
	<p align="justify" style="font-size: 30px;font-family: 楷体;">
		<b><%=news.getContent()%></b>
	</p>

	<p>
	<hr color="green">
	
	<p id="message" style="color: green;">留言板:
	<p>
		<%
			String userid = (String) session.getAttribute("currentstu_num");
		%>
		<%
			if (userid != null || !userid.isEmpty()) {
		%>
	
	<div>
		<form action="../../InformationWeb/servlet/AddDicussServlet" method="post">
			<input type="hidden" value=<%=userid%> name="userid"> <input
				type="hidden" value=${currentname } name="currentname"> <input
				type="hidden" value=<%=id%> name="newsId">
			<textarea rows="5" cols="100" name="content"
				style="text-align: left;cursor: auto;"></textarea>
			<br>
			<br> <input type="submit" value="留言">
		</form>
	</div>

	<%
		} else {
	%>
	游客您好,请
	<a href="user/longin.jsp">登录</a>后再来留言.
	<%
		}
	%>
	<p>
	<hr color="green">
	</p>
	<%
		ContentsList mlist = (ContentsList) session
				.getAttribute("messageList");
		int totalMessage = mlist.getTotalnum();
		List<Contents> messages = mlist.getList();
	%>
	<div>
		<%
			for (int i = 0; i < messages.size(); i++) {
		%>
		<div style="color: blue;">
			<%
				if ((i + 1)== 1) {

						out.print("沙发");
					} else if ((i + 1)== 2) {
						out.print("椅子");
					} else if ((i + 1) ==3) {
						out.print("地板");
					}
			%>
		</div>
		<br>
		<br> <b><%=messages.get(i).getUserid()%></b>&nbsp;&nbsp;&nbsp;<%=messages.get(i).getDate()%><br>
		<br>
		<br>
		<%=messages.get(i).getContent()%><br>
		<br>
		<br>
		<div style="float: right;">
			#<%=i + 1%>楼，共<%=mlist.getTotalnum()%></div>
		<hr color="blue">
		<%
			}
		%>
	</div>

	<br>
	<br>
	<br>

	<center>
		<a href="#top">回顶部</a>
	</center>

	<br>
	<br>
	<br>
</body>
</html>
