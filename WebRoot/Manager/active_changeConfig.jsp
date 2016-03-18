<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=gb2312"%>
<%@ page import="java.util.Date"%>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>placard_show_config page</title>
</head>
<%!
	Connection conn;
	Statement stmt;
	String sql;
	Date date = new Date();%>
<body bgcolor="#ffffff">
	<%
		request.setCharacterEncoding("gb2312");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		java.sql.Date datatime = new java.sql.Date(date.getYear(),
				date.getMonth(), date.getDate());
				
		conn = connection.getConnection();
		stmt = conn.createStatement();
		sql = "update tb_logistics set Title='" + title + "',Content='"
				+ content + "',Author='" + author + "',IssueDate='"
				+ datatime + "' where ID=" + request.getParameter("id");;
		int bb = stmt.executeUpdate(sql);
		if (bb > 0) {
	%>
	<script language="javascript">
		window.location.href = "active_select.jsp";
	</script>
	<%
		} else {
	%>
	<script language="javascript">
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>