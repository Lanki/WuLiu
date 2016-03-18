<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=GB2312"%>
<%@ page import="java.util.Date"%>
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
		String author = (String) session.getAttribute("username");

		java.sql.Date datatime = new java.sql.Date(date.getYear(),
				date.getMonth(), date.getDate());
	
		conn = connection.getConnection();
		sql ="insert into tb_placard (Title,Content,Author,IssueDate) values (?,?,?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1, title);
		ps.setString(2, content);
		ps.setString(3, author);
		ps.setString(4, datatime.toString());
		int bb = ps.executeUpdate();

		if (bb > 0) {
	%>
	<script language="javascript">
		alert("您输入的公告信息已经成功完成！！！");
	</script>
	<%
		response.sendRedirect("placard_select.jsp");
		} else {
	%>
	<script language="javascript">
		alert("您输入的公告信息插入失败！！！");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>