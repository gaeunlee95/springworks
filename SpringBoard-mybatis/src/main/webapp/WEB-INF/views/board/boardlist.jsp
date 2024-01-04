<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<style>
*{resize: none;}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div id="content">
	<h1>글목록</h1>
		<table>
			<thead>
				<tr>
					<th>글번호</th><th>글제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th>
				</tr>
			</thead>
			<c:forEach items="${boardlist}" var="board">
				<tr>
					<td>${board.id}</td>
					<td><a href="/board?id=${board.id}">${board.boardTitle}</a></td>
					<td>${board.userId}</td>
					<td>${board.createdTime}</td>
					<td>${board.hit}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>