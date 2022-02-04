<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>** 아이디 찾기 **</title>
<script type="text/javascript">

</script>
</head>
<body>
<div class="container">
	<h4 class="mb-3">아이디 찾기</h4>
	<form action="findid" method="post">
		<div class="col-md-6 mb-3">
			<label for="user_name">이름</label>
			<input type="text" class="form-control" id="user_name" name="user_name">
		</div>
		<div class="col-md-6 mb-3">
			<label for="user_email">이메일 주소</label>
			<input type="text" class="form-control" id="user_email" name="user_email" placeholder="id@email.com">
		</div>	
		<button type="submit" class="btn btn-primary">아이디 찾기</button>
		<button type="button" class="btn btn-primary" onclick="location.href='login'">돌아가기</button>
	</form>
</div>
</body>
</html>