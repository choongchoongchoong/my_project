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
<title>** 상품 내용 **</title>
<style>

.content_area{
	width: 100%;
    min-height: 1000px;
}
	.content_top{
		width: 100%;
		height: 400px;  	
	}
		.ct_left_area{
			float: left;
			width: 30%;
			height: 100%;
		}
			.image_wrap{
				height: 80%;
				width: 80%;
				margin: auto;
				top: 10%;
				position: relative;  		
			}
			.image_wrap img{
				max-width: 100%;
				height: auto;
				display: block;  		
			}
			.line{
				width: 100%;
				border-top:1px solid #c6c6cf;  		
			}
		
		.ct_right_area{
			float: left;
			width: 70%;
			height: 100%;
		}
			.title{
				height: 15%;
				font-size: 17px;
				line-height: 50px;
				color: #3a60df;
				padding-left: 3%;
			}
			.category, .state, .regdate, .readcnt, .seller{
				font-size: 16px;
				line-height: 50px;
				padding-left: 3%;  		
			}
			.price{
				line-height: 30px;
				padding: 2% 0 2% 3%;  		
		  	}
				.price_number{
					line-height: 30px;
					font-size: 22px;
					color: #f84450;
					font-weight: bold;  			
				}
	  	
	.content_middle{
		width: 100%;
		min-height: 600px;  	
	}
		.content{
			width: 80%;
			margin: auto;
			margin-top: 40px;
			margin-bottom: 40px;
		}

</style>
</head>
<body>
<div class="container justify-content-start ms-6 me-6">
	<h3>상품 정보</h3>
	<div class="line"></div>
	<div class="content_area">
		<div class="content_top">
			<div class="ct_left_area">
				<div class="image_wrap">
					<img src="/upload${data.filepath}" alt="${data.filename}">
				</div>	
			</div>
			<div class="ct_right_area">
				<div class="title">
					<h3>${data.se_title }</h3>
				</div>
				<div class="line"></div>
				<div class="category">
					<span><strong>카테고리</strong></span>
					<span>&nbsp&nbsp|&nbsp&nbsp</span>
					<span>${data.se_cat}</span>
				</div>
				<div class="state">
					<span><strong>제품상태</strong></span>
					<span>&nbsp&nbsp|&nbsp&nbsp</span>
					<span>${data.se_state}</span>
				</div>
				<div class="regdate">
					<span><strong>등록일자</strong></span>
					<span>&nbsp&nbsp|&nbsp&nbsp</span>
					<span>${data.se_regdate.substring(0,10)}</span>
				</div>
				<div class="readcnt">
					<span><strong>조회수&nbsp&nbsp</strong></span>
					<span>${data.se_readcnt}</span>
				</div>
				<div class="line"></div>
				<div class="price">
					<strong>판매가 :  </strong> <span class="price_number"><fmt:formatNumber value="${data.se_price}" pattern="#,###"/>원</span>			
				</div>
				<div class="line"></div>
				<div class="seller">
				<span><strong>판매자 정보&nbsp&nbsp</strong></span>
				<span>${data.user_id }</span>
				</div>
			</div>
		</div>
		<div class="line"></div>
		<div class="content_middle">
			<div class="content">
				<span><strong>상품설명</strong></span><br>
				<span>${data.se_content }</span>
			</div>
		</div>
	</div>
</div>

</body>
</html>