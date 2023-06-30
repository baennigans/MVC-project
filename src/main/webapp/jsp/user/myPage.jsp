<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#updateUser1 {
	width: 100%;
	padding: 15px;
	margin-top: 50px;
	background-color: #00008C;
	color: #fff;
	border: none;
	border-radius: 3px;
}
#updateUser2 {
	width: 100%;
	padding: 15px;
	margin-top: 50px;
	background-color: #CD0000;
	color: #fff;
	border: none;
	border-radius: 3px;
}
#deleteUser {
	width: 376px;
	padding: 15px;
	margin-top: 10px;
	background-color: #800000;
	color: #fff;
	border: none;
	border-radius: 3px;
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
	function checkForm1() {
		if (confirm("정보를 수정하시겠습니까?")) {
			return true
		} else {
			return false
		}
	}

	function checkForm2() {
		if (confirm("정말로 회원탈퇴 하시겠습니까?")) {
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
		<a href="${ pageContext.request.contextPath }/main.do">
			<img src="${ pageContext.request.contextPath }/images/logo4.png" alt="로고" class="logo-img">
		</a>
			<form action="${ pageContext.request.contextPath }/updateUser.do" method="post" onsubmit="return checkForm1()">
				<input type="hidden" name="id" value="${user.id}" />
				<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" value="${user.id}" disabled/>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" id="password" value="${user.password}" pattern=".{5,}" title="5자 이상 입력하세요" required/>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name" value="${user.name}" pattern=".{2,}" title="2자 이상 입력하세요" required/>
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
						<input type="text" name="email" id="email" value="${user.email}" pattern=".{10,}" title="10자 이상 입력하세요" required/>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="phone" id="phone" value="${user.phone}" pattern=".{9,}" title="9자 이상 입력하세요" required/>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<c:choose>
    						<c:when test="${user.gender == '1'}">
        						<input type="text" name="gender" id="gender" value="남성" disabled/>
    						</c:when>
    						<c:otherwise>
        						<input type="text" name="gender" id="gender" value="여성" disabled/>
    						</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>권한</td>
					<td>
						<c:choose>
    						<c:when test="${user.role == '1'}">
        						<input type="text" name="role" id="role" value="관리자(Admin)" disabled/>
    						</c:when>
    						<c:otherwise>
        						<input type="text" name="role" id="role" value="사용자(User)" disabled/>
    						</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<c:choose>
					<c:when test="${ user.role == '1' }">
						<td colspan="2"><input type="submit" value="정보수정하기" id="updateUser1" />
					</c:when>
					<c:otherwise>
						<td colspan="2"><input type="submit" value="정보수정하기" id="updateUser2" />
					</c:otherwise>
					</c:choose>
				</tr>
				</table>
			</form>
			<form action="${ pageContext.request.contextPath }/deleteUser.do" method="post" onsubmit="return checkForm2()">
				<input type="hidden" name="id" value="${user.id}" />
				<input type="submit" value="회원탈퇴하기" id="deleteUser" />
			</form>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>