<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<style>
*{resize: none;}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp" />
	<div id="container">
	<section id="detail">
		<h1>글 상세보기</h1>
			<table>
				<tr>
					<td>
						<input type="text" name="boardTitle"
							value="${board.boardTitle}" readonly>
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
						<textarea rows="5" cols="60" readonly
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
						<!-- 수정일이 있는 경우 수정일 표시, 없는 경우 작성일 표시 -->
						<c:choose>
							<c:when test="${not empty board.updatedTime}">
								수정일: <fmt:formatDate value="${board.updatedTime}"
									pattern="yyyy-MM-dd HH:mm:ss"/>
								작성일: <fmt:formatDate value="${board.createdTime}"
									pattern="yyyy-MM-dd HH:mm:ss"/>
							</c:when>
							<c:otherwise>
								작성일: <fmt:formatDate value="${board.createdTime}"
									pattern="yyyy-MM-dd HH:mm:ss"/>
							</c:otherwise>	
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>
						<c:if test="${sessionId eq board.userId}">
							<a href="/board/update?id=${board.id}">
								<button>수정</button>
							</a>
							<a href="/board/delete?id=${board.id}"
								onclick="return confirm('정말로 삭제하시겠습니까?')">
								<button>삭제</button>
							</a>
						</c:if>
						<a href="/board/paging?page=${page}"><button>목록</button></a>
					</td>
				</tr>
			</table>
			<!-- 댓글 목록 -->
			<div id="reply-list">
				<c:forEach items="${replyList}" var="reply">
					<div class="reply">
						<p>${reply.replyContent}</p>
						<p>
						 	<c:choose>
								<c:when test="${not empty reply.updatedTime}">
									작성자: ${reply.replyer} (수정일:  <fmt:formatDate value="${reply.updatedTime}"
										pattern="yyyy-MM-dd HH:mm:ss"/>)
								</c:when>
								<c:otherwise>
									작성자: ${reply.replyer} (작성일:  <fmt:formatDate value="${reply.createdTime}"
										pattern="yyyy-MM-dd HH:mm:ss"/>)
								</c:otherwise>	
							</c:choose>
							
						<p>
							<c:choose>
								<c:when test="${reply.replyer eq sessionId}">
									<a href="/reply/update?boardId=${board.id}&id=${reply.id}">수정</a> |
									<a href="/reply/delete?boardId=${board.id}&id=${reply.id}"
										onclick="return confirm('정말로 삭제하시겠습니까?')">삭제</a>
								</c:when>
								<c:otherwise>
										
								</c:otherwise>			
							</c:choose>
						</p>
					</div>
				</c:forEach>
			</div>
			<c:choose>
				<c:when test="${not empty sessionId}">
					<!-- 댓글 등록 -->
					<form action="/reply/insert" method="post" name="replyform" style="border: 1px solid black; padding: 10px;">
						<input type="hidden" name="boardId" id="boardId" value="${board.id}">
						<p><input type="text" name="replyer" id="replyer" placeholder="작성자" value="${sessionId}" readonly style="width: 100%;"></p> <!-- 작성자 -->
						<p><textarea rows="3" cols="50" name="replyContent" placeholder="댓글을 남겨주세요" style="width: 100%; margin-top: 5px;"></textarea></p>
						<button type="button" onclick="replyInsert()" style="padding: 2px 5px;">등록</button>
					</form>
				</c:when>
				<c:otherwise>
					<!-- 댓글 등록 로그인 이동 -->
					<div class="replyLogin">
						<a href="/user/login">
							<i class="fa-regular fa-user"></i>&nbsp;로그인한 사용자만 댓글 등록이 가능합니다.
						</a>
					</div>
				</c:otherwise>
			</c:choose>
		</section>
	</div>
	<jsp:include page="../layout/footer.jsp" />
	
	<script>
		const replyInsert = function() {
			//alert('test');
			//댓글 등록이 비어있으면 "댓글을 입력해주세요"
			let form = document.replyform;
			let boardId = "${board.id}";
			let replyer = form.replyer.value;
			let content = form.replyContent.value;
			
			if(content == ""){
				alert("댓글을 입력해주세요");
				form.replyContent.focus();
				return false;
			}
			
			//ajax 구현
			$.ajax({
				//요청 방식: POST, 요청주소: /reply/insert
				type: "POST",
				url: "/reply/insert",
				data: {
					boardId: boardId,
					replyer: replyer,
					replyContent: content
				},
				success: function(replyList){
					console.log("댓글 등록 성공")
					console.log(replyList);
					//댓글 목록
					let output = "";
					//for...in 루프: 배열의 '인덱스'를 순회
					//for...of 루프: 배열의 '요소'를 직접 순회
					
					/*for(let i in replylist){
						output += "<div class='reply'>";
						output += "<p>" + replyList[i].replyContent + "</p>"
						output += "<p>작성자: " + replyList[i].replyer + ""
						output += "작성일: " + replyList[i].createdTime + ")</p>"
						output += "</div>";
					}*/
					//reply: 배열의 각 요소(ReplyDTO 객체)
					for (let reply of replyList) {
					        output += "<div class='reply'>";
					        output += "<p>" + reply.replyContent + "</p>";
					        output += "<p>작성자: " + reply.replyer;
					        output += " (작성일: " + reply.createdTime + ")</p>";
					        //output += " (작성일: " + new Date(reply.createdTime).toLocaleString() + ")</p>";
					         if (reply.replyer === "${sessionId}") {
					           output += "<p><a href='/reply/update?boardId=" + boardId + "&id=" + reply.id + "'>수정</a> | ";
					           output += "<a href='/reply/delete?boardId=" + boardId + "&id=" + reply.id + "' onclick='return confirm(\"정말로 삭제하시겠습니까?\")'>삭제</a></p>";
					        }   
					        output += "</div>";
					         
					}
					document.getElementById("reply-list").innerHTML = output;
					document.getElementById("replyContent").value = "";	//댓글 내용 초기화
				},
				
				error: function(){
					console.lof("댓글 등록 실패")
				}
			});
		}
	</script>
</body>
</html>