<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Todo 목록...</title>
</head>
<body>
  <div class="container-fluid">
     <jsp:include page="../layout/header.jsp" />
     <!-- 검색 영역 -->
     <div class="row content">
       <div class="col">
         <div class="card">
           <div class="card-body">
				<h5 class="card-title">Search</h5>
				<form action="/todo/paging" method="get">
				  <div class="mb-3">
				    <!-- ? 'checked' : "" 는 상함 연산자 -> 
				    	checkType("t")의 결과가 true일 경우 'checked' 문자열 반환,
				      	false일 경우, 빈문자열 ""을 반환	-->
				    <input type="checkbox" name="types" value="t" 
				    	${pageRequestDTO.checkType("t") ? 'checked' : ""} >제목  <!-- JSP(Java Server Pages)의 Expression Language(EL)를 사용한 조건부 표현식 -->
				    <input type="checkbox" name="types" value="w" 
				    	${pageRequestDTO.checkType("w") ? 'checked' : ""} >작성자
				    <input type="text" name="keyword" class="form-control"
				    	value="${pageRequestDTO.keyword}">
				  </div>
				  <div class="mb-3">
				    <div class="float-end">
				    	<button type="submit" class="btn btn-primary">Search</button>
				    	<button type="reset" class="btn btn-info btnClear">Clear</button>
				    </div>
				  </div>
				</form>
			</div>
		 </div>
	   </div>
	 </div>
     
     <!-- 본문 영역 -->
     <div class="row content">
       <div class="col">
         <div class="card">
           <div class="card-body">
				<h5 class="card-title">Todo 목록</h5>
				<table class="table">
				  <thead>
				    <tr>
				    	<th>번호</th><th>제목</th><th>작성자</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach items="${responseDTO.dtoList}" var="todo">
				     <tr>
				     	<td>${todo.tno}</td>
				     	<td><a href="/todo?tno=${todo.tno}&page=${responseDTO.page}">${todo.title}</a></td>
				     	<td>${todo.writer}</td>
				     </tr>
				    </c:forEach>
				  </tbody>
				</table>
				
				<!-- 페이징 처리 -->
				<div class="d-flex justify-content-center">
					<ul class="pagination flex-wrap">
					    <!-- 이전 페이지 -->
					    <c:if test="${responseDTO.prev}">
					    	<li class="page-item">
					    		<a class="page-link" 
					    			href="/todo/paging?page=${responseDTO.startPage - 1}">Previous</a>
					    	</li>
					    </c:if>
					
						<!-- 페이지 번호 -->
						<c:forEach var="num" begin="${responseDTO.startPage}" end="${responseDTO.endPage}">
							<li class="page-item ${responseDTO.page eq num ? 'active' : ''}">
								<a href="/todo/paging?page=${num}" class="page-link">${num}</a>
							</li>
						</c:forEach>
						
						<!-- 다음 페이지 -->
					    <c:if test="${responseDTO.next}">
					    	<li class="page-item">
					    		<a class="page-link" 
					    			href="/todo/paging?page=${responseDTO.endPage + 1}">Next</a>
					    	</li>
					    </c:if>
					</ul>
				</div>
			 </div>
		   </div>
		</div>
	  </div> <!-- 본문 영역 닫기 -->
	<jsp:include page="../layout/footer.jsp" />
  </div>
  <script>
  	//검색 조건 초기화
  	let btnClear = document.querySelector(".btnClear");
  	
  	btnClear.addEventListener("click", function(){
  		location.href = "/todo/paging";
  	})
  </script>
</body>
</html>