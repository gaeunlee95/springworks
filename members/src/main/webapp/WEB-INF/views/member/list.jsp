<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록...</title>
<style>
	.content{margin-left: 30px;}
	table{border-collapse: collapse;}
	table th, td{border: 1px solid #ccc; padding: 8px;}
</style>
</head>
<body>
	<div class="content">
		<h2>회원 목록</h2>
		<div>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>이메일</th>
						<th>비밀번호</th>
						<th>이름</th>
						<th>나이</th>
						<th>조회</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${memberList}" var="member">
						<tr>
							<td>${member.id}</td>
							<td>${member.email}</td>
							<td>${member.password}</td>
							<td>${member.name}</td>
							<td>${member.age}</td>
							<td><button type="button" onclick="detail('${member.id}')">조회</button></td>
							<td><button type="button" onclick="deleteFn('${member.id}')">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		//조회 처리
		const detail = function(mid){
			location.href = "/member?id=" + mid;
		};
		//삭제 처리
		const deleteFn = function(mid) {
			if(confirm('정말로 삭제하시겠습니까')){
				location.href = "/member/delete?id=" + mid;
			}else {
				return false;
			}
				
		};
	</script>
	
</body>
</html>