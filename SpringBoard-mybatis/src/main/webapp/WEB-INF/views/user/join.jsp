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
		<form action="/user/join" method="post" name="userform"> 
			<table>
				<tr>
					<td><label>아이디</label></td>
					<td>
						<input type="text" name="userId" id="userId" placeholder="아이디" onblur="checkId()">
						<p id="check-result"></p>
					</td>
				</tr>
					<tr>
					<td><label>비밀번호</label></td>
					<td>
						<input type="password" name="userPasswd" id="userPasswd" placeholder="비밀번호" >
					</td>
				</tr>
				<tr>
					<td><label>이름</label></td>
					<td>	
						<input type="text" name="userName" id="userName" placeholder="이름" >
					</td>
				</tr>
				<tr>
					<td><label>나이</label></td>
					<td>
						<input type="text" name="userAge" id="userAge" placeholder="나이" >
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="checkUser()">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
		</section>
	</div>
	<jsp:include page="../layout/footer.jsp" />
	
	<script src="/resources/js/validation.js"></script>
	
</body>
</html>