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
<title>** 게시글 보기 **</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#updateBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath}/boardUpdate?bd_no=${data.bd_no}";
		})
		$("#deleteBtn").on("click", function() {
			if(confirm("정말 삭제하시겠습니까?") == true){
				location.href = "${pageContext.request.contextPath}/boardDelete?bd_no=${data.bd_no}";				
			}else{
				return;
			}
		})
		$("#listBtn").on("click", function() {
			location.href = "${pageContext.request.contextPath}/board/list";
		})
	})
</script>
</head>
<body>
<div class="container">
	<table class="table table-hover">
		<thead>
			<div class="fw-bold">
				<tr>
					<th style="font-size:30px" colspan="6">제목 : ${data.bd_title }</th>
				</tr>
			</div>
			<tr>
				<th>글번호 : ${data.bd_no }</th>
				<th>작성자 : 운영자</th>
				<th>작성일 : ${data.bd_regdate }</th>
				<th>조회수 : ${data.bd_readcnt }</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="6"><textarea class="form-control" rows="10" readonly="readonly" disabled>${data.bd_content }</textarea></td>
			</tr>
		</tbody>
	</table>
	
	<div style="float:right;">
		<c:if test="${loginSession.user_id == data.user_id }">
			<button type="button" class="btn btn-warning ml-5" id="updateBtn">수정</button>
			<button type="button" class="btn btn-danger ml-5" id="deleteBtn">삭제</button>
		</c:if>
			<button type="button" class="btn btn-secondary ml-5" id="listBtn">목록</button>
	</div>
	
</div>

</body>
</html>