/*14130140361 xixnin
*/
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>发布通知</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<%
		String userId = (String) session.getAttribute("currentstu_num");

		if (userId == null) {
			response.sendRedirect("../error.jsp");
		} else {
	%>
	<center>
		<form action="../../InformationWeb/servlet/PublishNewsServlet" method="post">
			<br>
			<br> 标题:<input type="text" name="title"><br>
			<br> 内容:<br>
			<br>
			<textarea rows="12" cols="100" name="content"
				style="font-family: 微软雅黑;font-size: 50sp;text-align: left;">
     				</textarea>
			<br>
			<br> <input type="submit"
				style="color: white;background-color: #03A9F4;width: 100px; height: 40px;">
		</form>

	</center>
	<%
		}
	%>
</body>
</html>
