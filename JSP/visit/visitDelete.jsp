<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>visiting appointment</title>
</head>
<body>
	<jsp:useBean id="vdao" class="visit.visitDAO" />
	<%
	int num = Integer.parseInt(request.getParameter("num"));
	vdao.deleteVisit(num);
	response.sendRedirect("visitList.jsp");
	%>
</body>
</html>