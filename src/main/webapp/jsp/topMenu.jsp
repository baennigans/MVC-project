<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menu-bar1 {
        text-align: right;
        margin-right: 40px;
    }
    .menu-item1 {
        display: inline-block;
        padding: 10px;
    }
	.menu-item1 a {
		color: #333;
		text-decoration: none;
	}
	.menu-item1 a:hover {
		color: #EB0000;
	}
	.logo1{
		display: inline-block;
		margin-left: 100px;
	}
	.menu-bar2 {
        float: right;
        margin-right: 40px;
    }
    .menu-item2 {
        display: inline-block;
        padding: 10px;
    }
	.menu-item2 a {
		color: #B90000;
		font-size: 20px;
		text-decoration: none;
		font-weight: bold;
	}
	.menu-item2 a:hover {
		color: #EB0000;
	}
	.red-line {
		border-bottom: 3px solid #EB0000;
		margin-top: 25px;
	}
</style>
</head>

<body>
	<div class="menu-bar1">
		<div class="menu-item1">
			<a href="#">로그인</a>
		</div>
		<div class="menu-item1">
			<a href="#">회원가입</a>
		</div>
		<div class="menu-item1">
			<a href="#">은행소개</a>
		</div>
	</div>
	<a href="home.do">
		<img src="${ pageContext.request.contextPath }/images/logo2.png" alt="로고" class="logo1">
	</a>
	<div class="menu-bar2">
		<div class="menu-item2">
			<a href="#">계좌조회</a>
		</div>
		<div class="menu-item2">
			<a href="#">계좌이체</a>
		</div>
		<div class="menu-item2">
			<a href="#">계좌개설</a>
		</div>
	</div>
	<div class="red-line"></div>
</body>
</html>