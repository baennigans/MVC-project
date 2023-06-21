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
#id, #password, #name, #birth, #phone1, #emailselect, #email, #phone2, #phone3 {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}
#id, #password, #name, #birth{
	width: 270px;
}
#phone1 {
	width: 80px;
}
#emailselect {
	width: 133px;
}
#email {
	width: 110px;
}
#phone2, #phone3 {
	width: 66px;
}
#role1, #role2 {
	margin-top: 10px;
}
#insertUser {
	width: 100%;
	padding: 15px;
	margin-top: 10px;
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
			<form action="insertUserProcess.do" method="post">
				<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" id="id"/>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" id="password"/>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"/>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="date" name="birth" id="birth"/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="emailId" id="email"/> @
						<select name="emailDomain" id="emailselect">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><select name="phone1" id="phone1">
							<option>010</option>
							<option>011</option>
							<option>031</option>
							<option>02</option>
						</select>
						 - <input type="text" name="phone2" size="5" id="phone2">
						 - <input type="text" name="phone3" size="5" id="phone3"> 
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="radio" name="gender" value="0" checked="checked">여자
						<input type="radio" name="gender" value="1" id="role1">남자&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;
						<input type="radio" name="role" value="0" checked="checked" />사용자
						<input type="radio" name="role" value="1" id="role2" />관리자
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원가입" id="insertUser" />
				</tr>
				</table>
			</form>
			<br /> <a href="${ pageContext.request.contextPath }/login.do">로그인 화면으로 이동</a>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>