<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=GB2312"%>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<title>Goods_delete page</title>
</head>
<body bgcolor="#ffffff">
	<%
		Connection conn = connection.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "delete from tb_GoodsMeg where ID="
				+ request.getParameter("id");
		int dele = stmt.executeUpdate(sql);
		if (dele > 0) {
	%>
	<script language="javascript">
		alert("É¾³ý³É¹¦£¡£¡£¡");
	</script>
	<%
		response.sendRedirect("goods_select.jsp");
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