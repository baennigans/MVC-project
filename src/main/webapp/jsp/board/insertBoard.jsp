<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>
	<section>
		<h1>새글 등록</h1>
		<hr />
	<form action="${ pageContext.request.contextPath }/insertBoardProcess.do" method="post">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="hidden" name="id" value="${user.id}" />
					<input type="text" value="${user.id}" disabled />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="detail" cols="40" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" /></td>
			</tr>
		</table>
	</form>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>