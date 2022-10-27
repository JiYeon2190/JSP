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
}
</style>
<title>visiting appointment</title>
</head>
<body>
<hr style="height: 2px;">
<div class="p-3">
	<nav class="nav nav-pills nav-justified">
		<div style="width: 350px; padding-left: 30px; color: #006400;">
			<h3 class="fw-bold font-monospace">visiting appointment</h3>
		</div>
		<div class="vr" style="margin-left: 40px;"></div>
		<a class="nav-link" href="visitMain.jsp" style="color: #006400;">메인</a>
		<a class="nav-link" href="visitSearch.jsp" style="color: grey;">면회 예약</a> 
		<a class="nav-link" href="visitList.jsp" style="color: grey;">예약 정보</a> 
		<a class="nav-link" href="visitInfo.jsp" style="color: grey;">이용안내</a>
	</nav>
</div>
<hr style="height: 2px;">
<div style="height: 250px; margin-top: 160px;">
	<p class="fs-1 fw-bold text-center font-monospace">요양시설 면회 예약 서비스</p>
	<p class="fs-6 fw-light text-center">간편한 절차로 요양시설의 면회를 예약하세요.</p>
	<p class="fs-6 fw-light text-center">면회를 예약할 요양시설을 검색하세요.</p>
</div>

<div class="container-fluid" style="padding: 0 400px 30px 400px;">
	<form action="visitSearch.jsp" method="post" class="d-flex"
		style="height: 50px;">
		<select name="sf" class="form-select me-2" style="width: 150px;">
			<option selected>선택</option>
			<option value="fname"
				<c:if test="${param.sf == 'fname'}">selected</c:if>>시설이름</option>
			<option value="area"
				<c:if test="${param.sf == 'area'}">selected</c:if>>지역</option>
		</select> <input name="st" class="form-control me-2" type="text" value="${param.st}"
			placeholder="요양시설 검색하기" autocomplete="off">
		<button class="btn btn-outline-success" type="submit"
			style="width: 60px">
			<i class="bi bi-search"></i>
		</button>
	</form>
</div>
</body>
</html>