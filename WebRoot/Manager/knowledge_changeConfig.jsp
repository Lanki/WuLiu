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
<%!Connection conn;
	Statement stmt;
	String sql;
	Date date = new Date();%>
<body bgcolor="#ffffff">
	<%
		CountTime time = new CountTime();
		request.setCharacterEncoding("gb2312");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String style = request.getParameter("style");
		String datetime = time.currentlyTime();
		sql = "update tb_Knowledge set Title='" + title + "',Content='"
				+ content + "',IssueDate='" + datetime + "',Reside='"
				+ style + "'where ID=" + request.getParameter("id");
		conn = connection.getConnection();
		stmt = conn.createStatement();
		int bb = stmt.executeUpdate(sql);
		if (bb > 0) {
	%>
	<script language="javascript">
		alert("�����������֪ʶ�Ѿ������ɹ�������");
	</script>
	<%
		response.sendRedirect("knowledge_select.jsp");
		} else {
	%>
	<script language="javascript">
		alert("�����������֪ʶ�洢ʧ�ܣ�����");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>
