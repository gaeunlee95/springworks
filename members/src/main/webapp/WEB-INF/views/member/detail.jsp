<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보...</title>
<style>
	.content{margin-left: 30px;}
</style>
</head>
<body>
	<div class="content">
		<h2>회원 정보</h2>
			<p>
				<label>번호</label>
				<input type="text" name="id" value="${member.id}" readonly>
			</p>
			<p>
				<label>이메일</label>
				<input type="text" name="email" value="${member.email}" readonly>
			</p>
			<p>
				<label>비밀전호</label>
				<input type="text" name="password" value="${member.password}" readonly>
			</p>
			<p>
				<label>이름</label>
				<input type="text" name="name" value="${member.name}" readonly>
			</p>
			<p>
				<label>나이</label>
				<input type="text" name="age" value="${member.age}" readonly>
			</p>
			<p>
				<button type="button" onclick="list()">목록</button>
			</p>
	</div>
<script>
	const list = function(){
		location.href="/member/";
	};
</script>
</body>
</html>