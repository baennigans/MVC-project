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
	if (confirm("게시글을 수정하시겠습니까?")) {
		return true
	} else {
		return false
	}
}
</script>
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
	<form action="${ pageContext.request.contextPath }/updateBoardProcess.do" method="post" onsubmit="return checkForm()">
		<input name="no" type="hidden" value="${board.no}" />
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value="${board.title}" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="detail" cols="40" rows="10" >${board.detail}</textarea>
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
				<td colspan="2"><input type="submit" value="수정완료" /></td>
			</tr>
		</table>
		<a href="${ pageContext.request.contextPath }/boardList.do">목록으로</a>
	</form>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>