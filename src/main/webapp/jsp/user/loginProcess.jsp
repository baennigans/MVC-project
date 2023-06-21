<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	alert('${msg}')
	
	if('${login}'=='true'){
		location.href = "${ pageContext.request.contextPath }/main.do"
	}else{
		location.href = "${ pageContext.request.contextPath }/login.do"	
	}
</script>