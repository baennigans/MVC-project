<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	margin: 50px auto;
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
.getnotice {
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
#updateNotice {
	width: 300px;
	margin: 30px auto;
	padding: 8px 16px;
	color: white;
	border: none;
	border-radius: 4px;
	background-color: #4CAF50;
}
#deleteNotice {
	width: 300px;
	padding: 8px 16px;
	color: white;
	border: none;
	border-radius: 4px;
	background-color: #f44336;
}
#getlist {
	margin: 30px auto;
	
	color: #B90000;
	text-decoration: none;
}
</style>
<script>
	function checkForm() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
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
			<form action="${ pageContext.request.contextPath }/updateNotice.do" method="post">
				<input name="no" type="hidden" value="${notice.no}" />
				<table border="1" class="getnotice">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" value="${notice.title}" disabled /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="detail" cols="40" rows="10" disabled>${notice.detail}</textarea></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="id" value="${notice.id}" disabled /></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td><input type="text" name="date" value="${notice.date}" disabled /></td>
					</tr>
					<tr>
						<c:if test="${user.id == notice.id || user.role == '1'}">
							<td colspan="2"><input type="submit" value="수정하기" id="updateNotice" /></td>
						</c:if>
					</tr>
				</table>
			</form>
			<br />
			<c:if test="${user.id == notice.id || user.role == '1'}">
				<form action="${ pageContext.request.contextPath }/deleteNotice.do?no=${notice.no}" method="post" onsubmit="return checkForm()">
					<input type="hidden" name="no" value="${notice.no}" />
					<input type="submit" value="삭제하기" id="deleteNotice" />
				</form>
			</c:if>
			<a href="${ pageContext.request.contextPath }/noticePaging.do" id="getlist">목록으로</a>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>