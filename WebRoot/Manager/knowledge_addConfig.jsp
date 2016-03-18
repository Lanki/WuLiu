<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=GB2312" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<jsp:directive.page import="com.xy.CountTime"/>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection"/>
<html>
<head>
<title>
placard_show_config page
</title>
</head>
<%!
Connection conn;
PreparedStatement ps;
String sql;
Date date=new Date();
CountTime time = new CountTime();
%>
<body bgcolor="#ffffff">
<%
request.setCharacterEncoding("gb2312");
String title=request.getParameter("Title");
String content=request.getParameter("content");
String style=request.getParameter("style");
String datetime = time.currentlyTime();
sql="insert into tb_Knowledge (Title,Content,IssueDate,Reside) values (?,?,?,?)";
conn = connection.getConnection();
ps = conn.prepareStatement(sql);
ps.setString(1, title);
ps.setString(2, content);
ps.setString(3, datetime);
ps.setString(4, style);
int bb=ps.executeUpdate();
if(bb > 0)
{%>
<script language="javascript">
alert("您输入的物流知识已经发布成功！！！");
window.location.href="knowledge_select.jsp";
</script>
<%
}else
{
%>
<script language="javascript">
alert("您输入的物流知识插入失败！！！");
history.back();
</script>
<%
}
%>
</body>
</html>
