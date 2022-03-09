<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!-- JSTL import -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>** 판매글 수정 페이지 **</title>
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

/* 상품가격 증감 화살표 삭제 */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

</style>
</head>
<body>
<div class="container">
	<div class="insert-form col-md-12 mx-auto">
	<h3 class="mb-3">판매글 수정</h3>
		<form action="sellingUpdate" method="post">
		<input type="hidden" name="se_no" id="se_no" value="${data.se_no }">
		<div class="col-md-6 mb-3">
			<label for="se_title">제목</label><br>
			<input type="text" id="se_title" name="se_title" value="${data.se_title }">
		</div>

		<div class="col-md-6 mb-3">
			<label for="se_content">내용</label>
			<textarea class="form-control" id="se_content" name="se_content" rows="10">${data.se_content }</textarea><br>
		</div>
		
		<div class="col-md-6 mb-3">
			<label for="se_cat">카테고리</label>
			<select class="form-select" id="se_cat" name="se_cat">
				<option value="여성패션" <c:if test ="${data.se_cat eq '여성패션'}">selected="selected"</c:if>>여성패션</option>
				<option value="남성패션" <c:if test ="${data.se_cat eq '남성패션'}">selected="selected"</c:if>>남성패션</option>
				<option value="뷰티/미용" <c:if test ="${data.se_cat eq '뷰티/미용'}">selected="selected"</c:if>>뷰티/미용</option>
				<option value="디지털기기/가전" <c:if test ="${data.se_cat eq '디지털기기/가전'}">selected="selected"</c:if>>전자기기/가전</option>
				<option value="가구/인테리어" <c:if test ="${data.se_cat eq '가구/인테리어'}">selected="selected"</c:if>>가구/인테리어</option>
				<option value="생활잡화" <c:if test ="${data.se_cat eq '생활잡화'}">selected="selected"</c:if>>생활잡화</option>
				<option value="취미" <c:if test ="${data.se_cat eq '취미'}">selected="selected"</c:if>>취미</option>
				<option value="식품" <c:if test ="${data.se_cat eq '식품'}">selected="selected"</c:if>>식품</option>
				<option value="유아동용품" <c:if test ="${data.se_cat eq '유아동용품'}">selected="selected"</c:if>>유아동용품</option>
				<option value="반려동물용품" <c:if test ="${data.se_cat eq '반려동물용품'}">selected="selected"</c:if>>반려동물용품</option>
				<option value="기타" <c:if test ="${data.se_cat eq '기타'}">selected="selected"</c:if>>기타</option>
			</select>
		</div>
		
		<div class="col-md-6 mb-3">
			<label for="se_state">상품상태</label>
			<select class="form-select" id="se_state" name="se_state">
				<option value="새상품/미개봉" <c:if test ="${data.se_state eq '새상품/미개봉'}">selected="selected"</c:if>>새상품/미개봉</option>
				<option value="새상품에 가까움" <c:if test ="${data.se_state eq '새상품에 가까움'}">selected="selected"</c:if>>새상품에 가까움</option>
				<option value="눈에 띄는 오염 없음" <c:if test ="${data.se_state eq '눈에 띄는 오염 없음'}">selected="selected"</c:if>>눈에 띄는 오염 없음</option>
				<option value="약간의 사용감 있음" <c:if test ="${data.se_state eq '약간의 사용감 있음'}">selected="selected"</c:if>>약간의 사용감 있음</option>
				<option value="오염 있음" <c:if test ="${data.se_state eq '오염 있음'}">selected="selected"</c:if>>오염 있음</option>
				<option value="상태 나쁨" <c:if test ="${data.se_state eq '상태 나쁨'}">selected="selected"</c:if>>상태 나쁨</option>
			</select>
		</div>
		
		<div class="col-md-6 mb-3">
			<label for="se_price">상품 가격</label><br>
			<input type="number" id="se_price" name="se_price" min="0" value="${data.se_price }">
		</div>
		
		<div class="mb-3" style="text-align:center;">
			<input type="submit" class="btn btn-primary" value="수정">
			<button type="button" class="btn btn-secondary" onclick="location.href='selling/detail?se_no=${data.se_no }'">목록으로 돌아가기</button>
		</div>
		</form>
	</div>
</div>
</body>
</html>
<%@include file="../footer.jsp" %>