<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${find}' == 'true'){
		location.href = "${ pageContext.request.contextPath }/findID.do"
	}else{
		alert('${msg}')
		location.href = "${ pageContext.request.contextPath }/findUser.do"	
	}
</script>