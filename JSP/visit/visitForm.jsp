<%@page import="visit.nurseDO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<jsp:useBean id="ndao" class="visit.nurseDAO" />
<%
int num = Integer.parseInt(request.getParameter("num"));
nurseDO abean = ndao.getNurseOne(num);
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
	<p class="fs-1 fw-bold text-center font-monospace">면회 예약</p>
</div>
<hr style="margin: 10px 300px 50px 300px">
<div class="container border form_container"
	style="padding: 20px; width: 600px">
	<form action="visitProc.jsp" method="post" name="frm">
		<div class="mb-1">
			<label class="form-label">이름</label> <input type="text"
				class="form-control" name="name" autocomplete="off">
		</div>
		<div class="mb-1">
			<label class="form-label">전화번호</label> <input type="text"
				class="form-control" name="tel" autocomplete="off">
		</div>
		<div class="mb-1">
			<label class="form-label">시설이름</label> <input type="text"
				class="form-control" name="fname" value="<%=abean.getFname()%>"
				readonly="readonly">
		</div>
		<div class="row g-3">
			<div class="col">
				<label class="form-label">예약날짜</label> <input type="date"
					class="form-control" name="date">
			</div>
			<div class="col">
				<label class="form-label">예약시간</label> <input type="time"
					class="form-control" name="time">
			</div>
		</div>
		<div class="mb-1">
			<label class="form-label">관계</label> <select class="form-select"
				aria-label="Default select example" name="relat">
				<option selected value="가족">가족</option>
				<option value="자녀">자녀</option>
				<option value="지인">지인</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<div style="padding-top: 20px">
			<button type="button" class="btn btn-outline-success"
				onclick="check()">확인</button>
			<button type="reset" class="btn btn-outline-danger"
				onclick="location.href='visitSearch.jsp'">취소</button>
		</div>
	</form>
</div>
<script type="text/javascript">
function check() {
	if (frm.name.value == "" || frm.tel.value == ""
			|| frm.date.value == "" || frm.time.value == "") {
		alert("모든 정보를 입력해주세요.")
	} else {
		frm.submit();
	}
}
</script>
</body>
</html>