<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>register</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
 <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<style>

.table_center {
	display: table;
	margin: 50px 50px;
	width: 1000px;
	font-size: 15px;
	font-stretch: extra-condensed;
}

h2 {
	text-align: center;
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
</style>

</head>
<body  >



	 

	<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>


	<!-- Page Content -->


	<div class="col-lg-12">
		<form id="goods" name="goods" class="needs-validation" enctype="multipart/form-data"
			action="${pageContext.request.contextPath}/admin/goods/register"
			method="post">
			<fieldset>
				<table class="table_center" cellpadding="20">
					<td colspan="20">
						<h2>상품 등록</h2>
					</td>
					<tr>
						<td><img style="width: 400px;" id="preview-image" name="preview-image"
							src="https://dummyimage.com/600x500/ffffff&text=+privew"></td>
						<%-- 	<%=request.getRealPath("/")%> 저장경로 --%>
						<td>
							<div class="form-group row">
								<label class="col-sm-3" for="thumbnail">썸네일</label>
								<div class="input-group col-sm-9">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="thumbnail"
											name="file" multiple="multiple" style="display: block;"> <label
											class="custom-file-label" for="inputGroupFile02">Choose
											file</label>
									</div>
									<div class="input-group-append">
										<span class="input-group-text">Upload</span>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3">상품명</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="goodsname"
										id="goodsname" placeholder="상품명을 등록하세요" required>
								 
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-3">가격</label>
								<div class="col-sm-9">
									<input type="text" name="price" class="form-control"
										placeholder="상품가격을 등록하세요" aria-describedby="priceHelp"
										required>
									 
									<small id="priceHelp" class="form-text text-muted">예)
										15000 </small>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-3">옵션 1</label>
								<div class="col-sm-9">
									<input type="text" name="psize" class="form-control"
										placeholder="사이즈를 입력하세요" aria-describedby="sizeHelp">
									<div class="invalid-feedback">없으면 공백 추가!</div>
									<small id="sizeHelp" class="form-text text-muted">예)
										S,M,L</small>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-3">옵션 2</label>
								<div class="col-sm-9">
									<input type="text" name="pcolor" class="form-control"
										id="pcolor" placeholder="색상을 입력하세요"
										aria-describedby="colorHelp">
									<div class="invalid-feedback">없으면 공백 추가!</div>
									<small id="colorHelp" class="form-text text-muted">예)
										빨간색, 노란색 </small>
								</div>
							</div>

							<div class="form-group row">
								<label class="col-sm-3">카테고리</label>
								<div class="col-sm-9">
									<label>1차 분류</label> <select class="category1"
										class="form-control"
										style="vertical-align: middle; text-align-last: center">
										<option value="">동물</option>
									</select> <label>2차 분류</label> <select class="category2"
										name="categoryVO.category_id" class="form-control"
										style="vertical-align: middle; text-align-last: center"
										required>
										<option value="">상품</option>
									</select>
									<div class="invalid-feedback"> 카테고리를 선택하세요! </div>
								</div>
							</div>


							<div class="form-group row">
								<label class="col-sm-3">재고상태</label>
								<div class="col-sm-9">
									<select name="stockVO.stock_id"
										style="vertical-align: middle; text-align-last: center"
										required>
										<c:forEach items="${stock}" var="stock">
											<option value="${stock.stock_id}">${stock.stockname}
											</option>
										</c:forEach>
									</select>
									<div class="invalid-feedback">재고상태를 선택하세요!</div> 
								</div>
							</div>


							<div class="form-group row">
								<label class="col-sm-3">상품소개</label>
								<div class="col-sm-9">
									<textarea name="description" cols="30" rows="5"
										class="form-control" required></textarea>
								</div>
							</div>


							<div class="form-group row">
								<div class="col-sm-offset-2 col-sm-6">
									<button type="submit" class="btn btn-block" id="check"
										style="background-color: #FFC81E;  color:black;">상품등록</button>
									<%-- 	data-toggle="modal"
										data-target="#Modal"  --%>
								</div>




								<div class="col-sm-offset-2 col-sm-6">
									<input type="button" class="btn btn-block"
										style="background-color: #FFC81E;  color:black;" value="상품목록"
										onClick="location.href='${pageContext.request.contextPath}/admin/goods'">
								</div>
							</div>
						</td>
					</tr>


				</table>
			</fieldset>
		</form>
	</div>


	<script>
	
	(function () {
		  'use strict'

		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  var forms = document.querySelectorAll('.needs-validation')

		  // Loop over them and prevent submission
		  Array.prototype.slice.call(forms)
		    .forEach(function (form) {
		      form.addEventListener('submit', function (event) {
		        if (!form.checkValidity()) {
		          event.preventDefault()
		          event.stopPropagation()
		        }

		        form.classList.add('was-validated')
		      }, false)
		    })
		})();
		
		
		//
		  	function readImage(input) {
			    // 인풋 태그에 파일이 있는 경우
			    if(input.files && input.files[0]) {
			        // 이미지 파일인지 검사 (생략)
			        // FileReader 인스턴스 생성
			        const reader = new FileReader()
			        // 이미지가 로드가 된 경우
			        reader.onload = e => {
			            const previewImage = document.getElementById("preview-image")
			            previewImage.src = e.target.result
			        }
			        // reader가 이미지 읽도록 하기
			        reader.readAsDataURL(input.files[0])
			    }
			}
			// input file에 change 이벤트 부여
			const thumbnail = document.getElementById("thumbnail")
			thumbnail.addEventListener("change", e => {
			    readImage(e.target)
			})
			
			 $("#thumbnail").change(function(){
			 if(this.files && this.files[0]) {
			  var reader = new FileReader;
			
			 reader.readAsDataURL(this.files[0]);
			}
			}); 

			// 컨트롤러에서 데이터 받기
			var jsonData = JSON.parse('${category}');
			console.log(jsonData);

			var cate1Arr = new Array();
			var cate1Obj = new Object();

			// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
			for (var i = 0; i < jsonData.length; i++) {

				if (jsonData[i].level == "1") {
					cate1Obj = new Object(); //초기화
					cate1Obj.category_id = jsonData[i].category_id;
					cate1Obj.categoryname = jsonData[i].categoryname;
					cate1Arr.push(cate1Obj);
				}
			} 

			// 1차 분류 셀렉트 박스에 데이터 삽입
			var cate1Select = $("select.category1")

			for (var i = 0; i < cate1Arr.length; i++) {
				cate1Select.append("<option value='" + cate1Arr[i].category_id + "'>"
								+ cate1Arr[i].categoryname + "</option>");
			}

			$(document).on("change","select.category1",
							function() {

								var cate2Arr = new Array();
								var cate2Obj = new Object();

								// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
								for (var i = 0; i < jsonData.length; i++) {

									if (jsonData[i].level == "2") {
										cate2Obj = new Object(); //초기화
										cate2Obj.category_id = jsonData[i].category_id;
										cate2Obj.categoryname = jsonData[i].categoryname;
										cate2Obj.code = jsonData[i].code;

										cate2Arr.push(cate2Obj);
									}
								}

								var cate2Select = $("select.category2");

								/*
								for(var i = 0; i < cate2Arr.length; i++) {
								  cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
								       + cate2Arr[i].cateName + "</option>");
								}
								 */

								cate2Select.children().remove();

								$("option:selected", this).each(function() {

											var selectVal = $(this).val();
													
											
											cate2Select.append("<option value='" + selectVal + "'>전체</option>");

													for (var i = 0; i < cate2Arr.length; i++) {
														if (selectVal == cate2Arr[i].code) {
															cate2Select.append("<option value='" + cate2Arr[i].category_id + "'>"
																			+ cate2Arr[i].categoryname + "</option>");
														}
													}

												});

							});
			
			</script>
 
</body>
</html>
