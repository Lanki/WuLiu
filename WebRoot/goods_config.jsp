<%@ page contentType="text/html; charset=GBK"
	import="java.sql.*,java.util.Date"%>
<jsp:directive.page import="com.xy.CountTime" />
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<title>Good_config page</title>
</head>
<%!
	Date date = new Date();
	String sql;
	Connection conn = null;
	PreparedStatement ps = null;
	Statement stmt = null;
	ResultSet rs;%>
<%
	request.setCharacterEncoding("gb2312");
	String gname = request.getParameter("gname");
	String gclass = request.getParameter("gclass");
	String gcount = request.getParameter("gcount");
	String gunit = request.getParameter("gunit");
	String startProvince = request.getParameter("startProvince");
	String gstartcity = request.getParameter("gstartcity");
	String endProvince = request.getParameter("endProvince");
	String gendcity = request.getParameter("gendcity");
	String gtransstyle = request.getParameter("gtransstyle");
	String gtime = request.getParameter("gtime");
	String glink = request.getParameter("glink");
	String gphone = request.getParameter("gphone");
	String gremark = request.getParameter("gremark");
	String grequest = request.getParameter("grequest");
	String username = (String) session.getAttribute("name");
	CountTime time = new CountTime();
	
	sql = "insert into tb_GoodsMeg (GoodsName,GoodsStyle,GoodsNumber,GoodsUnit,StartProvince,StartCity,EndProvince,EndCity,Style,TransportTime,Link,Phone,IssueDate,Remark,Request,UserName)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	conn = connection.getConnection();
	ps = conn.prepareStatement(sql);
	ps.setString(1, gname);
	ps.setString(2, gclass);
	ps.setString(3, gcount);
	ps.setString(4, gunit);
	ps.setString(5, startProvince);
	ps.setString(6, gstartcity);
	ps.setString(7, endProvince);
	ps.setString(8, gendcity);
	ps.setString(9, gtransstyle);
	ps.setString(10, gtime);
	ps.setString(11, glink);
	ps.setString(12, gphone);
	ps.setString(13, time.currentlyTime());
	ps.setString(14, gremark);
	ps.setString(15, grequest);
	ps.setString(16, username);
	int sert = ps.executeUpdate();
	if (sert > 0) {
%>
<script language="javascript">
	alert("您输入的货物信息已经成功完成！！！");
</script>
<%
	response.sendRedirect("goods_select.jsp");
	} else {
%>
<script language="javascript">
	alert("您输入的货物信息发布失败！！！");
</script>
<%
	response.sendRedirect("goods_add.jsp");
	}
%>
<body bgcolor="#ffffff">
</body>
</html>