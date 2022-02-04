<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL import 하기 (core) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** 아이디/비밀번호 찾기 결과 **</title>
</head>
<body>
<c:choose>
	<c:when test="${empty id}">
		가입 정보를 찾을 수 없습니다.<br>
		<a href="login">돌아가기</a>
	</c:when>
	<c:otherwise>
		회원님의 아이디는 
		<!-- 아이디 앞 4자리까지 보여주고 -->
		${id.substring(0, 4)}
		<!-- 5자리부터 남은 id길이만큼 *를 찍어줌 -->
		<c:forEach begin="5" end="${id.length()}" step="1">*</c:forEach>
		입니다.<br>
		<a href="login">로그인 페이지로</a>
	</c:otherwise>
</c:choose>
</body>
</html>