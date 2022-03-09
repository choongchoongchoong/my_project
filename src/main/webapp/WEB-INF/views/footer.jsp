<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
  .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
  }

  @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
  }
</style>

<div class="b-example-divider"></div>

<div class="container">
  <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
  	<p class="col-md-4 mb-0 text-muted">&copy; since 2022</p>
  	
    <div class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/main">
			<img src="${pageContext.request.contextPath}/resources/statics/images/greenstorelogo.png" alt="logo" width="70" height="35">
		</a>
    </div>

    <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
      <li class="ms-3"><a class="text-muted" href="http://blog.naver.com/choongchoongchoong" target='_blank'><img src="${pageContext.request.contextPath}/resources/statics/images/blog.png" alt="blog" width="27" height="27"></a></li>
      <li class="ms-3"><a class="text-muted" href="http://www.instagram.com/choongchoongchoong" target='_blank'><img src="${pageContext.request.contextPath}/resources/statics/images/instagram.png" alt="instagram" width="27" height="27"></a></li>
      <li class="ms-3"><a class="text-muted" href="http://www.youtube.com/channel/UCzlDV2atlu98bXT5rBn2oMw" target='_blank'><img src="${pageContext.request.contextPath}/resources/statics/images/youtube.png" alt="youtube" width="27" height="24"></a></li>
    </ul>
  </footer>
</div>
