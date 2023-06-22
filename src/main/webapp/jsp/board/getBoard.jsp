<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function checkForm() {
	if (confirm("정말 삭제하시겠습니까?")) {
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
	<form action="${ pageContext.request.contextPath }/updateBoard.do" method="post">
		<input name="no" type="hidden" value="${board.no}" />
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
				<td><input type="text" name="id" value="${board.id}" disabled /></td>
			</tr>
			<tr>
				<td>작성일자</td>
				<td><input type="text" name="date" value="${board.date}" disabled /></td>
			</tr>
			<tr>
			<c:if test="${user.id == board.id || user.role == '1'}">
				<td colspan="2"><input type="submit" value="수정하기" /></td>
			</c:if>
			</tr>
		</table>
	</form>
		<br />
		<c:if test="${user.id == board.id || user.role == '1'}">
			<form action="${ pageContext.request.contextPath }/deleteBoard.do?no=${board.no}" method="post" onsubmit="return checkForm()">
				<input type="hidden" name="no" value="${board.no}" />
				<input type="submit" value="삭제하기" id="deleteBoard" />
			</form>			
		</c:if>
		<a href="${ pageContext.request.contextPath }/boardList.do">목록으로</a>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>