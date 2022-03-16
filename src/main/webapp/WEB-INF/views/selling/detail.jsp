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
/* a태그 밑줄 제거 */
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: blue; text-decoration: underline;}

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
			margin: auto;
			top: 10%;
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
			margin: auto;
			top: 10%;
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
		min-height: 200px; 
		margin-top: 40px;	
	}
		.content{
			width: 80%;
			margin: auto;
			margin-top: 40px;
			margin-bottom: 40px;
		}

	.content_bottom{
		width: 100%;
		min-height: 400px; 
		margin-top: 40px;	
	}
		.content{
			width: 80%;
			margin: auto;
			margin-top: 40px;
			margin-bottom: 40px;
		}

</style>
<script type="text/javascript">
	$(document).ready(function() {
		$("#updateBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath}/sellingUpdate?se_no=${data.se_no}";
		})
		$("#deleteBtn").on("click", function() {
			if(confirm("정말 삭제하시겠습니까?") == true){
				location.href = "${pageContext.request.contextPath}/sellingDelete?se_no=${data.se_no}";				
			}else{
				return;
			}
		})
	})
</script>
</head>
<body>
<div class="container justify-content-start ms-6 me-6">
	<h3>상품 정보</h3>
	<div style="float:right;">
	<c:choose>
		<c:when test="${loginSession.user_id == data.user_id }">
			<button type="button" class="ml-5" id="updateBtn">수정</button>
			<button type="button" class="ml-5" id="deleteBtn">삭제</button>
		</c:when>
		<c:otherwise>
			<span>&nbsp&nbsp</span>
			<span>&nbsp&nbsp</span>
		</c:otherwise>
	</c:choose>
	</div>
	<div class="line"></div>
	<div class="content_area">
		<div class="content_top">
			<div class="ct_left_area">
				<div class="image_wrap">
					<%-- <img src="/upload${data.filepath}" alt="${data.filename}"> --%>
					<img src="${data.filepath}" alt="${data.filename}">
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
				<span><strong>상품설명</strong></span><br><br>
				<span><textarea class="form-control" rows="10" readonly="readonly" disabled>${data.se_content }</textarea></span>
			</div>
		</div>
		<div class="line"></div>
		<div class="content_bottom">
			<div class="content">
				<span><strong>댓글</strong></span><br><br>
				<c:if test="${loginSession.user_id != null }">
					<div class="form-group">
						<form action="commentInsert" method="post">
							<input type="hidden" id="se_no" name="se_no" value="">
							<script>
							var seNo = ${data.se_no };
							$("#se_no").attr("value", seNo);
							</script>
							<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
								<tr>
								<c:choose>
									<c:when test="${loginSession == null }">
										<td><input type="text" style="height:50px;" class="form-control" placeholder="댓글을 남기려면 로그인 해주세요." disabled></td>
									</c:when>
									<c:otherwise>
										<td style="border-bottom:none;" valign="middle">${loginSession.user_id }</td>
										<td><input type="text" style="height:50px;" class="form-control" placeholder="상품에 대한 문의를 남겨주세요." name="co_content"></td>
										<td valign="middle"><input type="submit" value="댓글 작성"></td>																		
									</c:otherwise>
								</c:choose>
								</tr>
							</table>
						</form>
					</div>
				</c:if>
				
				<!-- 댓글 -->
				<div class="container">
					<div class="row">
						<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
							<tbody>
								<tr>
									<c:forEach var="comment" items="${commentlist }">
										<div class="container">
											<div class="row">
												<table class="table table-striped" style="text-align:center; border: 1px solid #dddddd">
													<tbody>
														<tr>
															<td align="left">작성자 : ${comment.user_id }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일 : ${comment.co_regdate }</td>
															<td colspan="2"></td>
															<td align="right">
																<c:if test="${loginSession.user_id == comment.user_id }">
																	<a type="button" onclick="cmtUpdate('${comment.se_no }','${comment.co_no }','${comment.co_content }')">수정</a>
																	<a type="button" onclick="return confirm('정말 삭제하시겠습니까?')" href="${pageContext.request.contextPath}/commentDelete?se_no=${comment.se_no }&co_no=${comment.co_no }">삭제</a>
																</c:if>
															</td>
														</tr>
														<tr id="cmtId">
														<script>
														var coId = "cmtContent" + ${comment.co_no };
														$("#cmtId").attr("id", coId);
														</script>
															<td colspan="5" align="left">${comment.co_content }</td>
														
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</c:forEach>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<script>
function printName(){
	document.getElementById('edited').value;
}

/* 댓글 수정창 */
function cmtUpdate(se_no, co_no, co_content){
	console.log("수정창 넘어온 코멘트 번호: "+co_no);
	console.log("수정창 넘어온 코멘트 내용: "+co_content);
	
	var cmtUpdateView = "";
	var editedContent = "";
	
	cmtUpdateView += '<tr id="cmtContent'+co_no+'">';
	cmtUpdateView += '<td colspan="3" align="left">';
	cmtUpdateView += '<input type="text" style="height:50px;" class="form-control" value="'+co_content+'" name="co_content" id="edited">';
	cmtUpdateView += '</td>';
	cmtUpdateView += '<td colspan="1" align="center">';
	cmtUpdateView += '<button type="button" id="cmtUpdateBtn"'; 
	cmtUpdateView += 'onclick="editedContent = $(\'#edited\').val(); cmtUpdateConfirm(\'' + se_no +'\',\''+ co_no + '\',editedContent)"';
	cmtUpdateView += 'class="btn btn-outline-primary btn-sm" style="margin: 5px 10px;">등록</button>';
	cmtUpdateView += '<button type="button" onclick="backComment(\'' + co_no +'\',\''+ co_content +'\')" class="btn btn-outline-secondary btn-sm">취소</button>';
	cmtUpdateView += '</td>';
	cmtUpdateView += '</tr>';
	
	$('#cmtContent'+co_no).replaceWith(cmtUpdateView);

};

/* 수정된 댓글 등록 처리 */
function cmtUpdateConfirm(se_no, co_no, editedContent){
	console.log("등록 넘어온 코멘트 번호: "+co_no);
	console.log("등록 넘어온 코멘트 내용: "+editedContent);

	var url = "${pageContext.request.contextPath}/commentUpdate?se_no="+se_no+"&co_no="+co_no+"&editedContent="+editedContent;
	
	$.ajax({
		url: url,
		type: "GET",
		datatype: "JSON",
		success: function(result){
			getComment(co_no, editedContent);
			alert("댓글이 수정되었습니다.");
			console.log(result);
		},
		error: function(error){
			alert("댓글 수정 에러!!!" + error);			
		}
	});
	
};

/* 수정된 댓글 등록 처리 후 표시 */
function getComment(co_no, editedContent){
	console.log("등록확인 넘어온 코멘트 번호: "+co_no);
	console.log("등록확인 넘어온 코멘트 번호: "+editedContent);
	
	var cmtEditedView = "";
	
	cmtEditedView += '<tr id="cmtContent'+co_no+'">';
	cmtEditedView += '<td colspan="5" align="left">'+editedContent+'</td>';
	cmtEditedView += '</tr>';
	
	$('#cmtContent'+co_no).replaceWith(cmtEditedView);
};

/* 댓글 수정 취소 처리 */
function backComment(co_no, co_content){
	console.log("등록확인 넘어온 코멘트 번호: "+co_no);
	console.log("등록확인 넘어온 코멘트 번호: "+co_content);
	
	var cmtDeleteView = "";
	
	cmtDeleteView += '<tr id="cmtContent'+co_no+'">';
	cmtDeleteView += '<td colspan="5" align="left">'+co_content+'</td>';
	cmtDeleteView += '</tr>';
	
	$('#cmtContent'+co_no).replaceWith(cmtDeleteView);
};


</script>

</body>
</html>
<%@include file="../footer.jsp" %>