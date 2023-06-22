<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#menu {
	display: flex;
	width: 1200px;
	font-size: 20px;
	color: #A52A2A;
	margin: 0 auto;
	margin-top: 10px;
}
#insertBoard {
	display: flex;
	margin-left: 1020px;
}
.container {
	width:1200px;
	display: flex;
	flex-direction: column;
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px;
	margin: 0 auto;
}
table {
	table-layout: fixed;
	width: 100%;
	border-collapse: collapse;
}
table th {
	font-size: 14px;
	font-weight: bold;
	padding: 18px;
	border: 1px solid #ccc;
	text-align: center;
	color: #fff;
	background-color: #CD0000;
}
table th:nth-child(1) {
	width: 10%;
}

table th:nth-child(2) {
	width: 60%;
}

table th:nth-child(3) {
	width: 15%;
}

table th:nth-child(4) {
	width: 15%;
}
table td {
	font-size: 14px;
	font-weight: normal;
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	background-color: #fff;
}
.form-container {
	display: flex;
	justify-content: center;
	margin-top: 40px;
}
.form-container input[type="text"] {
	width: 400px;
	padding: 8px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 4px;
}
.form-container input[type="submit"] {
	margin-left: 10px;
	padding: 8px 16px;
	font-size: 16px;
	font-weight: bold;
	text-decoration: none;
	color: #fff;
	background-color: #CD0000;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>
	<section>
		<div id="menu">
			<h1>게시판</h1>
		<form action="${ pageContext.request.contextPath }/insertBoard.do" method="post" class="form-container" id="insertBoard">
			<input type="submit" value="글쓰기">
		</form>
		</div>
		<div class="container">
			<table class="table-container">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
				<c:forEach var="board" items="${boardList}">
					<tr>
						<td>${board.no}</td>
						<td>${board.title}</td>
						<td>${board.id}</td>
						<td>${board.date}</td>
					</tr>
				</c:forEach>
			</table>
			<form action="${ pageContext.request.contextPath }/searchBoard.do" method="post" class="form-container">
				<input type="text" name="word" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색">
			</form>
		</div>
	</section>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>