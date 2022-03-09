<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>** 글쓰기 페이지 **</title>
<style>
.insert-form {
	max-width: 900px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
  
textarea {
  width: 100%;
  margin: 0;
  padding: 0;
  border-width: 0;
}
  
</style>
</head>
<body>
<div class="container">
	<div class="insert-form col-md-12 mx-auto">
	<h3 class="mb-3">게시글 등록</h3>
		<form action="boardInsert" method="post">
		<div class="col-md-6 mb-3">
			<label for="bd_title">제목</label><br>
			<input type="text" id="bd_title" name="bd_title">
		</div>

		<div class="col-md-6 mb-3">
			<label for="bd_content">내용</label>
			<textarea class="form-control" id="bd_content" name="bd_content" rows="10"></textarea><br>
		</div>
		
		<div class="mb-3" style="text-align:center;">
			<input type="submit" class="btn btn-primary" value="등록">
			<button type="button" class="btn btn-secondary" onclick="location.href='board/list'">목록으로 돌아가기</button>
		</div>
		</form>
	</div>
</div>
</body>
</html>
<%@include file="../footer.jsp" %>