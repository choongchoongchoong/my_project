<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!-- JSTL import -->
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
<h3>공지사항</h3>
	<table class="table table-stripted">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="list" items="${boardlist }">
		<tr>
			<td>${list.bd_no }</td>
			<td width="50%"><a href="detail?bd_no=${list.bd_no }">${list.bd_title }</a></td>
			<td>운영자</td>
			<td>${list.bd_regdate }</td>
			<td>${list.bd_readcnt }</td>
		</tr>
		</c:forEach>
		
		<!-- 검색 -->
		<tr>
			<td colspan="5">
				<form action="${pageContext.request.contextPath}/board/boardSearch" method="post">
					<select name="searchName">
						<option value="bd_title" selected="selected">제목</option>
						<option value="bd_content">내용</option>
						<option value="bd_title || bd_content">제목+내용</option>
					</select>
					<input type="text" name="searchValue">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
	<div style="float:right;">
		<c:if test="${loginSession.user_auth == '1' }">
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/boardInsert">글쓰기</a>
		</c:if>
	</div>
</div>
</body>
</html>