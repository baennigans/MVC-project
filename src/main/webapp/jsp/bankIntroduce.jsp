<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bank-introduce {
	display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 50px;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="topMenu.jsp" />
	</header>
	<section>
	<div class="bank-introduce">
		<img alt="경영이념" src="${ pageContext.request.contextPath }/images/bankinfo.jpg">	
	</div>
	</section>
	<footer>
		<jsp:include page="bottomMenu.jsp" />
	</footer>
</body>
</html>