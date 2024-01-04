<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div id="container">
		<h1>회원 정보</h1>
		<table>
			<tr>
				<td><label>아이디</label></td>
				<td>
					<input type="text" name="userId" value="${user.userId}" readonly>
				</td>
			</tr>
				<tr>
				<td><label>비밀번호</label></td>
				<td>
					<input type="password" name="userPasswd" value="${user.userPasswd}" readonly>
				</td>
			</tr>
			<tr>
				<td><label>이름</label></td>
				<td>	
					<input type="text" name="userName" value="${user.userName}" readonly>
				</td>
			</tr>
			<tr>
				<td><label>나이</label></td>
				<td>
					<input type="text" name="userAge" value="${user.userAge}" readonly>
				</td>
			</tr>
			<tr>
				<td>
					<!-- <button onclick="list()">목록</button> -->
					<a href="/user/"><button>목록</button></a>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../layout/footer.jsp" />
	
	<script>
		const list = function(){
			location.href="/user/";
		}
	</script>
</body>
</html>