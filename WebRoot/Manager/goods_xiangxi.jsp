<%@ page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="com.xy.JDBConnection" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../CSS/style.css">
<title>Goods_xiangxi page</title>
</head>
<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql;
	String userName;
	int num;%>
<%
	conn = connection.getConnection();
	stmt = conn.createStatement();
	sql = "select * from tb_GoodsMeg where ID="
			+ request.getParameter("id");
%>

<body bgcolor="#ffffff">
	<jsp:include page="mtop.jsp" />
	<table width="785" height="377" border="1" align="center"
		cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
		bordercolorlight="#FFFFFF" bordercolordark="#333333">
		<tr>
			<td height="52" colspan="4" align="center">������ϸ��Ϣ</td>
		</tr>
		<%
			try {
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					num = rs.getInt("ID");
		%>
		<tr>
			<td width="21%" height="29" align="center">�������ͣ�</td>
			<td width="31%" height="29" align="center"><%=rs.getString("GoodsStyle")%></td>
			<td width="21%" height="29" align="center">�������ƣ�</td>
			<td width="27%" height="29" align="center"><%=rs.getString("GoodsName")%></td>
		</tr>
		<tr>
			<td width="21%" height="29" align="center">����������</td>
			<td width="31%" height="29" align="center"><%=rs.getString("GoodsNumber")%>
			</td>
			<td width="21%" height="29" align="center">������λ��</td>
			<td width="27%" height="29" align="center"><%=rs.getString("GoodsUnit")%></td>
		</tr>
		<tr>
			<td width="21%" height="29" align="center">��ʼʡ�ݣ�</td>
			<td width="31%" height="29" align="center"><%=rs.getString("StartProvince")%></td>
			<td width="21%" height="29" align="center">��ʼ���У�</td>
			<td width="27%" height="29" align="center"><%=rs.getString("StartCity")%></td>
		</tr>
		<tr>
			<td width="21%" height="29" align="center">�ִ�ʡ�ݣ�</td>
			<td width="31%" height="29" align="center"><%=rs.getString("EndProvince")%></td>
			<td width="21%" height="29" align="center">�ִ���У�</td>
			<td width="27%" height="29" align="center"><%=rs.getString("EndCity")%></td>
		</tr>
		<tr>
			<td width="21%" height="30" align="center">�������ͣ�</td>
			<td width="31%" height="30" align="center"><%=rs.getString("Style")%></td>
			<td width="21%" height="30" align="center">����ʱ�䣺</td>
			<td width="27%" height="30" align="center"><%=rs.getString("TransportTime")%></td>
		</tr>
		<tr>
			<td width="21%" height="29" align="center">��ϵ�绰��</td>
			<td width="31%" height="29" align="center"><%=rs.getString("Phone")%></td>
			<td width="21%" height="29" align="center">��ϵ�ˣ�</td>
			<td width="27%" height="29" align="center"><%=rs.getString("Link")%>
			</td>
		</tr>
		<tr>
			<td width="21%" height="31" align="center">����ʱ�䣺</td>
			<td height="31" colspan="3"><%=rs.getDate("IssueDate")%></td>
		</tr>
		<tr>
			<td width="21%" height="52" align="center">��ע��</td>
			<td height="52" align="center" colspan="3">
				<p align="left"><%=rs.getString("Remark")%>
			</td>
		</tr>
		<tr>
			<td width="21%" height="52" align="center">����Ҫ��</td>
			<td height="52" align="center" colspan="3">
				<p align="left"><%=rs.getString("Request")%>
			</td>
		</tr>
		<tr>
			<%
				userName = rs.getString("UserName");
			%>
			<td width="21%" height="31" align="center">�����ˣ�</td>
			<td height="31" colspan="3" align="left"><%=userName%></td>
		</tr>
		<tr>
			<td height="33" colspan="4" align="center"><a
				href="goods_change.jsp?id=<%=num%>">�޸�</a>&nbsp;&nbsp; <a
				href="goods_delete.jsp?id=<%=num%>">ɾ��</a></td>
		</tr>

		<%
			}

			} catch (SQLException e) {
				System.out.println("��ѯ�쳣����");
			}
		%>
	</table><jsp:include page="/down.jsp" />
</body>
</html>