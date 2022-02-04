<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 글 수정 페이지 **</title>
</head>
<body>
<h3>글 수정 페이지</h3>
<form action="update" method="post">
번호 : ${dto.num }<br>
<input type="hidden" name="num" value="${dto.num }">
이름 : <input type="text" name="name" value="${dto.name }"><br>
주소 : <input type="text" name="addr" value="${dto.addr }"><br>
<br>
<input type="submit" value="수정">
</form>
</body>
</html>