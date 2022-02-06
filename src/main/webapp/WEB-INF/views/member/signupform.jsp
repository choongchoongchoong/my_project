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
<title>** 회원가입 페이지 **</title>
<style>
/* 입력 유효성 검사 */
.input_check_id{
	display: none;
}
.input_check_pwd{
	display: none;
}
.input_check_pwdck{
	display: none;
}
.input_check_name{
	display: none;
}
.input_check_birth{
	display: none;
}
.input_check_email{
	display: none;
}
.input_check_address{
	display: none;
}
.input_check_tel{
	display: none;
}

/* 비밀번호 확인 일치 유효성 검사 */
.pwdck_input_same{
	display: none;
}
.pwdck_input_diff{
	display: none;
}
</style>

<script type="text/javascript">
/* 유효성 검사 통과유무 변수 */
var idCheck = false;      //아이디
var idckCheck = false;    //아이디 중복 체크
var pwdCheck = false;     //비밀번호
var pwdckCheck = false;   //비밀번호 확인
var pwdSameCheck = false; //비밀번호 확인 일치 체크
var nameCheck = false;    //이름
var birthCheck = false;   //생년월일
var emailCheck = false;   //이메일
var addressCheck = false; //주소
var telCheck = false;     //전화번호

/* 회원가입 처리 */
$(document).ready(function(){
	//회원등록 버튼
    $("#submitBtn").click(function(){

		/* 아이디 입력 유효성 검사 */
		if(user_id.value == ""){
		    $('.input_check_id').css('display', 'block');
		    idCheck = false;
		}else{
		    $('.input_check_id').css('display', 'none');
		    idCheck = true;
		}
		/* 비밀번호 입력 유효성 검사 */
		if(user_pwd.value == ""){
		    $('.input_check_pwd').css('display', 'block');
		    pwdCheck = false;
		}else{
		    $('.input_check_pwd').css('display', 'none');
		    pwdCheck = true;
		}
		/* 비밀번호 확인 입력 유효성 검사 */
		if(user_pwdck.value == ""){
		    $('.input_check_pwdck').css('display', 'block');
		    pwdckCheck = false;
		}else{
		    $('.input_check_pwdck').css('display', 'none');
		    pwdckCheck = true;
		}
		/* 성명 입력 유효성 검사 */
		if(user_name.value == ""){
		    $('.input_check_name').css('display', 'block');
		    nameCheck = false;
		}else{
		    $('.input_check_name').css('display', 'none');
		    nameCheck = true;
		}
		/* 생년월일 입력 유효성 검사 */
		if(user_birth.value == ""){
		    $('.input_check_birth').css('display', 'block');
		    birthCheck = false;
		}else{
		    $('.input_check_birth').css('display', 'none');
		    birthCheck = true;
		}
		/* 이메일 입력 유효성 검사 */
		if(user_email.value == ""){
		    $('.input_check_email').css('display', 'block');
		    emailCheck = false;
		}else{
		    $('.input_check_email').css('display', 'none');
		    emailCheck = true;
		}
		/* 주소 입력 유효성 검사 */
		if(user_address.value == ""){
		    $('.input_check_address').css('display', 'block');
		    addressCheck = false;
		}else{
		    $('.input_check_address').css('display', 'none');
		    addressCheck = true;
		}
		/* 전화번호 입력 유효성 검사 */
		if(user_tel.value == ""){
		    $('.input_check_tel').css('display', 'block');
		    telCheck = false;
		}else{
		    $('.input_check_tel').css('display', 'none');
		    telCheck = true;
		}
		
		/* 회원등록 */
		if(idCheck && pwdCheck && pwdckCheck && pwdSameCheck && nameCheck && 
				birthCheck && emailCheck && addressCheck && telCheck && 
				$('#idChk').val() == "Y"){
			if(confirm("회원가입 하시겠습니까?")) {
				$("#signup_form").attr("action", "insertMember");
		        $("#signup_form").submit(); 
			}
		}else if(pwdSameCheck == false){
			alert("비밀번호를 다시 한 번 확인해주세요.");
		}else if($('#idChk').val() == "N"){
			alert("아이디 중복 확인을 해주세요.");
		}else{
			alert("입력하지 않은 항목이 있습니다.");
		}
		
    });
});

/* 아이디 중복체크 처리 */
function fn_checkid(){
	$.ajax({
		url : "checkid",
		type : "POST",
		dataType : "json",
		data : {"user_id" : $("#user_id").val()},   
		success : function(data){
			if(data == 1){
				alert("이미 등록된 아이디입니다. 다른 아이디를 입력해주세요.");
			}else if(data == 0){
				$("#idChk").attr("value", "Y");
				alert("사용 가능한 아이디입니다.");
			}
		},
		error: function() {
			alert("에러 발생");
		}
	});
};


/* //아이디의 유효성 여부
let isIdValid = false;
$("#user_id").on("input", function(){
	let inputId = $("#user_id").val();  //입력한 아이디를 읽어와서
	//ajax 요청으로 서버에 보내서 사용 가능한지 응답받는다.
	$.ajax({
		url:"checkid.jsp",
		method:"get",
		data:"inputId="+inputId,
		success:function(responseData){
			//일단 validation 두개의 클래스를 삭제
			$("#user_id").removeClass("is-valid is-invalid");
			if(responseData.canUse){  //사용 가능한 아이디
				$("#user_id").addClass("is-valid");
				isIdValid = true;
			}else{  //사용 불가능한 아이디
				$("#user_id").addClass("is-invalid");
				isIdValid = false;
			}
			setButtonState();
		}
	});
}); */

</script>
</head>
<body>
	<div class="container">
		<h4 class="mb-3">회원가입</h4>
		<form method="post" name="frm" id="signup_form">
			<div class="col-md-6 mb-3">
			  <label for="user_id">아이디</label>
			  <input type="text" class="user_id_input form-control" id="user_id" name="user_id" placeholder="영문, 숫자로 입력해주세요.">
			  <button type="button" id="idChk" onclick="fn_checkid();" value="N">중복확인</button>
			  <div class="input_check_id invalid-feedback">아이디를 입력해주세요.</div>
			<div class="valid-feedback">사용 가능한 아이디입니다.</div>
			<div class="invalid-feedback">사용 불가능한 아이디입니다.</div>
			</div>
			
			<div class="col-md-6 mb-3">
			<label for="user_pwd">비밀번호</label>
			<input type="password" class="user_pwd_input form-control" id="user_pwd" name="user_pwd" placeholder="영문, 숫자, 특수문자를 포함한 8~16자리" value="">
			<div class="input_check_pwd invalid-feedback">비밀번호를 입력해주세요.</div>
			</div>
		
			<div class="col-md-6 mb-3">
			<label for="user_pwdck">비밀번호 확인</label>
			<input type="password" class="user_pwdck_input form-control" id="user_pwdck" name="user_pwdck" placeholder="한 번 더 입력해주세요." value="">
			<div class="input_check_pwdck invalid-feedback">비밀번호를 한 번 더 입력해주세요.</div>
			<div class="pwdck_input_same valid-feedback">비밀번호가 일치합니다.</div>
			<div class="pwdck_input_diff invalid-feedback">비밀번호가 일치하지 않습니다.</div>
			</div>
		
			<div class="col-md-6 mb-3">
			<label for="user_name">성명</label>
			<input type="text" class="user_name_input form-control" id="user_name" name="user_name" placeholder="">
			<div class="input_check_name invalid-feedback">성명을 입력해주세요.</div>
			</div>
		
			<div class="col-md-8 mb-3">
			<label for="user_sex">성별</label>
			<label><input type="radio" name="user_sex" value="male" checked="checked">남성</label>
			<label><input type="radio" name="user_sex" value="female">여성</label>
			</div>
		
			<div class="col-md-6 mb-3">
			<label for="user_birth">생년월일</label>
			<input type="text" class="user_birth_input form-control" id="user_birth" name="user_birth">
			<div class="input_check_birth invalid-feedback">생년월일을 선택해주세요.</div>
			</div>
		
		<div class="col-md-6 mb-3">
		<label for="user_email">이메일</label>
		<input type="text" class="user_email_input form-control" id="user_email" name="user_email" placeholder="id@email.com">
		<div class="input_check_email invalid-feedback">이메일을 입력해주세요.</div>
		</div>
		
		
		<label for="user_address">주소</label>
		<input type="text" class="user_adress_input form-control" id="user_address" name="user_address">
		<div class="input_check_address invalid-feedback">주소를 입력해주세요.</div>
		
		
		<label for="user_tel">전화번호</label>
		<input type="text" class="user_tel_input form-control" id="user_tel" name="user_tel" placeholder="하이픈(-)없이 입력해주세요.">
		<div class="input_check_tel invalid-feedback">전화번호를 입력해주세요.</div>
		
		<input type="button" class="btn btn-primary" value="등록" id="submitBtn">
		<button type="button" class="btn btn-primary" onclick="location.href='login'">돌아가기</button>
		</form>
	</div>
	
	
<script>
/* 비밀번호 일치 확인 유효성 검사 처리 */
$('.user_pwdck_input').on("propertychange change keyup paste input", function(){
	
	$('.input_check_pwdck').css('display', 'none');
	
	if(user_pwd.value == user_pwdck.value){
		$('.pwdck_input_same').css('display', 'block');
		$('.pwdck_input_diff').css('display', 'none');
		pwdSameCheck = true;
	}else{
		$('.pwdck_input_same').css('display', 'none');
		$('.pwdck_input_diff').css('display', 'block');
		pwdSameCheck = false;
	}
});
</script>	

</body>
</html>