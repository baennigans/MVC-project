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
	padding: 5px;
	width: 300px;
}
.findID {
	margin-right:50px;
}
.findPW {
	margin-left:50px;
}
#name1, #phone1, #name2, #phone2, #id {
	width: 270px;
	padding: 15px;
	margin-top: 20px;
	border: 1px solid #ccc;
	border-radius: 3px;
}
#login1{
	width: 300px;
	padding: 15px;
	margin-top: 115px;
	background-color: #B90000;
	color: #fff;
	border: none;
	border-radius: 3px;
} 

#login2 {
	width: 300px;
	padding: 15px;
	margin-top: 50px;
	background-color: #B90000;
	color: #fff;
	border: none;
	border-radius: 3px;
}
.aa {
	padding: 20px;
	color: #B90000;
	text-decoration: none;
}
td {
    border-right: 1px solid #000;
  }
td:last-child {
    border-right: none;
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
				<img src="${ pageContext.request.contextPath }/images/logo4.png" alt="Bank 로고" class="logo-img">
			</a><br><br>
			<table>
				<tr>
					<td>
						<form action="${ pageContext.request.contextPath }/findIDProcess.do" method="post" class="findID">
							<h2>아이디 찾기</h2>
							<input type="text" name="name" id="name1" placeholder="이름을 입력하세요."/>
							<input type="text" name="phone" id="phone1" placeholder="휴대전화번호를 입력하세요."/>
							<input type="submit" value="아이디찾기" id="login1" />
						</form>
					</td>
					<td>
						<form action="${ pageContext.request.contextPath }/findPWProcess.do" method="post" class="findPW">
							<h2>비밀번호 찾기</h2>
							<input type="text" name="id" id="id" placeholder="아이디를 입력하세요."/>
							<input type="text" name="name" id="name2" placeholder="이름을 입력하세요."/>
							<input type="text" name="phone" id="phone2" placeholder="휴대전화번호를 입력하세요."/>
							<input type="submit" value="비밀번호찾기" id="login2" />
						</form>
					</td>
				</tr>
			</table>
			<br>
			<br>
			<div>
				<a href="${ pageContext.request.contextPath }/login.do" class="aa">로그인 화면으로 이동</a>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>