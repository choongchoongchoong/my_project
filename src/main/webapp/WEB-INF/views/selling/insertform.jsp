<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL import 하기 (core) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">

/* 상품가격 증감 화살표 삭제 */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

/* 사진첨부 메시지 */
#att_zone{
	width: 660px;
	min-height:150px;
	padding:10px;
	border:1px dotted #00f;
}
#att_zone:empty:before{
	content : attr(data-placeholder);
	color : #999;
	font-size:.9em;
}
</style>



<meta charset="UTF-8">
<title>** 상품 등록 페이지 **</title>
</head>
<body>
<div class="container">
	<h3 class="mb-3">상품등록</h3>
	<form action="sell" method="post" enctype="multipart/form-data">
		<div class="col-md-6 mb-3">
		<label for="se_title">상품명</label>
		<input type="text" id="se_title" name="se_title">
		</div>
		
		<div class="col-md-6 mb-3">
			<div id='image_preview'>
			<label for="se_pic">상품사진</label>
			<input type='file' id="se_pic" name="se_pic" multiple="multiple">
			<div id='att_zone' data-placeholder='사진을 첨부 하려면 파일 선택 버튼을 클릭하거나 사진파일을 드래그 하세요'></div>
			</div>
		</div>
		
		<div class="col-md-6 mb-3">
			<label for="se_content">상품설명</label>
			<textarea id="se_content" name="se_content"></textarea><br>
		</div>
		
		<div class="col-md-6 mb-3">
			<label for="se_cat">카테고리</label>
			<select class="form-control" id="se_cat" name="se_cat">
				<option value="">선택</option>
				<option value="wclothes">여성의류</option>
				<option value="mclothes">남성의류</option>
				<option value="beauty">뷰티/미용</option>
				<option value="electric">전자기기</option>
				<option value="furniture">가구/인테리어</option>
				<option value="stuff">생활잡화</option>
				<option value="book">책/음반</option>
				<option value="etc">기타</option>
			</select>
		</div>
		
		<div class="col-md-6 mb-3">
			<label for="se_state">상품상태</label>
			<select class="form-control" id="se_state" name="se_state">
				<option value="">선택</option>
				<option value="s">새상품/미개봉</option>
				<option value="a">새상품에 가까움</option>
				<option value="b">눈에 띄는 오염 없음</option>
				<option value="c">약간의 사용감 있음</option>
				<option value="d">오염 있음</option>
				<option value="f">상태 나쁨</option>
			</select>
		</div>
		
		<div class="col-md-6 mb-3">
			<label for="se_price">상품 가격</label>
			<input type="number" id="se_price" name="se_price" min="0">
		</div>
	
		<input type="submit" value="등록">
		<button type="button" class="btn btn-primary" onclick="location.href='index.jsp'">돌아가기</button>
	</form>
</div>



<script>
<!-- 이미지 첨부 처리 -->
/* 사진파일 저장 자동함수 */
(
	//매개변수 att_zone : 이미지들이 들어갈 위치 id, se_pic : file tag id
	imageView = function imageView(att_zone, se_pic){
		var attZone = document.getElementById(att_zone);
		var se_pic = document.getElementById(se_pic);
		var sel_files = [];  //파일 목록 저장
		
		//이미지와 체크박스를 감싸고 있는 div 속성
		var div_style = 'display:inline-block;position:relative;width:150px;'
						+ 'height:120px;margin:5px;border:1px solid #00f;z-index:1';
		//미리보기 이미지 속성
		var img_style = 'width:100%;height:100%;z-index:none';
		//이미지 안에 표시되는 체크박스 속성
		var chk_style = 'width:30px;height:30px;position:absolute;font-size:15px;'
						+ 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
		
		//파일 선택 시 multiple 속성의 file 태그에서 이미지를 전달받아 화면에 표시
		se_pic.onchange = function(e){
			var files = e.target.files;
			var fileArr = Array.prototype.slice.call(files);
			for(f of fileArr){
				imageLoader(f);
			}
		}
		
		//드래그 앤 드롭 기능
		attZone.addEventListener('dragenter', function(e){
			e.preventDefault();
			e.stopPropagation();
		}, false);
		
		attZone.addEventListener('dragover', function(e){
			e.preventDefault();
			e.stopPropagation();
		}, false);
		
		attZone.addEventListener('drop', function(e){
			var files = {};
			e.preventDefault();
			e.stopPropagation();
			var dt = e.dataTransfer;
			files = dt.files;
			for(f of files){
				imageLoader(f);
			}
		}, false);
		
		//첨부파일을 배열에 넣고 미리보기
		imageLoader = function(file){
			sel_files.push(file);  //배열에 추가
			var reader = new FileReader();
			reader.onload = function(ee){
				let img = document.createElement('img');
				img.setAttribute('style', img_style);
				img.src = ee.target.result;
				attZone.appendChild(makeDiv(img, file));  //이미지가 들어가는 자리에 makeDiv 추가
			}
			reader.readAsDataURL(file);
		}
		
		/* 첨부 파일 삭제 */
		//첨부된 파일이 있는 경우, checkbox와 함께 attZone에 추가할 div를 만들어 반환
		makeDiv = function(img, file){
			var div = document.createElement('div')
			div.setAttribute('style', div_style);
			
			var btn = document.createElement('input');
			btn.setAttribute('type', 'button');
			btn.setAttribute('value', 'x');
			btn.setAttribute('delFile', file.name);
			btn.setAttribute('style', chk_style);
			
			btn.onclick = function(ev){
				var ele = ev.srcElement;
				var delFile = ele.getAttribute('delFile');
				
				for(var i=0; i<sel_files.length; i++){
					if(delFile == sel_files[i].name){
						sel_files.splice(i, 1);
					}
				}
				
				dt = new DataTransfer();
				for(f in sel_files){
					var file = sel_files[f];
					dt.items.add(file);
				}
				
				se_pic.files = dt.files;
				var p = ele.parentNode;
				attZone.removeChild(p);
			}
			
			div.appendChild(img);
			div.appendChild(btn);
			
			return div;
		}
		
	}
)('att_zone', 'se_pic')
</script>

</body>
</html>