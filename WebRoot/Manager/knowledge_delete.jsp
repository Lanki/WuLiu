<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=GB2312"%>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<title>knowledge</title>
</head>
<body bgcolor="#ffffff">
	<%
		Connection conn = connection.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "delete from tb_Knowledge where ID="
				+ request.getParameter("id");
		int dele = stmt.executeUpdate(sql);
		if (dele > 0) {
	%>
	<script language="javascript">
		alert("É¾³ý³É¹¦£¡£¡£¡");
	</script>
	<%
		response.sendRedirect("knowledge_select.jsp");
		} else {
	%>
	<script language="javascript">
		alert("É¾³ýÊ§°Ü£¡£¡£¡");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>
