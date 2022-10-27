<%@page import="visit.nurseDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="visit.nurseDO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">
body {
	background: #FCFFFF;
	padding-bottom: 50px;
}
</style>
<title>visiting appointment</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="ndo" class="visit.nurseDO">
	<jsp:setProperty name="ndo" property="*" />
</jsp:useBean>
<jsp:useBean id="ndao" class="visit.nurseDAO" />
<%
ArrayList<nurseDO> aList = ndao.getAllNurse();
String sf = request.getParameter("sf");
String st = request.getParameter("st");
ArrayList<nurseDO> sList = ndao.searchNurse(sf, st);
%>
<hr style="height: 2px;">
<div class="p-3">
	<nav class="nav nav-pills nav-justified">
		<div style="width: 350px; padding-left: 30px; color: #006400;">
			<h3 class="fw-bold font-monospace">visiting appointment</h3>
		</div>
		<div class="vr" style="margin-left: 40px;"></div>
		<a class="nav-link" href="visitMain.jsp" style="color: grey;">메인</a>
		<a class="nav-link" href="visitSearch.jsp" style="color: #006400;">면회 예약</a> 
		<a class="nav-link" href="visitList.jsp" style="color: grey;">예약 정보</a> 
		<a class="nav-link" href="visitInfo.jsp" style="color: grey;">이용안내</a>
	</nav>
</div>
<hr style="height: 2px;">
<div style="height: 90px; margin-top: 50px;">
	<p class="fs-1 fw-bold text-center font-monospace">요양시설</p>
</div>
<hr style="margin: 10px 300px 30px 300px">
<div class="container-fluid" style="padding: 0 350px 30px 350px;">
	<form action="visitSearch.jsp" method="post" class="d-flex"
		style="height: 50px;">
		<select name="sf" class="form-select me-2" style="width: 150px;">
			<option selected>선택</option>
			<option value="fname"
				<c:if test="${param.sf == 'fname'}">selected</c:if>>시설이름</option>
			<option value="area"
				<c:if test="${param.sf == 'area'}">selected</c:if>>지역</option>
		</select> <input name="st" class="form-control me-2" type="text"
			value="${param.st}" placeholder="요양시설 검색하기" autocomplete="off">
		<button class="btn btn-outline-success" type="submit"
			style="width: 60px">
			<i class="bi bi-search"></i>
		</button>
	</form>
</div>
<c:choose>
	<c:when test="${param.sf == 'fname' || param.sf == 'area'}">
		<%
		for (int i = 0; i < sList.size(); i++) {
			nurseDO abean = sList.get(i);
		%>
		<div class="container border border-5"
			style="width: 800px; padding: 10px;">
			<div class="row">
				<div class="col">
					<img src="<%=abean.getImg()%>" class="card-img-top rounded">
				</div>
				<div class="col-md-auto" style="margin-top: 50px;">
					<h5 class="card-title"><%=abean.getFname()%></h5>
					<p class="card-text">
						<%=abean.getArea()%>
						<br />
						<%=abean.getTel()%>
					</p>
				</div>
				<div class="col-md-auto" style="margin-top: 220px;">
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='visitForm.jsp?num=<%=abean.getNum()%>'">
						선택</button>
				</div>
			</div>
		</div>
		<br />
		<%
		}
		%>
	</c:when>
	<c:otherwise>
		<%
		for (int i = 0; i < aList.size(); i++) {
			nurseDO abean = aList.get(i);
		%>
		<div class="container border border-5 rounded"
			style="width: 800px; padding: 10px;">
			<div class="row">
				<div class="col">
					<img src="<%=abean.getImg()%>" class="card-img-top rounded">
				</div>
				<div class="col-md-auto" style="margin-top: 50px;">
					<h5 class="card-title"><%=abean.getFname()%></h5>
					<p class="card-text">
						<%=abean.getArea()%>
						<br />
						<%=abean.getTel()%>
					</p>
				</div>
				<div class="col-md-auto" style="margin-top: 220px;">
					<button type="button" class="btn btn-outline-success"
						onclick="location.href='visitForm.jsp?num=<%=abean.getNum()%>'">
						선택</button>
				</div>
			</div>
		</div>
		<br />
		<%
		}
		%>
	</c:otherwise>
</c:choose>
</body>
</html>