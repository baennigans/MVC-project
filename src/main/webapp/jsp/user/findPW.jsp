<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BGH BANK</title>
<style>
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 1000px;
	margin: 100px auto;
	padding: 50px 0;
	background-color: #d2d2d2;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}
.container2 {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 600px;
	height: 250px;
	margin: 30px auto;
	padding: 50px 0;
	background-color: white;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}
a {
	margin-top: 10px;
	color: #B90000;
	text-decoration: none;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>
	<section>
		<div class="container">
			<a href="${ pageContext.request.contextPath }/main.do">
				<img src="${ pageContext.request.contextPath }/images/logo4.png" alt="로고" class="logo-img">
			</a>
			<div class="container2">
				<h2>'<%= request.getAttribute("name") %>' 님의 비밀번호는</h2>
				<h2>'<%= request.getAttribute("password") %>' 입니다.</h2>
			</div>
			<br /> <a href="${ pageContext.request.contextPath }/login.do">로그인 화면으로 이동</a>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>