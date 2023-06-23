<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BGH BANK</title>
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
						<td><a href="${ pageContext.request.contextPath }/getBoard.do?no=${board.no}">${board.title}</a></td>
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
	
	<div align="center">      
		<table>
		<tr>
			<td valign="middle">
			<%-- 처음 페이지 설정 --%>
			<c:choose>
				<c:when test="${pageNo == 1}" >
					<img alt="처음으로" src="${ pageContext.request.contextPath }/images/btn_first.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="${ pageContext.request.contextPath }/boardPaging.do">
						<img alt="처음으로" src="${ pageContext.request.contextPath }/images/btn_first.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- 이전 페이지 설정 --%>
			<c:choose>
				<c:when test="${beginPage == 1}" >
					<img alt="이전" src="${ pageContext.request.contextPath }/images/btn_pre.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="${ pageContext.request.contextPath }/boardPaging.do">
						<img alt="이전" src="${ pageContext.request.contextPath }/images/btn_pre.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- 페이지 번호 설정 --%>			
			<c:forEach var="i" begin="${beginPage}" end="${endPage}">
				<c:if test="${i eq pageNo}">
					<strong>[${i}]</strong>
				</c:if>
				<c:if test="${i ne pageNo}">
					<a href="boardPaging.do?pageNo=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<%-- 다음 페이지 설정 --%>
			<c:choose>
				<c:when test="${endPage == lastPage}" >
					<img alt="다음" src="${ pageContext.request.contextPath }/images/btn_next.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="/jsp/board/boardList.jsp?pageNo=${endPage + 1}">
						<img alt="다음" src="${ pageContext.request.contextPath }/images/btn_next.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- 마지막 페이지 설정 --%>
			<c:choose>
				<c:when test="${pageNo == lastPage}" >
					<img alt="마지막" src="${ pageContext.request.contextPath }/images/btn_last.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="/jsp/board/boardList.jsp?pageNo=${lastPage}">
						<img alt="마지막" src="${ pageContext.request.contextPath }/images/btn_last.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>	
		</table>
	</div>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>