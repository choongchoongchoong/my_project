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


<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/main">
			<img src="${pageContext.request.contextPath}/resources/statics/images/greenstorelogo.png" alt="logo" width="70" height="35">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
	    </button>
		<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<c:choose>
						<c:when test="${loginSession == null }">
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">로그인</a></li>
						</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/mypage">마이 페이지</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/selling">상품등록</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/selling/list">나의 판매목록</a></li>
					</c:otherwise>
					</c:choose>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/list">게시판</a></li>
			</ul>
		</div>
	</div>
</nav>

