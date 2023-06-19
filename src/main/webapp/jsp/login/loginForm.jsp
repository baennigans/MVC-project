<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 1000px;
	margin: 100px auto;
	padding: 50px 0;
	background-color: #bebebe;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}
.login {
	margin-top: -100px;
}
.logo-img{
	width:300px;
}
form {
	padding: 5px;
	width: 300px;
}
#id, #password {
	width: 90%;
	padding: 15px;
	margin-top: 20px;
	border: 1px solid #ccc;
	border-radius: 3px;
}
#login {
	width: 300px;
	padding: 15px;
	margin-top: 40px;
	background-color: #B90000;
	color: #fff;
	border: none;
	border-radius: 3px;
}
#kakaologin {
	width: 300px;
	padding: 15px;
	margin-top: 40px;
	background-color: #F7E600;
	color: #fff;
	border: none;
	border-radius: 3px;
}
a {
	margin-top: 20px;
	padding: 20px;
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
			<h2 class="login">로그인</h2>
			<a href="${ pageContext.request.contextPath }/main.do"> <img
				src="${ pageContext.request.contextPath }/images/logo1.png"
				alt="Bank 로고" class="logo-img">
			</a>
			<form action="${ pageContext.request.contextPath }/loginProcess.do" method="post">
			<table>
			<tr>
				<td>
					<input type="text" name="id" id="id" />
					<input type="password" name="password" id="password" />
					<input type="submit" value="로그인" id="login" />
				</td>
				<td>
					<div class="vertical-divider"></div>
				</td>
				<td>
					<input type="submit" value="카카오 로그인" id="kakaologin" />
				</td>
			</tr>
			
			
			</table>
			</form>
			<br />
			<div>
				<a href="#.do">회원가입하기</a>
				<a href="#.do">아이디/비밀번호찾기</a>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>