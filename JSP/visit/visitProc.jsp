<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>visiting appointment</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="vdo" class="visit.visitDO" />
	<jsp:setProperty name="vdo" property="*" />
	<jsp:useBean id="vdao" class="visit.visitDAO" />
	<%
	vdao.insertVisit(vdo);
	response.sendRedirect("visitList.jsp");
	%>
</body>
</html>