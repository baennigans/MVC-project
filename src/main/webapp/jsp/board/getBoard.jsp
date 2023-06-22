<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	
	<form action="updateBoard.do" method="post">
		<input name="seq" type="hidden" value="${book.seq}" />
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${board.title}" disabled /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="detail" cols="40" rows="10" disabled >${board.detail}</textarea>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" value="${user.name}" disabled /></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td><input type="text" name="date" value="${board.date}" disabled /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" /></td>
			</tr>
		</table>
		<br />
		<c:if test="${user.role == 'Admin'}">
			<a href="deleteBook.do?seq=${book.seq}">delete</a>
		</c:if>
		<a href="getBookList.do">list</a>
	</form>
	
	
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>