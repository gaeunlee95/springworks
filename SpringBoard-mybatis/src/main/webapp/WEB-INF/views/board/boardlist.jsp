<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<div id="container">
	<h1>글목록</h1>
		<table>
			<thead>
				<tr>
					<th>글번호</th><th>글제목</th><th>글쓴이</th><th>조회수</th><th>작성일</th>
				</tr>
			</thead>
			<c:forEach items="${boardList}" var="board">
				<tr>
					<td>${board.id}</td>
					<td><a href="/board?id=${board.id}">${board.boardTitle}</a></td>
					<td>${board.userId}</td>
					<td>${board.hit}</td>
					<td>
						<c:choose>
							<c:when test="${not empty board.updatedTime}">
								<fmt:formatDate value="${board.updatedTime}"
									pattern="yyyy-MM-dd HH:mm:ss"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${board.createdTime}"
									pattern="yyyy-MM-dd HH:mm:ss"/>
							</c:otherwise>	
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 글쓰기 버튼 -->
		<div>
			<a href="/board/write"><button>글쓰기</button></a>
		</div>
		
	</div>
	<jsp:include page="../layout/footer.jsp" />
</body>
</html>