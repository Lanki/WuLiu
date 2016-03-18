<%@ page contentType="text/html; charset=GBK"%><%@page import="java.sql.Connection"%><%@page import="java.sql.Statement"%>


<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
	<head>
		<title>CarMessage_delete page</title>
	</head>
	<body bgcolor="#ffffff">
		<%
			Connection conn = connection.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "delete from tb_CarMessage where Code="
					+ request.getParameter("id");
			int bb = stmt.executeUpdate(sql);
			if (bb > 0) {
		%>
		<script language="javascript">
alert("车辆信息已经删除");
</script>
		<%
			response.sendRedirect("car_select.jsp");
			} else {
		%>
		<script language="javascript">
alert("车辆信息删除失败!!!");
history.back();
</script>
		<%
			}
		%>
	</body>
</html>
