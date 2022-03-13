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
<title>** 아이디 찾기 **</title>
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
	
	.form-signin input[id="user_name"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}

	.form-signin input[id="user_id"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	
	.form-signin input[id="user_email"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
</style>
</head>
<body class="text-center">
	<main class="form-signin">
		<h1 class="h3 mb-3 fw-normal">아이디 찾기</h1>
		<form action="findid" method="post">
			<div class="form-floating">
				<input type="text" class="form-control" id="user_name" name="user_name">
				<label for="user_name">이름</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="user_email" name="user_email">
				<label for="user_email">이메일 주소</label>
			</div>	
			<button type="submit" class="btn btn-outline-warning">아이디 찾기</button>
		</form>
		
		<hr>
		
		<h1 class="h3 mb-3 fw-normal">비밀번호 찾기</h1>
		<form action="findpwd" method="post">
			<div class="form-floating">
				<input type="text" class="form-control" id="user_id" name="user_id">
				<label for="user_id">아이디</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="user_email" name="user_email">
				<label for="user_email">이메일 주소</label>
			</div>	
			<button type="submit" class="btn btn-outline-warning">비밀번호 찾기</button>
		</form>
		
		<hr>
		
		<button type="button" class="btn btn-outline-primary" onclick="location.href='login'">로그인 페이지로</button>
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='index.jsp'">메인페이지로</button>
		
	</main>
</body>
</html>