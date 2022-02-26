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
<!-- 우편번호 검색 -->
<script src='http://dmaps.daum.net/map_js_init/postcode.v2.js'></script>
<meta charset="UTF-8">
<title>** 회원가입 페이지 **</title>
<style>
/* 필드 입력 유효성 검사 */
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

/* 아이디 입력값 유효성 검사 */
.id_input_valid{
	display: none;
}
.id_input_invalid{
	display: none;
}

/* 비밀번호 입력값 유효성 검사 */
.pwd_input_valid{
	display: none;
}
.pwd_input_invalid{
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
var idCheck = false;       //아이디
var idckCheck = false;     //아이디 중복 체크
var idInputCheck = false;  //아이디 입력값 체크
var pwdCheck = false;      //비밀번호
var pwdInputCheck = false; //아이디 입력값 체크
var pwdckCheck = false;    //비밀번호 확인
var pwdSameCheck = false;  //비밀번호 확인 일치 체크
var nameCheck = false;     //이름
var birthCheck = false;    //생년월일
var emailCheck = false;    //이메일
var addressCheck = false;  //주소
var telCheck = false;      //전화번호

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

/* 주소 병합 처리 변수 */
var zip = $('#user_zipcode').val();
var addr1 = $('#user_address1').val();
var addr2 = $('#user_address2').val();

/* 주소 병합 처리 */
$(document).ready(function(){
	
	$("#submitBtn").click(function(){
		/* 주소값 합쳐서 저장 */
		$('#user_address').attr('value', zip + " " + addr1 + " " + addr2);
	}
};

</script>
</head>
<body>
	<div class="container">
		<h4 class="mb-3">회원가입</h4>
		<form method="post" name="frm_signup" id="signup_form">
			<div class="col-md-6 mb-3">
			  <label for="user_id">아이디</label>
			  <div>알파벳 소문자와 숫자로만 구성된 5~10자리 아이디를 입력해주세요.<br>
			  (첫글자는 알파벳이어야 합니다.)</div>
			  <input type="text" class="user_id_input form-control" id="user_id" name="user_id">
			  <button type="button" id="idChk" onclick="fn_checkid();" value="N">중복확인</button>
			  <div class="input_check_id invalid-feedback">아이디를 입력해주세요.</div>
			<div class="id_input_valid valid-feedback">사용 가능한 아이디입니다.</div>
			<div class="id_input_invalid invalid-feedback">사용 불가능한 아이디입니다.</div>
			</div>
			
			<div class="col-md-6 mb-3">
			<label for="user_pwd">비밀번호</label>
			<div>알파벳과 숫자, 특수문자를 포함한 8~16자리 비밀번호를 입력해주세요.</div>
			<input type="password" class="user_pwd_input form-control" id="user_pwd" name="user_pwd">
			<div class="input_check_pwd invalid-feedback">비밀번호를 입력해주세요.</div>
			<div class="pwd_input_valid valid-feedback">사용 가능한 비밀번호입니다.</div>
			<div class="pwd_input_invalid invalid-feedback">사용 불가능한 비밀번호입니다.</div>
			</div>
		
			<div class="col-md-6 mb-3">
			<label for="user_pwdck">비밀번호 확인</label>
			<input type="password" class="user_pwdck_input form-control" id="user_pwdck" name="user_pwdck">
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
		
		<div class="col-md-6 mb-3">
		<input type="hidden" id="user_address" name="user_address" value="">
		<label for="user_zipcode">우편번호</label>
		<input type="text" id="user_zipcode" name="user_zipcode">
		<input type="button" value="우편번호 검색" id="btnZipcode">
		<br>
		<label for="user_address">집주소</label>
		<input type="text" class="user_address_input form-control" id="user_address1" name="user_address1" placeholder="우편번호 검색으로 자동입력이 가능합니다.">
		<div class="input_check_address invalid-feedback">주소를 입력해주세요.</div>
		<label for="user_address2">상세주소</label>
		<input type="text" class="user_address2_input form-control" id="user_address2" name="user_address2" placeholder="건물명, 호수 등">
		</div>
		
		
		<label for="user_tel">전화번호</label>
		<input type="text" class="user_tel_input form-control" id="user_tel" name="user_tel" placeholder="하이픈(-)없이 입력해주세요.">
		<div class="input_check_tel invalid-feedback">전화번호를 입력해주세요.</div>
		
		<input type="button" class="btn btn-primary" value="등록" id="submitBtn">
		<button type="button" class="btn btn-primary" onclick="location.href='login'">돌아가기</button>
		</form>
	</div>
	
	
<script>
/* 아이디 입력값 유효성 검사 처리 */
$('.user_id_input').on("propertychange change keyup paste input", function(){
	
	$('.input_check_id').css('display', 'none');
	
	let inputId = user_id.value;
	let reg = /[\W]+/;  //특수문자를 찾는 정규표현식
	let reg2 = /^[a-z].{4,9}$/;  //첫글자가 소문자 알파벳, 5~10글자인지 파악하는 정규표현식
	let reg3 = /[A-Z]/;  //대문자 알파벳을 찾는 정규표현식
	
	if(reg.test(inputId) || !reg2.test(inputId) || reg3.test(inputId)){
		$('.id_input_valid').css('display', 'none');
		$('.id_input_invalid').css('display', 'block');
		idInputCheck = false;
	}else{
		$('.id_input_valid').css('display', 'block');
		$('.id_input_invalid').css('display', 'none');
		idInputCheck = true;
	}
});

/* 비밀번호 입력값 유효성 검사 처리 */
$('.user_pwd_input').on("propertychange change keyup paste input", function(){
	
	$('.input_check_pwd').css('display', 'none');
	
	let inputPwd = user_pwd.value;
	let reg = /[\W0-9a-zA-Z]+/; //특수문자를 찾는 정규표현식
	
	if(inputPwd.length < 8 || inputPwd.length > 16 || !reg.test(inputPwd)){
		$('.pwd_input_valid').css('display', 'none');
		$('.pwd_input_invalid').css('display', 'block');
		pwdInputCheck = false;
	}else{
		$('.pwd_input_valid').css('display', 'block');
		$('.pwd_input_invalid').css('display', 'none');
		pwdInputCheck = true;
	}
});

/* 비밀번호 일치 확인 유효성 검사 처리 */
$('.user_pwdck_input').on("propertychange change keyup paste input", function(){
	
	$('.user_pwd_input').on("propertychange change keyup paste input", function(){
		
		$('.input_check_pwdck').css('display', 'none');
		
		if(user_pwd.value != user_pwdck.value){
			$('.pwdck_input_same').css('display', 'none');
			$('.pwdck_input_diff').css('display', 'block');
			pwdSameCheck = false;
		}else{
			$('.pwdck_input_same').css('display', 'block');
			$('.pwdck_input_diff').css('display', 'none');
			pwdSameCheck = true;
		}
	});
	
});


/* 우편번호 검색 처리 */
var btnZipcode = document.getElementById('btnZipcode');
if(btnZipcode != null){
	btnZipcode.onclick = function(){
		var frm = document.frm_signup;
		new daum.Postcode({
			oncomplete : function(data){
				frm.user_zipcode.value = data.zonecode;
				frm.user_address1.value = data.address;
			}
		}).open();
	}
}



</script>

</body>
</html>