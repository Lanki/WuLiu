<%@page import="com.xy.JDBConnection"%>
<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<title>login_config</title>
</head>
<%
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	request.setCharacterEncoding("gb2312");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	if (name == "" && name == null && password == ""
			&& password == null) {
%>
<jsp:forward page="index.jsp" />
<%
	} else {
		try {
			conn = JDBConnection.getConnection();
			stmt = conn.createStatement();
			String sql = "select * from tb_Customer where Name='"
					+ name + "' and Password='" + password + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String Name = rs.getString("Name");
				String pow = rs.getString("pow");
				session.setAttribute("name", Name);
				session.setAttribute("pow", pow);
				session.setAttribute("login", "success");
%>
<script language="javascript">
	alert("��¼�ɹ�������");
	window.location.href = "index.jsp";
</script>
<%
	} else {
%>
<script language="javascript">
	alert("��¼ʧ�ܣ�����");
	history.back();
</script>
<%
	}
		} catch (Exception e) {
			System.out.println("�����쳣login_config");
		}
	}
%>
<body bgcolor="#ffffff">
</body>
</html>