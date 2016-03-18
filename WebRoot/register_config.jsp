<%@page import="com.xy.JDBConnection"%>
<%@ page contentType="text/html; charset=GBK" language="java"%>
<%@ page import="java.util.Date,java.sql.*"%>
<jsp:directive.page import="com.xy.CountTime" />
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<title>regist_config</title>
</head>
<%
	request.setCharacterEncoding("gb2312");
	Connection conn = JDBConnection.getConnection();
	Statement stmt = conn.createStatement();
	PreparedStatement pstmt = null;
%>
<body bgcolor="#ffffff">
	<%
		ResultSet rs = null;
		Date date = new Date();
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String result = request.getParameter("result");
		String question = request.getParameter("question");
		CountTime time = new CountTime();
		String str = "select Name from tb_customer where Name='" + name
			+ "'";
		rs = stmt.executeQuery(str);
		if (rs.next()) {
		
	%>
	<script language="javascript">
		alert("此用户已经被占用请重新注册");
		history.back();
	</script>
	<%
		} else {
			String sql = "insert into tb_Customer(Name,Password,Email,Sex,Phone,Question,Result,IssueDate,pow) values (?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setString(4, sex);
			pstmt.setString(5, phone);
			pstmt.setString(6, question);
			pstmt.setString(7, result);
			pstmt.setString(8, time.currentlyTime());
			pstmt.setString(9, "1");
			int sert = pstmt.executeUpdate();
			if (sert > 0) {
	%>
	<script language="javascript">
		alert("注册成功");
		window.location.href = "index.jsp";
	</script>
	<%
		} else {
	%>
	<script language="javascript">
		alert("注册失败！！");
		history.back();
	</script>
	<%
		}
		}
	%>
</body>
</html>