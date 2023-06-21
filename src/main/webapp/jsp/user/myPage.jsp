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
	background-color: #d2d2d2;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}
form {
	margin-top: 30px;
}
table td {
	padding: 10px;
}
#id, #password, #name, #birth, #phone, #email, #gender, #role {
	width: 270px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}
#updateUser {
	width: 100%;
	padding: 15px;
	margin-top: 50px;
	background-color: #B90000;
	color: #fff;
	border: none;
	border-radius: 3px;
}
a {
	margin-top: 10px;
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
<script>
	var genderValue = ${user.gender};
	var displayValue = (genderValue === 0) ? "female" : "male";
	document.getElementById("gender").value = displayValue;
</script>
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
			<form action="updateUserProcess.do" method="post">
				<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" id="id" value="${user.id}" disabled/>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" id="password" value="${user.password}"/>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name" value="${user.name}"/>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" name="birth" id="birth" value="${user.birth}" disabled/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="email" id="email" value="${user.email}" />
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="phone" id="phone" value="${user.phone}" />
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="text" name="gender" id="gender" value="${user.gender}" disabled/>
					</td>
				</tr>
				<tr>
					<td>권한</td>
					<td>
						<input type="text" name="role" id="role" value="${user.role}" disabled/>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="정보수정하기" id="updateUser" />
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