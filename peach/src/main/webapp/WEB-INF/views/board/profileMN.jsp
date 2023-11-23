<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
	<title>마이페이지 관리</title>
</head>
<style>
	.insert-container1 {
		width: 1100px;
		margin: auto;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
 	.upload {
      list-style: none;
      position: relative;
    }
	.image-list {
	  list-style: none;
      position: relative;
	}
    .pImg {
      width: 200px;
      height: 200px;
		
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
      margin-left: 40%;
    }
    .close-btn {
    	width: 1.5rem;
	    height: 1.5rem;
	    background-position: center center;
	    background-repeat: no-repeat;
	    background-size: 40px 40px;
	    background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAAEsElEQVR4nO1azY/bRBSfCrEtgoKAG5QL0EuB/wF2l/JVaHvIhY/My7ZaiUIOy+Y9r9gukXqsSqHloxWquKEV/w6FqmcKFLQElUNmHGlhqucYkjj22E5sJwvzkyxF8njG7/n93meEcHBwcHBwcHBwcKgERrYP9MB7Tjdayz54x/ni372V9Wf5nvivwTSb+7v11kkl8aqSdFNJ/EsDmbiL7wVrgK50JZ4wtfaC2KtQ8METGvATLamTJHDqxc9Kutg9TYfEXoFZ9R5SgJcUYG9iwaOWwXtJumjeaj4o5hka6CUN+EtRgsdYxM8a6EUxbzBC7NOA52z8Lswa2E8AtflMMQ8wtdo9SuLXZQseQ4trfPZshRdi3+TC4+9K0nW++PfESpilJWjAczn4+yM7Rw3eIofG6F6cA2iJSwroMq/NQYmPZiS8t6iAdjMIvqMAvTwx3ayu3qslrmZxqIHfqbeOlittBByOMnl7id+Yt9fvFxPCnGk/oAG3M1jCT2YFD4qqoCR9aucm/a0APyyCn30/Q5u8Z4qyPxZVoHuaDqUlOSx80ecqwLN2KpDfra89XvS5ub9+YPaRL+8DHuYE5s6ptUdECngNr9WnNp6OyTW2Z2oFptncn5Lb32beDj/DXvrfBElSxwd8NWl/vqcB//jHuSlJWyPnr+BBDfSbLbSWWkB1662T1i/Q8N6NCHQ4mh2yqfoNPDYmfAOP8b0YD//U8Dotvfds7+DX8Y3SFKAkXrXFeQ5fIy9bbx1N4uuwEuKEHyi1tRwTIm9ZwuKXJSqAbloc36VYPidQJlCC9F7jK1F4SZ07b248PP4e+JnlPW6UIryprd1nL3a8xSReJ0UNFjxJ+EBBCf6CrSJZAbQbl2lOjR63sSxx39bOCkw8R38gyU8Mfwzb8706PVO4ArTEJQv/d9Kfb72sAHWq8IC9LI7MGo2k97woGj43L5Mdz3dZ9khTQlbhGf0qssJI4FsVQNcz7VGnVwpTAOD3lSpA2ynQmVb4ESWAdzz1fcKEqTIK9P7vTtDI9gFrGJS4VFkY5Fqh6jCYngjRZRHBn+9sPJpkqlMlQoCfW6znB1EWFNCVmafCtfYCN0AsCviiNAV0JZ6w8xfPFF4MNTaeHF6ngd63vYMP3uulKcCw9q0JCP46Xg7TVq5yONy/3//Hs+OtOEs5LGmn9Hmi5nmf3Qq2ow0RLmnZlOP4HAWvCZxcpAwOGyLfpkSQC6KSlphM4OvAzDeLPpctaS5aYgweVKY2RSVtFtgU3UptigKdn/aszAi42B9UmlQ6TNGuDtvvaWbPvudW1PeUDl3HFzINRngExoORHMnJYDBCt9P2Dx3sbCbGCqidroDBVwo6OY3WMqeyselto7UcJjmJcX6cbqORolIY5ifgtcxKGA1ZHa7ogqpuwn+RKMCvZib8yHh8UiVMcbHwMx+PR8bkg/5/qYLT7kzN3oawWZmZv/lpw+3w+Obr3MD0pzcX0pKlnObOjZTzlYe6acBZGc/qJv33R+god1iZ3RV8TOxVmFp7gXt0XKby0MKWO4T8vsFruarb03+UTAInRH5j/QhzmRXDV/C7sX6ktE6Og4ODg4ODg4ODg4jiLpmvCJ7Nw3tkAAAAAElFTkSuQmCC");
	    border-radius: 50%;
	    background-color: #fff;
	    position: absolute;
	    top: 0.5rem;
	    right: 0.5rem;
	    border: none;
    }
    .form-group-e{
    	width : 400px;
    	margin-left: 30.5%;
    }
    .qwe{
    	margin-left: 38%;
    	font-weight: bold;
    }

</style>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<br>
	<br>
	<h1 class="qwe">마이페이지 관리</h1>

	<br>
	<div class="insert-container1">
		<div class="wrapper">
				<ul class="image-preview mb-3">
				<c:if test="${pi_num == ''}">
				<li class="upload" style="background-image:url('<c:url value='/resources/image/upload.png' />')"></li>
				</c:if>
					<c:if test="${pi_num != ''}">
						<li class="upload" style="background-image:url('<c:url value='/resources/image/upload.png' />'); display: none;"></li>
						<li class="image-list" id="file0">
							<img class="pImg" alt="" src="<c:url value='/img/${OriFileName}' />" >
							<button class="close-btn" type="button" onclick="deleteOriginal(0)"></button>
						</li>
					</c:if>
				</ul>
			<script>
					
				let fileNo = 1;
			
			    function createElement(e, file) {
			      
			      const li = document.createElement('li');
			      const close = document.createElement('button');
			      const pImg = document.createElement('img');
			      li.setAttribute('class', 'image-list');
			      li.setAttribute('id', "file" + fileNo)
			      pImg.setAttribute('src', e.target.result);
			      pImg.setAttribute('data-file', file.name);
			      pImg.setAttribute('class', 'pImg');
			      close.setAttribute('class', 'close-btn');
			      close.setAttribute('type', 'button');
			      close.setAttribute('onclick', 'deleteFile('+fileNo+')')

			      
			      li.appendChild(pImg);
			      li.appendChild(close);
			      
			      fileNo++;
			      
			      return li;
			    }
			
			    function createFileTag(){
			    	const fileTag = document.querySelector('#no' + fileNo);
			    	const fi = document.createElement('input');
			    	fi.setAttribute('type', 'file');
			        fi.setAttribute('class', 'real-upload');
			        fi.setAttribute('accept', 'image/*');
			        fi.setAttribute('onchange', 'addFile(this);');
			        fi.setAttribute('id', "no" + (fileNo + 1));
			        fi.setAttribute('name', 'files');
			        fileTag.after(fi);
			    	
			    }

			    const realUpload = document.querySelector('.real-upload');
			    const upload = document.querySelector('.upload');
			    
			    function clickfunction(){
			    	const filebutton = document.querySelector('#no' + fileNo);
			    	filebutton.click();
			    }
			    
			    upload.addEventListener('click', ()=> clickfunction());
			    
			    
			    
				
				/* 첨부파일 추가 */
				function addFile(obj){
				    var maxFileCnt = 1;   // 첨부파일 최대 개수
				    var attFileCnt = document.querySelectorAll('.image-list').length;    // 기존 추가된 첨부파일 개수
				    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
				    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
				    const imagePreview = document.querySelector('.image-preview');
				
				    // 첨부파일 개수 확인
				    if (curFileCnt > remainFileCnt) {
				        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
				    }
				
				    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
				
				        const file = obj.files[i];
				
				        // 첨부파일 검증
				        if (validation(file)) {
				            // 파일 배열에 담기
				            var reader = new FileReader();
							reader.onload = (e) => {
			            		createFileTag();
			            		const preview = createElement(e, file);
			           			imagePreview.appendChild(preview);
			           			upload.style.display = "none";
			            	};
			          		reader.readAsDataURL(file);
				            
				        } else {
				            continue;
				        }
				    }
				    // 초기화
				    //document.querySelector("input[type=file]").value = "";
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
				    upload.style.display = "block";
				}
				
				function deleteOriginal(num) {
				    document.querySelector("#file" + num).remove();
				    document.querySelector("#no" + num).remove();
				    upload.style.display = "block";
				}
				

			  </script>
		</div>
		<!-- enctype="multipart/form-data" -->
	<form action="<c:url value='/board/profileMN'/>" method="post" enctype="multipart/form-data" >
		<input type="file" class="real-upload" accept="image/*" onchange="addFile(this);" id="no0" name="Original">
		<input type="file" class="real-upload" accept="image/*" onchange="addFile(this);" id="no1" name="files">
		<div class="form-group-e">
			<br>
			<label>닉네임</label>
			<input type="text" class="form-control" name="me_nick" value="${user.me_nick}" placeholder="변경할 닉네임을 입력하세요.">
		</div>
		<div class="form-group-e">
			<label>비밀번호</label>
			<input type="password" class="form-control" name="me_pw" placeholder="변경할 비밀번호를 입력하세요.">
		<p>*비밀번호는 영문,숫자,특수문자를 사용하여 8~20자이내에 작성.</p>
		</div>
		<div class="form-group-e">
			<label>비밀번호 확인</label>
			<input type="password" class="form-control" name="me_pwr" placeholder="변경할 비밀번호를 입력하세요.">
		</div>
		<br>
		<div class="form-group-e">
			<label>[거래가능 지역]</label>
			
			<br>
			<div class="form-group">
				<label>시/도</label>
				<select name="large" class="form-control">
					<c:if test="${not empty userCity.ci_large}">
						<option selected>${userCity.ci_large}/${userCity.ci_medium}/${userCity.ci_small}</option>
					</c:if>	
					<c:forEach items="${large}" var="name">
						<option>${name.ci_large}</option>	
					</c:forEach>
				</select>
			</div>
			<div class="medium-box">
				<label>시/군/구</label>
				<select name="medium" class="form-control">
					<option value="0">시/군/구 선택</option>
				</select>
			</div>
			<div class="small-box">
				<label>읍/면/동</label>
				<select name="me_ci_num" class="form-control">
					<option value=0>읍/면/동 선택</option>
				</select>
			</div>
			<p>*읍/면/동까지 선택하지 않으면 수정되지 않습니다.</p>
		</div>
		<div class="form-group">
			<label>소개글</label>
			<textarea id="summernote" name="pf_text" class="form-control" rows="10">${profile.pf_text }</textarea>
		</div>
		<button class="btn btn-outline-success col-12">등록</button>
	</form>
	</div>
	<script>
	$(document).ready(function () {
        $(".medium-box").hide();
        $(".small-box").hide();
    });
	
      $('#summernote').summernote({
        placeholder: '소개글 내용.',
        tabsize: 2,
        height: 300
      });
      
      $('[name=large]').change(function(){
    	    $(".medium-box").show();
			let largeName = $(this).val();
			//medium태그에 넣을 option태그
			let str = '<option value="0">시/군/구 선택</option>';
			//시도를 선택하세요를 선택하면
			if(largeName == 0){
				$('[name=medium]').html(str);
				$('[name=me_ci_num]').html('<option value="0">읍/면/동 선택</option>');
				return;
			}
			$.ajax({
				async : false,
				url : '<c:url value="/board/medium"/>', 
				type : 'post', 
				data : {large : largeName}, 
				success : function (data){
					for(medium of data){
						str += `<option>\${medium.ci_medium}</option>`
					}
					$('[name=medium]').html(str);
					$('[name=me_ci_num]').html('<option value="0">읍/면/동 선택</option>');
				}, 
				error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
			});
		})
		
		$('[name=medium]').change(function(){
			 $(".small-box").show();
			let mediumName = $(this).val();
			//medium태그에 넣을 option태그
			let str = '<option value="0">읍/면/동 선택</option>';
			//시도를 선택하세요를 선택하면
			if(mediumName == 0){
				$('[name=me_ci_num]').html(str);
				return;
			}
			$.ajax({
				async : false,
				url : '<c:url value="/board/small"/>', 
				type : 'post', 
				data : {medium : mediumName}, 
				success : function (data){
					for(small of data){
						console.log(data)
						str += `<option value="\${small.ci_num}">\${small.ci_small}</option>`
					}
					$('[name=me_ci_num]').html(str);
				}, 
				error : function(a,b,c){
					console.log(a);
					console.log(b);
					console.log(c);
				}
			});
		})
    </script>
</body>
</html>
