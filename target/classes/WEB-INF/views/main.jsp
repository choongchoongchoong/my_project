<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!-- JSTL import -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>** 메인 페이지 **</title>

<style type="text/css">
/* a태그 밑줄 제거 */
a:link { color: red; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: blue; text-decoration: underline;}

/************Reset**************/
* { 
  -moz-box-sizing: border-box; 
  -webkit-box-sizing: border-box; 
  box-sizing: border-box; 
}
html, body, div, object, iframe, fieldset { 
  margin: 0; 
  padding: 0; 
  border: 0;
} 
ol, ul { 
  list-style: none;
  margin: 0;
  padding: 0;
} 
table { 
  border-collapse: collapse; 
  border-spacing: 0; 
}
header, footer, nav, section, article, hgroup, figure {
  display: block; 
}
legend {
  display: none;
}
/************End Reset**************/

/************Global**************/
body {
  background-color: #fff;
  color: #000;
  font: 100%/1.4 "HelveticaNeue", "Helvetica", "Arial", sans-serif;
  padding: 0;
  -webkit-text-size-adjust: none;
}
a {
  color: #808080;
  text-decoration: none;
}
a:hover, a:focus {
  color: #e51837;
}
p {
  margin: 0 0 1em;
}
img, object, video {
  max-width: 100%;
  border: 0;
}
a img {
  border: 0;
  outline: 0;
}
h1 {
  font-size: 3em;
  line-height: 1;
  letter-spacing: -0.02em;
  margin-bottom: 0.2em;
}
h2 {
  font-size: 2em;
  line-height: 1.1;
  margin-bottom: 0.2em;
}
h3 {
  font-weight: normal;
  line-height: 1.1;
  padding-bottom: 0.4em;
  border-bottom: 1px solid #ccc;
}
h1 a, h2 a, h3 a {
  display: block;
  color: #000;
}
h1 a:hover, h2 a:hover, h3 a:hover {
  color: #e51837;
}
blockquote {
  border-left: 0.5em solid #ddd;
  padding-left: 1em;
  margin-left: 1em;
}
small {
  color: #e51837;
}

input, textarea {
  border: 1px solid #000;
}

input[type=search] {
  -webkit-appearance: none;
  border-radius: 0;
}
::-webkit-input-placeholder {
  color: #808080;
}
:-moz-placeholder {  
    color: #808080;
}
/************End Global**************/

/* CSS Animations */
@-webkit-keyframes fadeout {
  0%   { background: #fff; }
  10%   { background: #eee; }
  100% { background: #fff; }
}
@-moz-keyframes fadeout {
  0%   { background: #fff; }
  10%   { background: #eee; }
  100% { background: #fff; }
}
@-o-keyframes fadeout {
  0%   { background: #fff; }
  10%   { background: #eee; }
  100% { background: #fff; }
}
@keyframes fadeout {
  0%   { background: #fff; }
  10%   { background: #eee; }
  100% { background: #fff; }
}


.list li {
  border-bottom: 1px solid #ccc;
  display: table;
  border-collapse: collapse;
  width: 100%;
}
.inner {
  display: table-row;
  overflow: hidden;
}
.thumb { 
	display: block;
	overflow: hidden;
	height: 300px;
	width: 300px;
}

.thumb img {
	display: block; /* Otherwise it keeps some space around baseline */
	min-width: 100%; /* Scale up to fill container width */
	min-height: 100%; /* Scale up to fill container height */
	-ms-interpolation-mode: bicubic; /* Scaled images look a bit better in IE now */
}
.li-img {
  display: table-cell;
  vertical-align: middle;
  width: 20%;
  padding-right: 1em;
}
.li-img img {
  display: block;
  width: 100%;
  height: auto;
}
.li-text {
  display: table-cell;
  vertical-align: middle;
  width: 60%;
}
.li-head {
  margin: 0;
}
.li-sub {
  margin: 0;
}

@media all and (min-width: 40em) {
  .list {
    padding: 0.5em;
    max-width: 70em;
    margin: 0 auto;
    overflow: hidden;
  }
  .list li {
    padding: 0.5em;
    display: block;
    width: 50%;
    float: left;
    background: none;
    border: 0;
  }
  .inner {
    display: block;
  }
  .li-img, .li-text, .inner {
    display: block;
    width: auto;
    padding: 0;
  }
  .li-text {
    padding: 0.5em 0;
  }
}

@media all and (min-width: 60em) {
  .list li {
    width: 33.33333333%;
  }
}

</style>
</head>
<body>
<!-- 검색
<div class="container">
	<form action="${pageContext.request.contextPath}/sellingSearch" method="post">
		<div class="input-group mb-6 w-50 col-md-12 mx-auto">
			<input type="text" class="form-control" name="searchValue" placeholder="무엇을 찾고 계신가요?" aria-label="Recipient's username" aria-describedby="button-addon2">
			<input class="btn btn-outline-secondary" type="image" id="button-addon2" src="${pageContext.request.contextPath}/resources/statics/images/search.svg" alt="제출버튼">
		</div>
	</form>
</div> -->
<div class="container"></div>
<div id="pattern" class="pattern">
	<ul class="list img-list">
	<h3>오늘의 추천상품</h3>
		<c:forEach var="list" items="${datalist }">
		<li>
			<a href="selling/detail?se_no=${list.se_no }" class="inner">
				<div class="li-img">
					<span class="thumb">
						<!-- <img src="/home/resources/statics${list.filepath}" alt="${list.filename}">  -->
						<!-- <img src="/upload${list.filepath}" alt="${list.filename}"> -->
						<img src="${list.filepath}" alt="${list.filename}">
					</span>
				</div>
				<div class="li-text">
					<h4 class="li-head">${list.se_title}</h4>
					<p class="li-etc"><fmt:formatNumber value="${list.se_price}" pattern="#,###"/>원</p>
				</div>
			</a>
		</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>
<%@include file="footer.jsp" %>