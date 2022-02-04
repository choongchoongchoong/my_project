<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>** 회원가입 페이지 **</title>
<script type="text/javascript">
//회원가입 버튼
window.onload = function() {
	let btnIns = document.querySelector("#submitBtn");
	btnIns.addEventListener("click", dataCheck);
}
function dataCheck() {
	if (frm.user_id.value === "" || frm.user_pwd.value === "") {
		alert("입력하지 않은 항목이 있습니다."); 
		return;
	}

	if (confirm("회원가입 하시겠습니까?")) {
		
		frm.submit();
	}
}
</script>
</head>
<body>
	<div class="container">
		<h4 class="mb-3">회원가입</h4>
		<form action="insertMember" method="post" name="frm">
			<div class="col-md-6 mb-3">
			<label for="user_id">아이디</label>
			<input type="text" class="user_id_input form-control" id="user_id" name="user_id" placeholder="영문, 숫자로 입력해주세요.">
			<div class="valid-feedback">사용 가능한 아이디입니다.</div>
			<div class="invalid-feedback">사용 불가능한 아이디입니다.</div>
			</div>
			
			<div class="col-md-6 mb-3">
			<label for="user_pwd">비밀번호</label>
			<input type="password" class="user_pwd_input form-control" id="user_pwd" name="user_pwd" placeholder="영문, 숫자, 특수문자를 포함한 8~16자리">
			</div>
		
			<div class="col-md-6 mb-3">
			<label for="user_pwdck">비밀번호 확인</label>
			<input type="password" class="user_pwdck_input form-control" id="user_pwdck" name="user_pwdck" placeholder="">
			</div>
		
			<div class="col-md-6 mb-3">
			<label for="user_name">성명</label>
			<input type="text" class="user_name_input form-control" id="user_name" name="user_name" placeholder="">
			</div>
		
			<div class="col-md-8 mb-3">
			<label for="user_sex">성별</label>
			<label><input type="radio" name="user_sex" value="male">남성</label>
			<label><input type="radio" name="user_sex" value="female">여성</label>
			</div>
		
			<div class="col-md-6 mb-3">
			<label for="user_birth">생년월일</label>
			<input type="text" class="user_birth_input form-control" id="user_birth" name="user_birth">
			</div>
		
		<div class="col-md-6 mb-3">
		<label for="user_email">이메일</label>
		<input type="text" class="user_email_input form-control" id="user_email" name="user_email" placeholder="id@email.com">
		</div>
		
		
		<label for="user_address">주소</label>
		<input type="text" class="user_adress_input form-control" id="user_address" name="user_address">
		
		<label for="user_tel">전화번호</label>
		<input type="text" class="user_tel_input form-control" id="user_tel" name="user_tel" placeholder="하이픈(-)없이 입력해주세요.">
		
		<input type="button" class="btn btn-primary" value="등록" id="submitBtn">
		</form>
	</div>
</body>
</html>