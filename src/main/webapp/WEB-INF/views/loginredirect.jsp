<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL import 하기 (core) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>redirect msg</title>
</head>
<body>
<script>
alert('${msg}');
location.href='<c:out value="${pageContext.request.contextPath}"/>${url}';
</script>
</body>
</html>