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
		sql = "insert tb_logistics values('" + title + "','" + content
				+ "','" + author + "','" + datatime + "')";
		conn = connection.getConnection();
		stmt = conn.createStatement();
		boolean bb = stmt.execute(sql);
		if (bb) {
	%>
	<script language="javascript">
		alert("������Ķ�̬��Ϣ�Ѿ��洢��ɣ�����");
	</script>
	<%
		response.sendRedirect("active_select.jsp");
		} else {
	%>
	<script language="javascript">
		alert("������Ķ�̬��Ϣ�洢ʧ�ܣ�����");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>