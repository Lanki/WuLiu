<%@ page contentType="text/html; charset=GB2312" language="java"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>enterprise</title>
</head>
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
		String sql = "delete from tb_Enterprise where ID="
				+ request.getParameter("id");
		boolean dele = stmt.execute(sql);
		if (dele) {
	%>
	<script language="javascript">
		alert("ɾ���ɹ�������");
	</script>
	<%
		response.sendRedirect("enterprise_select.jsp");
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