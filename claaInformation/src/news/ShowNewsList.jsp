/*14130140361 xinxin 
*/
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.classInfo.Entity.News"%>
<%@page import="com.classInfo.Entity.NewsList"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>消息列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
div {
	padding-top: 20px;
}
</style>
<script type="text/javascript">
	function onload() {

	};
</script>
</head>


<body>
	<table align="center" width="80%" border="1" bordercolor="green"
		cellpadding="5dp" cellspacing="0dp">
		<tr>
			<th>信息编号</th>
			<th>发布人学号</th>
			<th>标题</th>
			<th>信息摘要</th>
			<th>发布日期</th>
		</tr>
		<c:forEach items="${newsList.list}" var="news">
			<tr>
				<td>${news.id }</td>
				<td>${news.userId}</td>
				<td>${news.title }</td>
				<td><a href="../../InformationWeb/servlet/ShowContentServlet?id=${news.id }">${news.description}</a>
				</td>
				<td>${news.date }</td>
			</tr>
		</c:forEach>
	</table>
	<div align="CENTER">
		<div align="CENTER">
			&nbsp;&nbsp;第${newsList.pageNum }页,共${newsList.totlaPageNum }页
			&nbsp;&nbsp; <a
				href="../../InformationWeb/servlet/ObtainNewsServlet?pageNum=${newsList.pageNum-1 }&type=1&numPerPage=5">上一页</a>
			<a
				href="../../InformationWeb/servlet/ObtainNewsServlet?pageNum=${newsList.pageNum+1 }&type=1&numPerPage=5">下一页</a>
			&nbsp;

		</div>
	</div>

</body>
</html>
