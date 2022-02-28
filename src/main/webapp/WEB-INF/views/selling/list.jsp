<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!-- JSTL import -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>** 판매 목록 **</title>
<style type="text/css">
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

.inner {
  display: table-row;
  overflow: hidden;
}

.thumb { 
	display: block;
	overflow: hidden;
	height: 150px;
	width: 150px;
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
  width: 70%;
  padding-right: 1em;
}

.li-head {
  margin: 0;
}

.li-etc {
  margin: 0;
}

@media screen and (min-width: 40em) {
  .list li {
    background: none;
  }
  .li-summary {
    display: block;
  }
}

@media screen and (min-width: 60em) {
  .list li {
    float: left;
    width: 50%;
  }
  .inner {
    padding-right: 1em;
  }
}

</style>
</head>
<body>
<div class="wrap">
	<h1>판매 목록</h1>
	<div id="pattern" class="pattern">
		<ul class="list img-list">
			<c:forEach var="list" items="${datalist }">
			<li>
				<a href="#" class="inner">
					<div class="li-img">
						<span class="thumb">
							<img src="/home/resources/statics${list.filepath}" alt="${list.filename}">
						</span>
					</div>
					<div class="li-text">
						<h4 class="li-head">${list.se_title}</h4>
						<p class="li-etc"><fmt:formatNumber value="${list.se_price}" pattern="#,###"/>원</p>
						<p class="li-etc">${list.se_regdate.substring(0,10)}</p>
					</div>
				</a>
			</li>
			</c:forEach>
		</ul>
	</div>
</div>
</body>
</html>