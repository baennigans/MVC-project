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
#insertNotice {
	display: flex;
	margin-left: 936px;
}
.container {
	width:1200px;
	display: flex;
	flex-direction: column;
	background-color: rgba(255, 255, 255, 0.8);
	padding-bottom: 20px;
	margin: 37px auto;
}
.table-container {
	table-layout: fixed;
	width: 100%;
	border-collapse: collapse;
}
#admin1 th, #admin2, #admin3 {
    background-color: #00008C;
}
.table-container th {
	font-size: 14px;
	font-weight: bold;
	padding: 18px;
	border: 1px solid #ccc;
	text-align: center;
    background-color: #CD0000;
	color: #fff;
}
.table-container td {
	font-size: 14px;
	font-weight: normal;
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
	background-color: #fff;
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
.form-container {
	display: flex;
	justify-content: center;
	margin-top: 40px;
	margin-bottom: 50px;
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
	background-color: #CD0000;;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
#paging {
	border: none;
	border-collapse: collapse;
	margin-top: 30px;
}
.page{
	font-size: 20px;
	text-decoration: none;
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
			<h1>공지사항</h1>
			
			<c:if test="${ user.role == '1' }">
				<form action="${ pageContext.request.contextPath }/insertNotice.do" method="post" class="form-container" id="insertNotice">
				<input type="submit" value="공지사항 쓰기" id="admin2">
				</form>
			</c:if>
		</div>
		<div class="container">
			<table class="table-container" id="${user.role == '1' ? 'admin1' : 'user1'}">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
				<c:forEach var="notice" items="${noticeList}">
					<tr>
						<td>${notice.no}</td>
						<td><a href="${ pageContext.request.contextPath }/getNotice.do?no=${notice.no}">${notice.title}</a></td>
						<td>${notice.id}</td>
						<td>${notice.date}</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
	<div align="center" id="paging">      
		<table id="pagingtable">
		<tr>
			<td valign="middle">
			<%-- 처음 페이지 설정 --%>
			<c:choose>
				<c:when test="${pageNo == 1}" >
					<img alt="처음으로" src="${ pageContext.request.contextPath }/images/btn_first.gif" class="buttun">
				</c:when>
				<c:otherwise>
					<a href="${ pageContext.request.contextPath }/noticePaging.do">
						<img alt="처음으로" src="${ pageContext.request.contextPath }/images/btn_first.gif" class="buttun">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- 이전 페이지 설정 --%>
			<c:choose>
				<c:when test="${beginPage == 1}" >
					<img alt="이전" src="${ pageContext.request.contextPath }/images/btn_pre.gif" class="buttun">
				</c:when>
				<c:otherwise>
					<a href="${ pageContext.request.contextPath }/noticePaging.do?pageNo=${beginPage - 1}">
						<img alt="이전" src="${ pageContext.request.contextPath }/images/btn_pre.gif" class="buttun">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- 페이지 번호 설정 --%>			
			<c:forEach var="i" begin="${beginPage}" end="${endPage}">
				<c:if test="${i eq pageNo}">
					<strong class="page">[${i}]</strong>
				</c:if>
				<c:if test="${i ne pageNo}">
					<a href="${ pageContext.request.contextPath }/noticePaging.do?pageNo=${i}" class="page">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<%-- 다음 페이지 설정 --%>
			<c:choose>
				<c:when test="${endPage == lastPage}" >
					<img alt="다음" src="${ pageContext.request.contextPath }/images/btn_next.gif" class="buttun">
				</c:when>
				<c:otherwise>
					<a href="${ pageContext.request.contextPath }/noticePaging.do?pageNo=${endPage + 1}">
						<img alt="다음" src="${ pageContext.request.contextPath }/images/btn_next.gif" class="buttun">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- 마지막 페이지 설정 --%>
			<c:choose>
				<c:when test="${pageNo == lastPage}" >
					<img alt="마지막" src="${ pageContext.request.contextPath }/images/btn_last.gif" class="buttun">
				</c:when>
				<c:otherwise>
					<a href="${ pageContext.request.contextPath }/noticePaging.do?pageNo=${lastPage}">
						<img alt="마지막" src="${ pageContext.request.contextPath }/images/btn_last.gif" class="buttun">
					</a>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>	
		</table>
	</div>
	<form action="${ pageContext.request.contextPath }/searchNotice.do" method="post" class="form-container">
				<input type="text" name="word" placeholder="검색어를 입력하세요">
				<input type="submit" value="검색" id="${user.role == '1' ? 'admin3' : 'user3'}">
	</form>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>