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
	margin-top: -90px;
}
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 700px;
	margin: 0 auto;
	margin-top: 100px;
	margin-bottom: 100px;
	padding: 100px auto;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}
.logo-img{
	width: 130px;
	padding: 20px;
	margin-top: 40px;
}
.insertAccount-table {
	text-align: center;
	width: 600px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 50px;
	padding: 100px auto;
	background-color: #fff;
	border-collapse: collapse;
	border: none;
}
.insertAccount-table td {
	padding-top : 20px;
	padding-bottom : 20px;
}
table td:nth-child(1) {
	width: 40%;
}
table td:nth-child(2) {
	width: 60%;
}
select {
	width:80%;
	width: 80%;
	font-size: 15px;
    font-weight: bold;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type="text"], input[type="password"]{
	width: 80%;
	font-size: 15px;
    font-weight: bold;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
#insertAccount {
	width: 300px;
	margin: 30px auto;
	padding: 15px 16px;
	color: white;
	border: none;
	border-radius: 4px;
	background-color: #CD0000;
}
</style>
<script>
	function checkForm() {
		if (confirm("계좌를 개설하시겠습니까?")) {
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
		<div class="container">
		<div id="menu">
			<h1>계좌개설</h1>
		</div>
			<a href="${ pageContext.request.contextPath }/main.do">
				<img src="${ pageContext.request.contextPath }/images/logo3.png" alt="Bank 로고" class="logo-img">
			</a>
			<form action="${ pageContext.request.contextPath }/insertAccountProcess.do" method="post" onsubmit="return checkForm()">
				<table border="1" class="insertAccount-table">
					<tr>
						<td>이름</td>
						<td><input type="text" name="username" value="${user.name}" readonly></td>
					</tr>
					<tr>
						<td>상품</td>
						<td>
							<select name="productNo">
								<c:forEach var="product" items="${productList}">
									<option>${product.no}. ${product.name}&nbsp;&nbsp;/&nbsp;&nbsp;(${product.interest}%)</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>계좌이름</td>
						<td>
							<input type="text" name="productname"></td>
					</tr>
					<tr>
						<td>비밀번호(숫자 4자리)</td>
						<td>
							<input type="password" name="password" pattern="\d{4}" title="4자리숫자를 입력하세요" required></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="계좌 개설" id="insertAccount" /></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>