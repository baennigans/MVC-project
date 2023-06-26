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
	margin: 0 auto;
	margin-top: 50px;
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
.getboard {
	text-align: center;
	width: 900px;
	margin: 0 auto;
	margin-top: 30px;
	padding: 100px auto;
	background-color: #fff;
	border-collapse: collapse;
	border: none;
}
input[type="text"], textarea {
	width: 100%;
	font-size: 16px;
    font-weight: bold;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
#insertBoard {
	width: 300px;
	margin: 30px auto;
	padding: 8px 16px;
	color: white;
	border: none;
	border-radius: 4px;
	background-color: #CD0000;
}
#getlist {
	margin: 30px auto;
	color: #B90000;
	text-decoration: none;
}
</style>
<script>
	function checkForm() {
		if (confirm("게시글을 등록하시겠습니까?")) {
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
				<img src="${ pageContext.request.contextPath }/images/logo3.png" alt="Bank 로고" class="logo-img">
			</a>
			<form action="${ pageContext.request.contextPath }/insertBoardProcess.do" method="post" onsubmit="return checkForm()">
				<table border="1" class="getboard">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" /></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="hidden" name="id" value="${user.id}" /> <input
							type="text" value="${user.id}" disabled /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="detail" cols="40" rows="10"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="등록" id="insertBoard" /></td>
					</tr>
				</table>
			</form>
			<a href="${ pageContext.request.contextPath }/boardPaging.do"
				id="getlist">목록으로</a>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>