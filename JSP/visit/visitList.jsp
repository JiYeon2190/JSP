<%@page import="java.util.function.Function"%>
<%@page import="visit.nurseDO"%>
<%@page import="javax.naming.ldap.SortControl"%>
<%@page import="visit.visitDO"%>
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
}
</style>
<title>visiting appointment</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="vdo" class="visit.visitDO">
	<jsp:setProperty name="vdo" property="*" />
</jsp:useBean>
<jsp:useBean id="vdao" class="visit.visitDAO" />
<%
ArrayList<visitDO> aList = vdao.getAllVisit();
ArrayList<visitDO> nList = vdao.sortNumVisit();
ArrayList<visitDO> mList = vdao.sortNameVisit();
ArrayList<visitDO> dList = vdao.sortDateVisit();
String sf = request.getParameter("sf");
String st = request.getParameter("st");
ArrayList<visitDO> sList = vdao.searchVisit(sf, st);
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
	<p class="fs-1 fw-bold text-center font-monospace">예약 정보</p>
</div>
<hr style="margin: 10px 300px 30px 300px">
<div class="container" style="width: 1220px; padding-bottom: 50px;">
	<div style="float: left;">
		<form class="d-flex" action="visitList.jsp" method="post" style="">
			<select name="sel" class="form-select me-2" style="width: 150px;">
				<option selected>오래된순</option>
				<option value="a" <c:if test="${param.sel == 'a'}">selected</c:if>>최신순</option>
				<option value="b" <c:if test="${param.sel == 'b'}">selected</c:if>>이름순</option>
				<option value="c" <c:if test="${param.sel == 'c'}">selected</c:if>>시간순</option>
			</select>
			<button class="btn btn-outline-success" type="submit" value="선택"
				style="width: 70px;">정렬</button>
		</form>
	</div>
	<div style="float: right;">
		<form class="d-flex" action="visitList.jsp" method="post"
			style="width: 400px;">
			<select name="sf" class="form-select me-2" style="width: 150px;">
				<option selected>선택</option>
				<option value="name"
					<c:if test="${param.sf == 'name'}">selected</c:if>>예약자 이름</option>
				<option value="fname"
					<c:if test="${param.sf == 'fname'}">selected</c:if>>시설 이름</option>
			</select> <input class="form-control me-2" type="text" name="st"
				placeholder="검색" autocomplete="off" value="${param.st}">
			<button class="btn btn-outline-success" type="submit"
				style="width: 50px;">
				<i class="bi bi-search"></i>
			</button>
		</form>
	</div>
</div>
<div class="container border list_container"
	style="padding: 20px; margin-bottom: 50px; width: 1200px;">
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th scope="col">이름</th>
				<th scope="col">전화번호</th>
				<th scope="col">시설이름</th>
				<th scope="col">예약날짜</th>
				<th scope="col">예약시간</th>
				<th scope="col">관계</th>
				<th scope="col">수정/취소</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${param.sel == 'a'}">
					<%
					for (int i = 0; i < nList.size(); i++) {
						visitDO abean = nList.get(i);
					%>
					<tr align="center">
						<td><%=abean.getName()%></td>
						<td><%=abean.getTel()%></td>
						<td><%=abean.getFname()%></td>
						<td><%=abean.getDate()%></td>
						<td><%=abean.getTime()%></td>
						<td><%=abean.getRelat()%></td>
						<td>
							<button type="button" class="btn btn-outline-success"
								onclick="location.href='visitModify.jsp?num=<%=abean.getNum()%>'">
								정보 수정</button>
							<button type="button" class="btn btn-outline-danger"
								onclick="removeCheck(<%=abean.getNum()%>)">
								예약 취소</button>
						</td>
					</tr>
					<%
					}
					%>
				</c:when>
				<c:when test="${param.sel == 'b'}">
					<%
					for (int i = 0; i < mList.size(); i++) {
						visitDO abean = mList.get(i);
					%>
					<tr align="center">
						<td><%=abean.getName()%></td>
						<td><%=abean.getTel()%></td>
						<td><%=abean.getFname()%></td>
						<td><%=abean.getDate()%></td>
						<td><%=abean.getTime()%></td>
						<td><%=abean.getRelat()%></td>
						<td>
							<button type="button" class="btn btn-outline-success"
								onclick="location.href='visitModify.jsp?num=<%=abean.getNum()%>'">
								정보 수정</button>
							<button type="button" class="btn btn-outline-danger"
								onclick="removeCheck(<%=abean.getNum()%>)">
								예약 취소</button>
						</td>
					</tr>
					<%
					}
					%>
				</c:when>
				<c:when test="${param.sel == 'c'}">
					<%
					for (int i = 0; i < dList.size(); i++) {
						visitDO abean = dList.get(i);
					%>
					<tr align="center">
						<td><%=abean.getName()%></td>
						<td><%=abean.getTel()%></td>
						<td><%=abean.getFname()%></td>
						<td><%=abean.getDate()%></td>
						<td><%=abean.getTime()%></td>
						<td><%=abean.getRelat()%></td>
						<td>
							<button type="button" class="btn btn-outline-success"
								onclick="location.href='visitModify.jsp?num=<%=abean.getNum()%>'">
								정보 수정</button>
							<button type="button" class="btn btn-outline-danger"
								onclick="removeCheck(<%=abean.getNum()%>)">
								예약 취소</button>
						</td>
					</tr>
					<%
					}
					%>
				</c:when>
				<c:when test="${param.sf == 'name' || param.sf == 'fname'}">
					<%
					for (int i = 0; i < sList.size(); i++) {
						visitDO abean = sList.get(i);
					%>
					<tr align="center">
						<td><%=abean.getName()%></td>
						<td><%=abean.getTel()%></td>
						<td><%=abean.getFname()%></td>
						<td><%=abean.getDate()%></td>
						<td><%=abean.getTime()%></td>
						<td><%=abean.getRelat()%></td>
						<td>
							<button type="button" class="btn btn-outline-success"
								onclick="location.href='visitModify.jsp?num=<%=abean.getNum()%>'">
								정보 수정</button>
							<button type="button" class="btn btn-outline-danger"
								onclick="removeCheck(<%=abean.getNum()%>)">
								예약 취소</button>
						</td>
					</tr>
					<%
					}
					%>
				</c:when>
				<c:otherwise>
					<%
					for (int i = 0; i < aList.size(); i++) {
						visitDO abean = aList.get(i);
					%>
					<tr align="center">
						<td><%=abean.getName()%></td>
						<td><%=abean.getTel()%></td>
						<td><%=abean.getFname()%></td>
						<td><%=abean.getDate()%></td>
						<td><%=abean.getTime()%></td>
						<td><%=abean.getRelat()%></td>
						<td>
							<button type="button" class="btn btn-outline-success"
								onclick="location.href='visitModify.jsp?num=<%=abean.getNum()%>'">
								정보 수정</button>
							<button type="button" class="openBtn btn btn-outline-danger"
								onclick="removeCheck(<%=abean.getNum()%>)">예약 취소</button>
						</td>
					</tr>
					<%
					}
					%>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<script type="text/javascript">
function removeCheck(num) {
	if (confirm("예약을 취소하시겠습니까?") == true){
		location.href="visitDelete.jsp?num="+num
	}else{
		return false;
	}
}
</script>
</body>
</html>