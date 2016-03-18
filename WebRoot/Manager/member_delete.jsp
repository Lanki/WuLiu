<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<title>Member_delete page</title>
</head>
<%
	String code, sql;
%>
<body bgcolor="#ffffff">
	<%
		sql = "delete from tb_Customer where ID=" + request.getParameter("id");
		Connection conn = connection.getConnection();
		Statement stmt = conn.createStatement();
		int bb = stmt.executeUpdate(sql);
		if (bb > 0) {
	%>
	<script language="javascript">
		alert("修改成功！！！");
	</script>
	<%
		response.sendRedirect("member_select.jsp");
		} else {
	%>
	<script language="javascript">
		alert("修改失败！！！");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>
