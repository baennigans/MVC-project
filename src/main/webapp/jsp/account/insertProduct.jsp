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
	width: 1200px;
	font-size: 20px;
	color: #A52A2A;
	margin: 0 auto;
	margin-top: -90px;
}
.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 600px;
	margin: 0 auto;
	margin-top: 100px;
	margin-bottom: 100px;
	padding: 100px auto;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
}
.logo-img{
	width: 130px;
	padding: 20px;
	margin-top: 40px;
}
.getproduct {
	text-align: center;
	width: 500px;
	margin: 0 auto;
	margin-top: 30px;
	padding: 100px auto;
	background-color: #fff;
	border-collapse: collapse;
	border: none;
}
input[type="text"]{
	width: 90%;
	font-size: 15px;
    font-weight: bold;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
#name {
	padding: 30px 5px;
}
#interest {
	padding: 30px;
}
#interest1, #interest2 {
	text-align: right;
	width: 100px;
	padding: 10px;
}
#possible {
	padding: 30px;
}
#insertProduct {
	width: 300px;
	margin: 30px auto;
	padding: 8px 16px;
	color: white;
	border: none;
	border-radius: 4px;
	background-color: #00008C;
}
#getlist {
	margin: 30px auto;
	color: #00008C;
	text-decoration: none;
}
</style>
<script>
	function checkForm() {
		if (confirm("상품을 등록하시겠습니까?")) {
			return true
		} else {
			return false
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp" />
	</header>
	<section>
		<div class="container">
		<div id="menu">
			<h1>상품등록</h1>
		</div>
			<a href="${ pageContext.request.contextPath }/main.do">
				<img src="${ pageContext.request.contextPath }/images/logo3.png" alt="Bank 로고" class="logo-img">
			</a>
			<form action="${ pageContext.request.contextPath }/insertProductProcess.do" method="post" onsubmit="return checkForm()">
				<table border="1" class="getproduct">
					<tr>
						<td>상품명</td>
						<td id="name">
							<input type="text" name="name" />
						</td>
					</tr>
					<tr>
						<td>이자율</td>
						<td id="interest">
							<select name="interest1" id="interest1">
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
							</select> .
							<select name="interest2" id="interest2">
								<option>0</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
							</select> %
						</td>
					</tr>
					<tr>
						<td>개설가능여부</td>
						<td id="possible">
							<input type="radio" name="possible" value="1" checked="checked">개설가능&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="possible" value="0">개설불가능
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="등록" id="insertProduct" /></td>
					</tr>
				</table>
			</form>
			<a href="${ pageContext.request.contextPath }/product.do"
				id="getlist">목록으로</a>
		</div>
	</section>
	<footer>
		<jsp:include page="../bottomMenu.jsp" />
	</footer>
</body>
</html>