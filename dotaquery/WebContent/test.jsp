<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<div id="main_block">
		<form>
		<table border='1' width='300' cellpadding='1' cellspacing='0'>
			<tr>
				<td colspan=4 align="center"></td>
			</tr>
			<tr>
				<td>Id</td>
				<td>Name</td>
				<td>Type</td>
				<%
				String name = request.getParameter("name");
				System.out.println("test login"); %>
			
			</tr>
			<tr>
				<td><%=name %></td>
				<td><%=name %></td>
				<td><%=name %></td>
				
			
			</tr>

			
		</table>
		</form>
	</div>
</body>
</html>