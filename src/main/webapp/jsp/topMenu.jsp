<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.topMenu-bar1 {
        text-align: right;
        margin-right: 40px;
    }
    .topMenu-item1 {
        display: inline-block;
        padding: 10px;
    }
	.topMenu-item1 a {
		color: #333;
		text-decoration: none;
	}
	.topMenu-item1 a:hover {
		color: #EB0000;
	}
	.logo1{
		display: inline-block;
		margin-left: 100px;
	}
	.topMenu-bar2 {
        float: right;
        margin-right: 40px;
    }
    .topMenu-item2 {
        display: inline-block;
        padding: 10px;
    }
	.topMenu-item2 a {
		color: #B90000;
		font-size: 20px;
		text-decoration: none;
		font-weight: bold;
	}
	.topMenu-item2 a:hover {
		color: #EB0000;
	}
	.red-line {
		border-bottom: 3px solid #EB0000;
		margin-top: 25px;
	}
</style>
</head>

<body>
	<div class="topMenu-bar1">
		
		<c:choose>
		
		<c:when test="${ empty login }">
	
		<div class="topMenu-item1">
			<a href="${ pageContext.request.contextPath }/login.do">로그인</a>
		</div>
		<div class="topMenu-item1">
			<a href="${ pageContext.request.contextPath }/insertUser.do">회원가입</a>
		</div>
		
		</c:when>
		
		<c:otherwise>
		<div class="topMenu-item1">
			<a href="${ pageContext.request.contextPath }/myPage.do">마이페이지</a>
		</div>
		<div class="topMenu-item1">
			<a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a>
		</div>
		</c:otherwise>
		
		</c:choose>
		
		<div class="topMenu-item1">
			<a href="${ pageContext.request.contextPath }/introduce.do">은행소개</a>
		</div>
	</div>
	<a href="${ pageContext.request.contextPath }/main.do">
		<img src="${ pageContext.request.contextPath }/images/logo2.png" alt="로고" class="logo1">
	</a>
	<div class="topMenu-bar2">
		<div class="topMenu-item2">
			<a href="#">계좌조회</a>
		</div>
		<div class="topMenu-item2">
			<a href="#">계좌이체</a>
		</div>
		<div class="topMenu-item2">
			<a href="#">계좌개설</a>
		</div>
		<div class="topMenu-item2">
			<a href="${ pageContext.request.contextPath }/noticeList.do">공지사항</a>
		</div>
		<div class="topMenu-item2">
			<a href="${ pageContext.request.contextPath }/boardList.do">게시판</a>
		</div>
	</div>
	<div class="red-line"></div>
</body>
</html>