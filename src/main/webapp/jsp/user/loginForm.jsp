<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#menu {
	display: flex;
	width: 1000px;
	font-size: 20px;
	color: #A52A2A;
	margin: 0 auto;
	margin-top: 10px;
}
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 1000px;
	margin: 0 auto;
	margin-bottom: 100px;
	padding: 50px 0;
	background-color: #d2d2d2;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}
.logo-img{
	width:300px;
	padding: 20px;
}
form {
	padding: 5px;
	width: 300px;
}
#id, #password {
	width: 270px;
	padding: 15px;
	margin-top: 20px;
	border: 1px solid #ccc;
	border-radius: 3px;
}
#login {
	width: 300px;
	padding: 15px;
	margin-top: 50px;
	background-color: #B90000;
	color: #fff;
	border: none;
	border-radius: 3px;
}
#kakaologin {
	width: 300px;
	padding: 15px;
	margin-top: 20px;
	background-color: #F7E600;
	border: none;
	border-radius: 3px;
}
a {
	margin-top: 20px;
	color: #B90000;
	text-decoration: none;
}
</style>
<%
String msg = (String) request.getAttribute("msg");
if (msg != null && !msg.isEmpty()) {
%>
<script>
alert('<%= msg %>');
</script>
<%
}
%>
</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>
	<section>
		<div id="menu">
			<h1>회원로그인</h1>
		</div>
		<div class="container">
			<a href="${ pageContext.request.contextPath }/main.do">
				<img src="${ pageContext.request.contextPath }/images/logo1.png" alt="Bank 로고" class="logo-img">
			</a>
			<form action="${ pageContext.request.contextPath }/loginProcess.do" method="post">
				<input type="text" name="id" id="id" placeholder="아이디를 입력하세요."/>
				<input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요."/>
				<input type="submit" value="로그인" id="login" />
			</form>
				<input type="submit" value="카카오 로그인" id="kakaologin" />
			<br />
				<a href="${ pageContext.request.contextPath }/findUser.do">아이디/비밀번호찾기</a>
				<a href="${ pageContext.request.contextPath }/insertUser.do">회원가입하기</a>
			
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>