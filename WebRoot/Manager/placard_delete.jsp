<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<title>placard</title>
</head>
<body bgcolor="#ffffff">
	<%
		Connection conn = connection.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "delete tb_Placard where ID="
				+ request.getParameter("id");
		boolean dele = stmt.execute(sql);
		if (dele) {
	%>
	<script language="javascript">
		alert("ɾ���ɹ�������");
	</script>
	<%
		response.sendRedirect("placard_select.jsp");
		} else {
	%>
	<script language="javascript">
		alert("ɾ��ʧ�ܣ�����");
		history.back();
	</script>
	<%
		}
	%>
</body>
</html>