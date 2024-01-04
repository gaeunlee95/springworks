<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div id="container">
		<section id="join">
		<h1>회원가입</h1>
		<form action="/user/join" method="post" > 
			<table>
				<tr>
					<td><label>아이디</label></td>
					<td>
						<input type="text" name="userId" placeholder="아이디" required>
					</td>
				</tr>
					<tr>
					<td><label>비밀번호</label></td>
					<td>
						<input type="password" name="userPasswd" placeholder="비밀번호" required>
					</td>
				</tr>
				<tr>
					<td><label>이름</label></td>
					<td>	
						<input type="text" name="userName" placeholder="이름" required>
					</td>
				</tr>
				<tr>
					<td><label>나이</label></td>
					<td>
						<input type="text" name="userAge" placeholder="나이" required>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
		</section>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>