<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=GB2312" import="java.util.Date"%><%@page import="java.sql.Connection"%><%@page import="java.sql.Statement"%>
<jsp:directive.page import="com.xy.CountTime" />

<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
	<head>
		<title>CarMessageadd_config page</title>
	</head>
	<%!
	Connection conn;
	PreparedStatement ps;
	Date date = new Date();
	String sql;%>
	<%
		request.setCharacterEncoding("gb2312");

		String numbers = request.getParameter("numbers");
		String types = request.getParameter("type");
		String carname = request.getParameter("carname");
		String usetime = request.getParameter("usetime");
		String loads = request.getParameter("loads");
		String transtyle = request.getParameter("style");
		String drivername = request.getParameter("name");
		String number = request.getParameter("number");
		String styles = request.getParameter("styles");
		String drivertime = request.getParameter("time");
		String meg = request.getParameter("meg");
		String linkman = request.getParameter("linkman");
		String phone = request.getParameter("phone");
		//String gremark = request.getParameter("gremark");
		String username = (String) session.getAttribute("name");
		
		CountTime time = new CountTime();

		sql = "insert into tb_CarMessage (TradeMark,Brand,Style,CarLoad,UsedTime,DriverName,DriverTime,LicenceNumber,LicenceStyle,TransportStyle,LinkMan,LinkPhone,Remark,IssueDate,UserName) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		conn = connection.getConnection();
		ps = conn.prepareStatement(sql);
		ps.setString(1, numbers);
		ps.setString(2, carname);
		ps.setString(3, types);
		ps.setString(4, loads);
		ps.setString(5, usetime);
		ps.setString(6, drivername);
		ps.setString(7, drivertime);
		ps.setString(8, number);
		ps.setString(9, styles);
		ps.setString(10, transtyle);
		ps.setString(11, linkman);
		ps.setString(12, phone);
		ps.setString(13, meg);
		ps.setString(14, time.currentlyTime());
		ps.setString(15, username);
		
		int sert = ps.executeUpdate();
		if (sert > 0 ) {
	%>
	<script language="javascript">
		alert("您输入的车辆信息已经成功完成！！！");
	</script>
	<%
		} else {
	%>
	<script language="javascript">
alert("您输入的车辆信息插入失败！！！");
</script>
	<%
		}
		response.sendRedirect("car_select.jsp");
	%>
	<body bgcolor="#ffffff">
	</body>
</html>
