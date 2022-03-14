<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL import -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#sellingBtn").on("click", function() {
			if(${loginSession != null}){
				location.href = "${pageContext.request.contextPath}/selling";
			}else{
				alert("로그인 해주세요.");
				location.href = "${pageContext.request.contextPath}/loginform";
			}
		})
	})
</script>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/main">
			<img src="${pageContext.request.contextPath}/resources/statics/images/greenstorelogo.png" alt="logo" width="70" height="35">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
	    </button>
	    
	    <!-- 검색 -->
		<!-- <div class="container">
		</div> -->
		
		<div class="collapse navbar-collapse justify-content-end" id="navbarTogglerDemo01">
			<!-- 검색 -->
			<div class="container-fluid">
			<form class="d-flex" action="${pageContext.request.contextPath}/sellingSearch" method="post">
				<div class="input-group w-100">
					<input type="text" class="form-control" name="searchValue" placeholder="무슨 상품을 찾고 계신가요?????????" aria-label="Recipient's username" aria-describedby="button-addon2">
					<input class="btn btn-outline-secondary" type="image" id="button-addon2" src="${pageContext.request.contextPath}/resources/statics/images/search.svg" alt="제출버튼">
				</div>
			</form>
			</div>
			<ul class="navbar-nav mb-lg-0 w-50">
				<c:choose>
					<c:when test="${loginSession == null }">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/list">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/loginform">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/signup">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/list">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
						<!-- <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage">마이 페이지</a></li> -->
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/selling/list">나의 판매목록</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><button type="button" class="btn btn-success ml-5" id="sellingBtn">상품등록</button></li>
			</ul>
		</div>
	</div>
</nav>


