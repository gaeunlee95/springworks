<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../resources/css/style.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<header>
	<div id="logo">
		<h1><a href="/">Khit</a></h1>
	</div>
	<nav>
		<c:choose>
			<c:when test="${empty sessionId}">
				<ul id="topMenu">
					<li><a href="/user/login">로그인</a></li>
					<li><a href="/user/join">회원가입</a></li>
					<li><a href="/user/">회원목록</a></li>
					<li><a href="/board/">글목록</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul id="topMenu">
					<li><a href="/user/logout">${sessionId}님 로그아웃</a></li>
					<li><a href="/user/update">나의정보</a></li>
					<li><a href="/user/">회원목록</a></li>
					<li><a href="/board/">글목록</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
		
	</nav>
</header>