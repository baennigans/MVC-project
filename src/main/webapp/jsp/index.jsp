<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BGH BANK</title>
<%
String msg = (String) request.getAttribute("msg");
if (msg != null && !msg.isEmpty()) {
%>
<script>
alert('<%=msg%>');
</script>
<%
}
%>
</head>
<style>
#wrapper{
  height: auto;
  min-height: 800px;
  padding-bottom: 70px;
}
footer{
  height: 20px;
  position : relative;
  transform : translateY(-100%);
}
</style>
<body>
	<div id="wrapper">
	<header>
		<%@ include file="topMenu.jsp"%>
	</header>
	<section>
		<div>메인페이지....</div>
	</section>
	</div>
	<footer>
		<%@ include file="bottomMenu.jsp"%>
	</footer>
</body>
</html>