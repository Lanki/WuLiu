<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<title>Goods_delete page</title>
</head>
<body bgcolor="#ffffff">
	<%
		Connection conn = connection.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "delete tb_GoodsMeg where ID="
				+ request.getParameter("id");
		boolean dele = stmt.execute(sql);
		if (dele) {
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