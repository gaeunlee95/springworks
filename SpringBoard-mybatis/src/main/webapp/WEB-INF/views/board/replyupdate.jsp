<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
<style>
*{resize: none;}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div id="container">
		<section id="replyupdate">
		<h1>댓글 수정</h1>
			<form action="/reply/update" method="post"> 
				<input type="hidden" name="boardId" value="${reply.boardId}">
				<input type="hidden" name="id" value="${reply.id}">
				<p>
					
					<textarea rows="3" cols="50" name="replyContent">${reply.replyContent}</textarea>
				
				</p>
				<p>
					<input type="submit" value="수정하기">
					<input type="reset" value="취소하기">
				</p>
			</form>
		</section>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>