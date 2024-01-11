<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<style>
*{resize: none;}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div id="container">
	<h1>글 수정</h1>
		<form action="/board/update" method="post"> 
			<input type="hidden" name="id" value="${board.id}">
			<table>
				<tr>
				<td>
					<input type="text" name="boardTitle"
						value="${board.boardTitle}" >
				</td>
			</tr>
				<tr>
				<td>
					<input type="text" name="boardUserId"
						value="${board.userId}" readonly>
				</td>
			</tr>
			<tr>
				<td>
					<textarea rows="5" cols="60" 
						name="boardContent">${board.boardContent}</textarea>
				</td>
			</tr>
			<tr>
				<td>
					조회수: ${board.hit}
				</td>
			</tr>
			<tr>
				<td>
					작성일: <fmt:formatDate value="${board.createdTime}"
							pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
			</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>