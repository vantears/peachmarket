<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>스프링</title>
</head>
<style>
	body{
		color: #000;
	}
	.sale-title {
		font-size: 26px;
		margin-bottom: 20px;
	}
	.sale-title::after {
		content: '* 필수항목';
		font-size: 14px;
		color: red;
		position: relative;
		top: -8;
		right: -10;
	}
	.content-title::after {
		content: '*';
		font-size: 14px;
		color: red;
		position: relative;
		top: 0;
		right: -4;
	}
	.content-category::after {
		content: '*';
		font-size: 14px;
		color: red;
		position: relative;
		top: 0;
		right: -4;
	}
	.content-price::after {
		content: '*';
		font-size: 14px;
		color: red;
		position: relative;
		top: 0;
		right: -4;
	}
	.insert-container {
		width: 1100px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.image-preview {
		margin-bottom: 20px;
	}
	
 	.image-preview li {
      list-style: none;
      position: relative;
    }
	.image-div {
		position: relative;
		width: 200px;
		height: 200px;
	}
	
    .image-list img {
      position: absolute;
      top: 0;
      left: 0;
      transform: translate(50, 50);
      width: 100%;
      height: 100%;
      object-fit: cover;
      margin: auto;
    }

    .real-upload {
      display: none;
    }

    .upload {
      width: 200px;
      height: 200px;
      cursor: pointer;
    }

    .image-preview {
      width: 1600px;
      height: 200px;
      display: flex;
      gap: 20px;
    }
    .close-btn {
    	width: 1.5rem;
	    height: 1.5rem;
	    background-position: center center;
	    background-repeat: no-repeat;
	    background-size: 12px 12px;
	    background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxwYXRoIGZpbGw9IiNGRkYiIGZpbGwtcnVsZT0iZXZlbm9kZCIKICAgICAgICBkPSJNNi44NDggNmwzLjc3Ni0zLjc3NmEuNi42IDAgMSAwLS44NDgtLjg0OEw2IDUuMTUgMi4yMjQgMS4zNzZhLjYuNiAwIDAgMC0uODQ4Ljg0OEw1LjE1MiA2IDEuMzc2IDkuNzc1YS42LjYgMCAxIDAgLjg0OC44NDlMNiA2Ljg0OGwzLjc3NiAzLjc3NmEuNTk4LjU5OCAwIDAgMCAxLjAyNC0uNDI1LjYuNiAwIDAgMC0uMTc2LS40MjRMNi44NDggNnoiIC8+Cjwvc3ZnPg==);
	    background-color: rgb(25, 25, 25);
	    opacity: 0.3;
	    border-radius: 50%;
	    position: absolute;
	    top: 0.5rem;
	    right: 0.5rem;
	    border: none;
    }
     .price-input {
    	width: 300px;
    	border: none;
    }
    .price-holder {
    	border: 1px solid #ced4da;
    	border-radius: 0.25rem; 
    	width: 330px; 
    	height: 40px;
    }
    .price-holder::after {
    	content: '원';
    	font-size: 16px;
    	font-weight: 400;
    	color: rgb(153, 153, 153);
    	position: relative;
    	top: -30;
    	right:-305;
    }
</style>
<body>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<div class="insert-container">
		<div class="sale-title">판매하기</div>
		<div class="wrapper">
				<ul class="image-preview">
					<li class="upload" style="background-image:url('<c:url value='/resources/image/upload.png' />')"></li>
				</ul>
			<script>
				//파일번호를 0으로 초기화
				let fileNo = 0;
				
				//선택된 파일의 새로운 미리보기 이미지 생성
			    function createElement(e, file) {
			      
			      const li = document.createElement('li');
			      const div = document.createElement('div');
			      const close = document.createElement('button');
			      const img = document.createElement('img');
			      li.setAttribute('class', 'image-list');
			      li.setAttribute('id', "file" + fileNo)
			      div.setAttribute('class', 'image-div');
			      img.setAttribute('src', e.target.result);
			      img.setAttribute('data-file', file.name);
			      close.setAttribute('class', 'close-btn');
			      close.setAttribute('type', 'button');
			      close.setAttribute('onclick', 'deleteFile('+fileNo+')')

			      li.appendChild(div);
			      div.appendChild(img);
			      div.appendChild(close);
			      //모두 생성 후 파일번호 1 증가
			      fileNo++;
			      
			      return li;
			    }
				//다음 파일을 등록하기 위해 새로운 인풋태그 생성
			    function createFileTag(){
			    	const fileTag = document.querySelector('#no' + fileNo);
			    	const fi = document.createElement('input');
			    	fi.setAttribute('type', 'file');
			        fi.setAttribute('class', 'real-upload');
			        fi.setAttribute('accept', 'image/*');
			        fi.setAttribute('onchange', 'addFile(this);');
			        fi.setAttribute('id', "no" + (fileNo + 1));
			        fi.setAttribute('name', 'files');
			        fi.setAttribute('multiple', true);
			        fileTag.after(fi);
			    	
			    }
				
			    const realUpload = document.querySelector('.real-upload');
			    const upload = document.querySelector('.upload');
			    
			    function clickfunction(){
			    	const filebutton = document.querySelector('#no' + fileNo);
			    	filebutton.click();
			    }
			    //업로드 이미지 클릭 시 현재 파일 번호의 인풋 태그가 클릭되게 설정
			    upload.addEventListener('click', ()=> clickfunction());
			    
			    
			    
				
				/* (인풋태그 온체인지 이벤트)첨부파일 추가 */
				function addFile(obj){
				    var maxFileCnt = 4;   // 첨부파일 최대 개수
				    var attFileCnt = document.querySelectorAll('.image-list').length;    // 기존 추가된 첨부파일 개수(미리보기 이미지 개수)
				    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
				    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
				    const imagePreview = document.querySelector('.image-preview');
				
				    // 첨부파일 개수 확인
				    if (curFileCnt > remainFileCnt) {
				        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
				    }
					
				    //여러개 파일을 한번에 등록하는 경우를 위해 반복문 실행
				    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
				
				        const file = obj.files[i];
				
				        // 첨부파일 검증
				        if (validation(file)) {
				            //파일 미리보기 생성 및 새로운 인풋태그 생성
				            var reader = new FileReader();
							reader.onload = (e) => {
			            		createFileTag();
			            		const preview = createElement(e, file);
			           			imagePreview.appendChild(preview);
			            	};
			          		reader.readAsDataURL(file);
				            
				        } else {
				            continue;
				        }
				    }
				}
				
				/* 첨부파일 검증 */
				function validation(obj){
				    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
				    if (obj.name.length > 100) {
				        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
				        return false;
				    } else if (obj.size > (100 * 1024 * 1024)) {
				        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
				        return false;
				    } else if (obj.name.lastIndexOf('.') == -1) {
				        alert("확장자가 없는 파일은 제외되었습니다.");
				        return false;
				    } else if (!fileTypes.includes(obj.type)) {
				        alert("첨부가 불가능한 파일은 제외되었습니다.");
				        return false;
				    } else {
				        return true;
				    }
				}
				
				/* 첨부파일 삭제 */
				function deleteFile(num) {
				    document.querySelector("#file" + num).remove();
				    document.querySelector("#no" + num).remove();
				}
			  </script>
		</div>
	<form action="<c:url value='/saleboard/insert'/>" method="post" enctype="multipart/form-data" onsubmit="getRidOfComma();">
		<input type="file" class="real-upload" accept="image/*" onchange="addFile(this);" id="no0" name="files" multiple>
		<div class="form-group">
			<label class="content-title">제목</label>
			<input type="text" maxlength="40" class="form-control" name="sb_name" placeholder="상품명을 입력해주세요.(최대 40자)" required>
			
		</div>
		<div class="form-group">
			<label class="content-category">카테고리</label>
			<select name="sb_sc_num" class="custom-select" required>
				<option selected>카테고리 선택</option>
			    <c:forEach items="${dbCategory}" var="dbCategory">
			    	<option value="${dbCategory.sc_num}">${dbCategory.sc_name}</option>
			    </c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label class="content-price">가격</label>
			<div class="price-holder">
				<input type="text" id="price-input" class="form-control price-input" name="sb_price" maxlength="11" placeholder="가격을 입력해주세요." required>
			</div>
		</div>
		<div class="form-group">
			<label>설명</label>
			<textarea id="summernote" name="sb_info" class="form-control" rows="10"></textarea>
		</div>
		<div class="col text-center">
			<button class="btn btn-outline-success col-2">등록하기</button>
		</div>
	</form>
	</div>
	<script>
      $('#summernote').summernote({
        placeholder: '물품에 대한 자세한 설명을 작성하여주세요.',
        tabsize: 2,
        height: 300
      });
      
      // 숫자가 아닌 정규식
      var replaceNotInt = /[^0-9]/gi;
      
      $(document).ready(function(){
          $("#price-input").on("input", function() {
              var x = $(this).val();
              if (x.length > 0) {
                  if (x.match(replaceNotInt)) {
                     x = x.replace(replaceNotInt, "");
                  }
                  x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                  $(this).val(x);
              }
          });
       });
      
		var comma = /,/g;
      
     	 function getRidOfComma() {
	    	let x = $("#price-input").val(); 
	    	x = x.replace(comma, "");
	    	$("#price-input").val(x); 
	      }
    </script>
</body>
</html>
