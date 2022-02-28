<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL import 하기 (core) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>** 메인 페이지 **</title>
</head>
<body>
메인 페이지<p/>
<c:choose>
	<c:when test="${loginSession == null }">
		<a href="login">로그인</a>
	</c:when>
	<c:otherwise>
		<a href="logout">로그아웃</a>
		<a href="mypage">마이 페이지</a>
	</c:otherwise>
</c:choose>

<a href="board/list">커뮤니티</a>
<a href="selling">상품등록</a>
<a href="selling/list">판매목록</a>






</body>
</html>