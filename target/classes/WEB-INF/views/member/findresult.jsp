<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL import -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>** 아이디 찾기 결과 **</title>
<style>
	html,
	body {
	  height: 100%;
	}
	
	body {
	  display: flex;
	  padding-top: 10px;
	  padding-left: 10px;
	  background-color: #f5f5f5;
	}
	
	.form-signin {
	  width: 100%;
	  max-width: 380px;
	  padding: 15px;
	  margin: auto;
	}
</style>
</head>
<body class="text-center">
	<main class="form-signin">
	<c:choose>
		<c:when test="${empty id}">
			<script type="text/javascript">
				alert("가입 정보를 찾을 수 없습니다.");
				location.href = "findid";
			</script>
		</c:when>
		<c:otherwise>
			회원님의 아이디는 
			<!-- 아이디 앞 4자리까지 보여주고 -->
			${id.substring(0, 4)}
			<!-- 5자리부터 남은 id길이만큼 *를 찍어줌 -->
			<c:forEach begin="5" end="${id.length()}" step="1">*</c:forEach>
			입니다.<br>
			<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='login'">로그인 페이지로</button>
			<button type="button" class="btn btn-outline-warning btn-sm" onclick="location.href='findid'">아이디/비밀번호 찾기 페이지로</button>
		</c:otherwise>
	</c:choose>
	</main>
</body>
</html>