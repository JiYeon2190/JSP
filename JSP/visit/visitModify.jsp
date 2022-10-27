<%@page import="java.util.zip.CheckedInputStream"%>
<%@page import="visit.visitDO"%>
<%@page import="java.util.Arrays"%>
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
<jsp:useBean id="vdao" class="visit.visitDAO" />
<%
int num = Integer.parseInt(request.getParameter("num"));
visitDO abean = vdao.getVisitOne(num);

String[] selRelat = {"가족", "자녀", "지인", "기타"};
Boolean[] selected = new Boolean[4];
Arrays.fill(selected, false);

for (int i=0; i<selRelat.length; i++) {
	if (abean.getRelat().indexOf(selRelat[i]) != -1) {
		selected[i] = true;
	}
}
%>
<hr style="height: 2px;">
<div class="p-3">
	<nav class="nav nav-pills nav-justified">
		<div style="width: 350px; padding-left: 30px; color: #006400;">
			<h3 class="fw-bold font-monospace">visiting appointment</h3>
		</div>
		<div class="vr" style="margin-left: 40px;"></div>
		<a class="nav-link" href="visitMain.jsp" style="color: grey;">메인</a>
		<a class="nav-link" href="visitSearch.jsp" style="color: grey;">면회 예약</a> 
		<a class="nav-link" href="visitList.jsp" style="color: #006400;">예약 정보</a> 
		<a class="nav-link" href="visitInfo.jsp" style="color: grey;">이용안내</a>
	</nav>
</div>
<hr style="height: 2px;">
<div style="height: 90px; margin-top: 50px;">
	<p class="fs-1 fw-bold text-center font-monospace">정보 수정</p>
</div>
<hr style="margin: 10px 300px 50px 300px">

<div class="container border form_container"
	style="padding: 20px; width: 600px">
	<form action="visitModifyProc.jsp" method="post">
		<div class="mb-1">
			<label class="form-label">이름</label> <input type="text"
				class="form-control" name="name" value="<%=abean.getName()%>"
				autocomplete="off">
		</div>
		<div class="mb-1">
			<label class="form-label">전화번호</label> <input type="text"
				class="form-control" name="tel" value="<%=abean.getTel()%>"
				autocomplete="off">
		</div>
		<div class="mb-1">
			<label class="form-label">시설이름</label> <input type="text"
				class="form-control" name="fname" value="<%=abean.getFname()%>"
				readonly="readonly">
		</div>
		<div class="row g-3">
			<div class="col">
				<label class="form-label">예약날짜</label> <input type="date"
					class="form-control" name="date" value="<%=abean.getDate()%>">
			</div>
			<div class="col">
				<label class="form-label">예약시간</label> <input type="time"
					class="form-control" name="time" value="<%=abean.getTime()%>">
			</div>
		</div>
		<div class="mb-1">
			<label class="form-label">관계</label> 
			<select class="form-select"
				aria-label="Default select example" name="relat">
				<option value="가족" <%= selected[0] ? "selected":"" %>>가족</option>
				<option value="자녀" <%= selected[1] ? "selected":"" %>>자녀</option>
				<option value="지인" <%= selected[2] ? "selected":"" %>>지인</option>
				<option value="기타" <%= selected[3] ? "selected":"" %>>기타</option>
			</select>
		</div>
		<div style="padding-top: 20px">
			<input type="hidden" value="<%=abean.getNum()%>" name="num">
			<button type="submit" class="btn btn-outline-success">수정</button>
			<button type="button" class="btn btn-outline-danger"
				onclick="location.href='visitList.jsp'">돌아가기</button>
		</div>
	</form>
</div>
</body>
</html>