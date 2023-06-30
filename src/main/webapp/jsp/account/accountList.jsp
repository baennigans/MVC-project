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
	width: 30%;
}
table th:nth-child(2) {
	width: 10%;
}
table th:nth-child(3) {
	width: 10%;
}
table th:nth-child(4) {
	width: 30%;
}
table th:nth-child(5) {
	width: 20%;
}
.form-container {
	display: flex;
	justify-content: center;
	margin-top: 40px;
	margin-bottom: 50px;
}
.form-container input[type="text"] {
	width: 400px;
	padding: 8px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 4px;
}
.form-container input[type="submit"] {
	margin-left: 10px;
	padding: 8px 16px;
	font-size: 16px;
	font-weight: bold;
	text-decoration: none;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>
	<section>
		<div id="menu">
			<h1>계좌관리</h1>
		</div>
		<div class="container">
			<table class="table-container">
				<tr>
					<th>계좌번호</th>
					<th>회원아이디</th>
					<th>사용자이름</th>
					<th>계좌이름</th>
					<th>잔고</th>
				</tr>
				<c:forEach var="account" items="${accountList}">
					<tr>
						<td>${account.accountNo}</td>
						<td>${account.id}</td>
						<td>${account.userName}</td>
						<td>${account.accountName}</td>
						<td>${account.balance} 원</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>