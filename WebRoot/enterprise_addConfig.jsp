<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
</head>
<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql, wsql;
	Date date = new Date();%>
<%
	request.setCharacterEncoding("gb2312");
	String ename = request.getParameter("name");
	String style = request.getParameter("style");
	String operation = request.getParameter("operation");
	String area = request.getParameter("area");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String linkman = request.getParameter("linkman");
	String email = request.getParameter("email");
	String web = request.getParameter("web");
	String intr = request.getParameter("intr");
	String fax = request.getParameter("fax");
	String hand = request.getParameter("hand");
	java.sql.Date showdate = new java.sql.Date(date.getYear(),
			date.getMonth(), date.getDate());
	String username = (String) session.getAttribute("name");
	conn = connection.getConnection();
	stmt = conn.createStatement();
	sql = "select EnterpriseSort,EnterpriseName from tb_Enterprise where EnterpriseSort='"
			+ style + "'and EnterpriseName='" + ename + "'";
	try {
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
%>
<script language="javascript">
	alert("此企业信息已经发布！！");
	history.back();
</script>
<%
	} else {
			wsql = "insert into tb_Enterprise values(null,'" + style
					+ "','" + ename + "','" + operation + "','" + area
					+ "','" + address + "','" + phone + "','" + linkman
					+ "','" + hand + "','" + fax + "','" + email
					+ "','" + web + "','" + intr + "','" + showdate
					+ "','" + username + "')";
			int dd = stmt.executeUpdate(sql);
			if (dd > 0) {
%>
<script language="javascript">
	alert("企业信息发布成功！！");
</script>
<%
	response.sendRedirect("enterprise_select.jsp");
			}
		}
	} catch (Exception e) {
		out.print("查询异常！1");
	}
%>
<body>

</body>
</html>
