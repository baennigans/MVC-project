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
#insertProduct {
	display: flex;
	margin-left: 969px;
}
#admin {
	background-color: #00008C;
}
.container {
	width:1200px;
	display: flex;
	flex-direction: column;
	padding-bottom: 20px;
	margin: 0 auto;
	margin-bottom: 100px;
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
	width: 50%;
}
table th:nth-child(3) {
	width: 20%;
}
table th:nth-child(4) {
	width: 10%;
}
table th:nth-child(5) {
	width: 10%;
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
<script>
	function checkForm() {
		if (confirm("정말 변경하시겠습니까?")) {
			return true
		} else {
			return false
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>
	<section>
		<div id="menu">
			<h1>상품관리</h1>
			<form action="${ pageContext.request.contextPath }/insertProduct.do" method="post" class="form-container" id="insertProduct">
				<input type="submit" value="상품 등록" id="admin">
			</form>
		</div>
		<div class="container">
			<table class="table-container">
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>이자율</th>
					<th>가입가능여부</th>
					<th>변경</th>
				</tr>
				<c:forEach var="product" items="${productList}">
					<tr>
						<td>${product.no}</td>
						<td>${product.name}</td>
						<td>${product.interest} %</td>
						<td>
						<c:choose>
							<c:when test="${ product.possible == '0' }">X</c:when>
						<c:otherwise>O</c:otherwise>
						</c:choose>
						</td>
						<td>
							<a href="${ pageContext.request.contextPath }/productPossible.do?no=${product.no}&possible=${product.possible}" onclick="return checkForm()">가능여부변경</a>
						</td>
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