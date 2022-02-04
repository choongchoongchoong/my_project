<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>** 게시판 **</title>
</head>
<body>
<div class="container">
<h3>자유게시판</h3>
<a href="insert">글쓰기</a>
<table class="table table-stripted">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>등록일</th>
		<th>조회수</th>
	</tr>
	<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.bd_no }</td>
		<td>${list.bd_title }</td>
		<td>${list.bd_id }</td>
		<td>${list.bd_date }</td>
		<td>${list.bd_readcnt }</td>
	</tr>
	</c:forEach>
	<!-- 검색 -->
	<tr>
		<td colspan="5">
			<form action="search" method="post">
			검색 : <input type="text" name="searchValue">
			<input type="submit" value="검색">
			</form>
		</td>
	</tr>
</table>
</div>
</body>
</html>