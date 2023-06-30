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
	background-color: #CD0000;
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
	width: 20%;
}
table th:nth-child(2) {
	width: 10%;
}
table th:nth-child(3) {
	width: 20%;
}
table th:nth-child(4) {
	width: 15%;
}
table th:nth-child(5) {
	width: 20%;
}
table th:nth-child(6) {
	width: 15%;
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
</head>
<body>
	<div id="wrapper">
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>
	<section>
		<div id="menu">
			<h1>거래내역</h1>
		</div>
		<div class="container">
			<table class="table-container">
				<tr>
					<th>나의계좌번호</th>
					<th>거래은행</th>
					<th>거래계좌번호</th>
					<th>입/출금</th>
					<th>거래금액</th>
					<th>거래일시</th>
				</tr>
				<c:forEach var="transfer" items="${transferList}">
					<tr>
						<td>${transfer.myAccountNo}</td>
						<td>${transfer.yourBankCode}</td>
						<td>${transfer.yourAccountNo}</td>
						<td>${transfer.detail}</td>
						<td>${transfer.amount}원</td>
						<td>${transfer.date}</td>
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