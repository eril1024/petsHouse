<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠타운</title>
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script>
	$(function() {

		$("#sel").change(function() {

			location.href = "/map/home"

		});

	});
</script>

<style>

#navbars>li:nth-child(1) {
   background-color: #e7ab3c;
}

select {
	width: 100px; /* 원하는 너비설정 */
	padding: .4em .5em; /* 여백으로 높이 설정 */
	font-family: inherit; /* 폰트 상속 */
	background: url('이미지 경로') no-repeat 95% 50%;
	/* 네이티브 화살표를 커스텀 화살표로 대체 */
	border-radius: 5px; /* iOS 둥근모서리 제거 */
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.box {
	margin: 50px auto;
	width: 500px;
}

#file {
	display: none;
}

#preview {
	width: 770px;
	min-height: 180px;
	padding: 10px;
	background-color: #f5f5f5;
	border-radius: 10px;
}

 

#preview:empty:before {
	content: attr(data-placeholder);
	color: #999;
	font-size: .9em;
}

.title {
	margin-bottom: 40px;
}

.form-1 {
	width: 1000px;
}

label {
	text-align: cente;
	}

</style>

</head>
<body style="padding-top: 180px">

	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="width: 800px; padding-bottom:150px;">

			<!-- 위치 다시 선정하기 -->
					<i class="fas fa-paw"></i><span style= "font-size: 18px;"> ${location}</span>
					<br> <br>
					<i class="fas fa-paw"></i><a href="/map/home"><span style= "font-size: 15px;"> 위치 다시 설정하기</span></a>
					<br> <br>



		<form action="/map/write" method="post" enctype="multipart/form-data">
			<input id="location" type="hidden" name="location" value="${location}" />

			<input type="hidden" name="member_id" value="<sec:authentication property="principal.member_id"/>">
		

			<div class="row">
				<select name="hashtag" id="hashtag" class=" form-control col-2"
					style="height: 38px; margin-left: 15px; margin-right: 10px;">
					<option value="우리동네">우리동네</option>
								<option value="분실/실종">분실/실종</option>
								<option value="동물병원">동물병원</option>
								<option value="산책로">산책로</option>
								<option value="나눔마켓">나눔마켓</option>
								<option value="애완용품샵">애완용품샵</option>
								<option value="기타">기타</option>
				</select> 
				
				
			</div>







			<textarea class="form-control col" name="content" placeholder="내용"
				style="width: 770px; height: 400px; margin-bottom: 20px; resize: none;"></textarea>
				
			<div class="custom-file">
			<input type="file" class="custom-file-input" id="btnAtt" multiple="multiple" name="btnAtt" style="display: block;"
			required> <label class="custom-file-label" for="inputGroupFile02">사진을 선택하세요.</label>
			</div>

			
					<div class="form-group row">
						<label class="col-sm-2"></label>
						<div class="input-group col-lg-12 ">
							<div id='image_preview '>
								<div id='preview'
									data-placeholder='이미지를 첨부 하려면 파일 선택 버튼을 클릭하거나 이미지를 드래그앤드롭 하세요 *최대 10장까지'></div>
							</div>
						</div>
					</div>	

			<input class="form-control col-sm-1" style="position:fixed; background-color: #FFC81E; 
			 color:black; top: 170px; right: 130px;" type="submit" value="작성 완료">
				
				






		</form>
	</div>


<script>
	
		(function() {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll('.needs-validation')

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.classList.add('was-validated')
				}, false)
			})
		})();

		 
	</script>

	<script>
 
	 
	
	
			
( /* preview : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(preview, btn){

    var attZone = document.getElementById(preview);
    var btnAtt = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:121px;height:150px;margin:3px; ;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
   
    var chk_style = 'position:absolute;font-size:13px;'
        + 'right:0px;top:0px;z-index:999;opacity:.8;';
        
    btnAtt.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
  
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
      
    }, false)
  
    attZone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      for(f of files){
        imageLoader(f);
      }
      
    }, false)
    

    
    /*첨부된 이미리들을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'X')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        btnAtt.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('preview', 'btnAtt')

</script>



	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>


	<!-- Js Plugins -->
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.zoom.min.js"></script>
	<script src="/resources/js/jquery.dd.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>




</body>
</html>