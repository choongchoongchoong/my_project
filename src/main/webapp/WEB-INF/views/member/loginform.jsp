<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>** 로그인 페이지 **</title>
<style>
	html,
	body {
	  height: 100%;
	}
	
	body {
	  display: flex;
	  align-items: center;
	  padding-top: 40px;
	  padding-bottom: 40px;
	  background-color: #f5f5f5;
	}
	
	.form-signin {
	  width: 100%;
	  max-width: 380px;
	  padding: 15px;
	  margin: auto;
	}
	
	.form-signin .form-floating:focus-within {
	  z-index: 2;
	}
	
	.form-signin input[id="user_id"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	
	.form-signin input[id="user_pwd"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutBtn").on("click", function() {
			location.href = "logout";
		})

		$("#registerBtn").on("click", function() {
			location.href = "signup";
		})

		$("#findBtn").on("click", function() {
			location.href = "findid";
		})
	})
</script>

</head>

<body class="text-center">
	<main class="form-signin">
		<h1 class="h3 mb-3 fw-normal">로그인</h1>
		<form action="login" method="post">
			<div class="form-floating">
				<input type="text" class="form-control" id="user_id" name="user_id">
				<label for="user_id">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="user_pwd" name="user_pwd">
				<label class="form-label" for="user_pwd">비밀번호</label>
			</div>
			
			<button type="submit" class="w-100 mb-3 btn btn-outline-primary">로그인</button>
			<button type="button" class="w-100 btn btn-outline-primary" id="registerBtn">회원가입</button>
			<hr>
			<button type="button" class="btn btn-outline-warning" id="findBtn">아이디/비밀번호 찾기</button>
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='index.jsp'">메인 페이지로</button>
		</form>
	</main>
</body>
</html>