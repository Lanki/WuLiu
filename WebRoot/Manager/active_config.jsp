<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.Date"%>
<jsp:directive.page import="com.xy.CountTime"/>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<title>placard_show_config page</title>
</head>
<%!
	Connection conn;
	PreparedStatement ps;
	String sql;
	Date date = new Date();%>
<body bgcolor="#ffffff">
	<%
		request.setCharacterEncoding("gb2312");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String author = request.getParameter("author");
		CountTime datatime = new CountTime();
		sql = "insert into tb_logistics (Title,Content,Author,IssueDate)values(?,?,?,?)";
		conn = connection.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, title);
		ps.setString(2, content);
		ps.setString(3, author);
		ps.setString(4, datatime.currentlyTime());
		int bb = ps.executeUpdate();
		if (bb > 0) {
	%>
	<script language="javascript">
		alert("您输入的动态信息已经存储完成！！！");
	</script>
	<%
		response.sendRedirect("active_select.jsp");
		} else {
	%>
	<script language="javascript">
		alert("您输入的动态信息存储失败！！！");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>