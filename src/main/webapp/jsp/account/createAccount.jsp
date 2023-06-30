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
	width: 900px;
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
	width: 15%;
}
table th:nth-child(2) {
	width: 60%;
}
table th:nth-child(3) {
	width: 25%;
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
	padding: 40px 80px;
	margin-bottom: 50px;
	font-size: 40px;
	font-weight: bold;
	text-decoration: none;
	color: #fff;
	background-color: #CD0000;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
#possible {
	color: #A52A2A;
	font-size: 25px;
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
			<h1>계좌개설</h1>
		</div>
		<form action="${ pageContext.request.contextPath }/insertAccount.do" method="post" class="form-container" id="insertProduct">
			<input type="submit" value="계좌개설하기" id="admin">
		</form>
		<div class="container">
			<h3 id="possible">가입가능상품</h3>
			<table class="table-container">
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>이자율</th>
				</tr>
				<c:forEach var="product" items="${productList}">
					<tr>
						<td>${product.no}</td>
						<td>${product.name}</td>
						<td>${product.interest} %</td>
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