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
	width: 1000px;
	font-size: 20px;
	color: #A52A2A;
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 50px;
}
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 800px;
	margin: 0 auto;
	margin-bottom: 50px;
	padding: 20px 0;
	background-color: #d2d2d2;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}
table td:nth-child(1) {
	width: 30%;
}
table td:nth-child(2) {
	width: 70%;
	text-align: center;
	padding: 0 20px;
}
.logo-img {
	width: 250px;
	padding: 20px;
}
.submit {
	width: 250px;
	padding: 5px 16px;
	font-size: 18px;
	font-weight: bold;
	text-decoration: none;
	color: #fff;
	background-color: #CD0000;
	border: none;
	border-radius: 4px;
	cursor: pointer;
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
<%
String msg = (String) request.getAttribute("msg");
if (msg != null && !msg.isEmpty()) {
%>
<script>
alert('<%=msg%>
	');
</script>
<%
}
%>
</head>
<body>
	<div id="wrapper">
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>

	<section>
		<div id="menu">
			<h1>계좌조회</h1>
		</div>
		<c:forEach var="account" items="${accountList}">
			<div class="container">
				<table>
					<tr>
						<td><a href="${ pageContext.request.contextPath }/main.do">
								<img src="${ pageContext.request.contextPath }/images/logo1.png" alt="Bank 로고" class="logo-img">
						</a></td>
						<td>
							<form action="${ pageContext.request.contextPath }/getTransfer.do?accountNo=${account.accountNo}" method="post">
								<h3>계좌번호 : ${account.accountNo}</h3>
								<hr>
								<h3>계좌이름 : ${account.accountName}</h3>
								<hr>
								<h2>${account.balance} 원</h2>
								<input type="submit" value="내역조회하기" class="submit"/>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</c:forEach>
	</section>
	</div>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>