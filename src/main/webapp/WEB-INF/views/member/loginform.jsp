<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>** 로그인 페이지 **</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "logout";
		})

		$("#registerBtn").on("click", function() {
			location.href = "signup";
		})

		$("#findIdBtn").on("click", function() {
			location.href = "findpwd";
		})

		$("#findPwdBtn").on("click", function() {
			location.href = "findpwd";
		})
	})
</script>
</head>
<body>
	<div class="container">
		<h4 class="mb-3">로그인</h4>
		<form action="login" method="post">
			<div class="col-md-6 mb-3">
				<label for="user_id">아이디</label>
				<input type="text" class="form-control" id="user_id" name="user_id">
			</div>
			<div class="col-md-6 mb-3">
				<label for="user_pwd">비밀번호</label>
				<input type="password" class="form-control" id="user_pwd" name="user_pwd">
			</div>	
			<button type="submit" class="btn btn-primary">로그인</button>
			<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
			<button type="button" class="btn btn-primary" id="findIdBtn">아이디 찾기</button>
			<button type="button" class="btn btn-primary" id="findPwdBtn">비밀번호 찾기</button>
		</form>
	</div>
</body>
</html>