<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BGH BANK</title>
<style>
#menu {
	display: flex;
	width: 1000px;
	font-size: 20px;
	color: #A52A2A;
	margin: 0 auto;
	margin-top: 10px;
}
.bank-introduce {
	display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 10px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="topMenu.jsp" />
	</header>
	<section>
	<div id="menu">
			<h1>은행소개 및 경영이념</h1>
	</div>
	<div class="bank-introduce">
		<img alt="경영이념" src="${ pageContext.request.contextPath }/images/bankinfo.jpg">	
	</div>
	</section>
	<footer>
		<jsp:include page="bottomMenu.jsp" />
	</footer>
</body>
</html>