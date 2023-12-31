<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BGH BANK</title>
<style>
#menu {
	display: flex;
	width: 1200px;
	font-size: 20px;
	color: #A52A2A;
	margin: 0 auto;
	margin-top: 10px;
}
#insertUser {
	display: flex;
	margin-left: 1020px;
}
.container {
	width:1200px;
	display: flex;
	flex-direction: column;
	background-color: rgba(255, 255, 255, 0.8);
	padding-bottom: 20px;
	margin: 0 auto;
	margin-bottom: 100px;
	margin-top: 38px;
}
.table-container {
	table-layout: fixed;
	width: 100%;
	border-collapse: collapse;
}
.table-container th {
	font-size: 14px;
	font-weight: bold;
	padding: 18px;
	border: 1px solid #ccc;
	text-align: center;
	color: #fff;
	background-color: #00008C;
}
.table-container td {
	font-size: 14px;
	font-weight: normal;
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	background-color: #fff;
}
table th:nth-child(1) {
	width: 10%;
}
table th:nth-child(2) {
	width: 10%;
}
table th:nth-child(3) {
	width: 16%;
}
table th:nth-child(4) {
	width: 10%;
}
table th:nth-child(5) {
	width: 15%;
}
table th:nth-child(6) {
	width: 15%;
}
table th:nth-child(7) {
	width: 8%;
}
table th:nth-child(8) {
	width: 8%;
}
table th:nth-child(9) {
	width: 8%;
}
#wrapper{
  height: auto;
  min-height: 800px;
  padding-bottom: 70px;
}
footer{
  height: 20px;
  position : relative;
  transform : translateY(-100%);
}
</style>
<script>
	function checkForm() {
		if (confirm("정말 삭제하시겠습니까?")) {
			return true
		} else {
			return false
		}
	}
</script>
</head>
<body>
	<div id="wrapper">
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>
	<section>
		<div id="menu">
			<h1>회원관리</h1>
		</div>
		<div class="container">
			<table class="table-container">
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이메일</th>
					<th>이름</th>
					<th>연락처</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>약관동의</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="user" items="${userList}">
					<tr>
						<td>${user.id}</td>
						<td>${user.password}</td>
						<td>${user.email}</td>
						<td>${user.name}</td>
						<td>${user.phone}</td>
						<td>${user.birth}</td>
						<td>
						<c:choose>
							<c:when test="${ user.gender == '0' }">여자</c:when>
						<c:otherwise>남자</c:otherwise>
						</c:choose>
						</td>
						<td>
						<c:choose>
							<c:when test="${ user.agree == '0' }">X</c:when>
						<c:otherwise>O</c:otherwise>
						</c:choose>
						</td>
						<td>
							<a href="${ pageContext.request.contextPath }/deleteUserList.do?id=${user.id}" onclick="return checkForm()">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	</div>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>