<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	background-color: #AA7700;
}
</style>
</head>

<body>
	<div style="float:left">
		<img style="width: 120px; height: 130px;" src="images/1.png" />
	</div>
	<div style="float:right">当前用户:${currentstu_num }</div>
	<div style="float:center;text-align: center;">
		<br />
		<h2 align="center">班级信息发布系统</h2>
		<br /> <a href="user/regist.jsp" target="blank">添加用户</a> | <a
			href="/InformationWeb/user/SercherUser.jsp" target="content">查询用户</a> | <a
			href="../../InformationWeb/servlet/ObtainNewsServlet?pageNum=1&type=1&numPerPage=5"
			target="content">浏览通知</a> | <a href="news/publishNews.jsp"
			target="content">发布通知</a>
	</div>
</body>
</html>
