<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div id="container">
		<h1>회원 수정</h1>
		<form action="/user/update" method="post">
			<input type ="hidden" name="id" value="${user.id}">
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
						<input type="password" name="userPasswd" value="${user.userPasswd}" >
					</td>
				</tr>
				<tr>
					<td><label>이름</label></td>
					<td>	
						<input type="text" name="userName" value="${user.userName}" >
					</td>
				</tr>
				<tr>
					<td><label>나이</label></td>
					<td>
						<input type="text" name="userAge" value="${user.userAge}" >
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit">수정</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp" />
	
	<script>
		const list = function(){
			location.href="/user/";
		}
	</script>
</body>
</html>