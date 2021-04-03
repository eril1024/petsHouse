<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap -->
<link href="/resources/sidemenu/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- styles -->
<link href="/resources/sidemenu/css/styles.css" rel="stylesheet">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">

<style>
.tab-item {
	width: 1000;
}

a {
	cursor: pointer;
}

select {
	width: 120px;
	height: 30px;
	font-size: 18px;
}
</style>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/resources/sidemenu/https://code.jquery.com/jquery.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="/resources/sidemenu/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/sidemenu/js/custom.js"></script>

<script type="text/javascript">

  	function fire_ajax_submit(id) {

    	var category = {}
    	
    	category["category"] = $("#category").val();

    	var url = "/category/smallcategory/"+id;

    $.ajax({
    	
        type: "POST",
        contentType: 'application/json; charset=utf-8',
  		url: url,
     	data: JSON.stringify(category), 
        cache : false,
        
    
        success: function (data) { 
          console.log("SUCCESS : ", data);
       
          $('#input').html(data);
	
 
        },
        
        error: function (e) {
      console.log("ERROR : ", e);
      
        }
    });

}
  	
  	
  	function select_submit(arr) {
    	console.log(arr);
    	var category = {}
    	category["category"] = $("#category").val();
    	
    	var url = "/category/"+arr;
    	
    	
    $.ajax({
        type: "POST",
        contentType: 'application/json; charset=utf-8',
  		url: url,
        data: JSON.stringify(category), 
        cache : false,
        
        success: function (data) { 
        	
          console.log("SUCCESS : ", data);
       
          $('#input').html(data);
		  console.log(id);

        },
        error: function (e) {
      console.log("ERROR : ", e);
  
        }
    });

}
   
</script>
</head>


<body>



	<div class="row">
		<div class="col-lg-3">
			<div class="filter-widget"></div>

			<br>
			<br>
			<!-- 카테고리 부트스트랩 start -->

			<div class="sidebar" style="display: block;">
				<ul class="nav">
					<li class="submenu">
						<!-- 고양이 --> <a href="#" style="font-size: 25px;"> <i
							class="fas fa-cat"></i>${category[0].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- Sub menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo" begin="0" end="6">


								<li><a href="#" style="font-size: 18px;"
									onclick="fire_ajax_submit(${vo.category_id});">${vo.categoryname}</a></li>


							</c:forEach>
						</ul>
					</li>
				</ul>


				<!-- 강아지 -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 25px;">

							<i class="fas fa-dog"></i>${category[1].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- Sub menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo2" begin="7" end="13">


								<li><a href="#" style="font-size: 18px;"
									onclick="fire_ajax_submit(${vo2.category_id});">${vo2.categoryname}</a></li>



							</c:forEach>
						</ul></li>
				</ul>

				<!-- 조류 -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 25px;">
							<i class="fas fa-frog"></i>${category[2].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- Sub menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo3" begin="14" end="17">


								<li><a href="#" style="font-size: 18px;"
									onclick="fire_ajax_submit(${vo3.category_id});">${vo3.categoryname}</a></li>


							</c:forEach>
						</ul></li>
				</ul>

				<!-- 어류 -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 25px;">
							<i class="fas fa-fish"></i>${category[3].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- Sub menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo4" begin="18" end="24">


								<li><a href="#" style="font-size: 18px;"
									onclick="fire_ajax_submit(${vo4.category_id});">${vo4.categoryname}</a></li>


							</c:forEach>
						</ul></li>
				</ul>

				<!-- 파충류 -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 25px;">
							<i class="fas fa-crow"></i>${category[4].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- Sub menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo5" begin="25" end="29">


								<li><a href="#" style="font-size: 18px;"
									onclick="fire_ajax_submit(${vo5.category_id});">${vo5.categoryname}</a></li>


							</c:forEach>
						</ul></li>
				</ul>

				<!-- 기타 -->
				<ul class="nav">
					<li class="submenu"><a href="#" style="font-size: 25px;">
							<i class="fas fa-paw"></i>${category[5].categoryname}<span
							class="caret pull-right"></span>
					</a> <!-- Sub menu -->
						<ul>
							<c:forEach items="${smallcategory}" var="vo6" begin="30" end="36">


								<li><a href="#" style="font-size: 18px;"
									onclick="fire_ajax_submit(${vo6.category_id});">${vo6.categoryname}</a></li>


							</c:forEach>
						</ul></li>
				</ul>

			</div>




			<!--  카테고리 부트스트랩 end -->



		</div>



		<div class="col-lg-9">
			<div class="row">

				<div class="dropdown">
    <button type="button" style="font-size:20px; color:black;background-color:white; border:none; " class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
     카테고리별
    </button>
    <div class="dropdown-menu">
    <a class="dropdown-item" style="font-size:20px;" href="/category/home">최신순</a>
     <!--   <a class="dropdown-item" style="font-size:20px;" href="/category/highprice">가격 높은순</a> -->
     <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highprice')">가격 높은순</a> 
      <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('rowprice')">가격 낮은순</a>
      <a class="dropdown-item" style="font-size:20px;" href="#" onclick="select_submit('highstar')">별점 높은순</a>
    
    </div>
  </div>




				<div class="row text-center">
				
				<c:forEach items="${smallgoods}" var="goods" varStatus="status">
                       
                           <div class="product-item">
                              <div class="pi-pic">
                                 <img src="/resources/img/goods/goods_01.jpg" alt="">
                     			 </div>
                              <div class="pi-text">
                                 <div class="catagory-name"></div>
                             
                                    
                                       <a href="/admin/goods_detail/${goods.board_id}">
                                          <h5>${goods.goodsVO.goodsname}</h5>
                                       </a>
                                       <div class="product-price">${goods.goodsVO.price}원</div>
         						   별점 <span class="star-prototype">${rate[status.index].avgscore}</span>
                                 &nbsp; <span>리뷰 ${rate[status.index].count}</span>      
                              </div>
                           </div>
                              </c:forEach> 
				
				
				
					<%-- <c:forEach items="${smallgoods}" var="dto">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<img class="card-img-top"
									src="https://t1.daumcdn.net/cfile/blog/26661E4655C8AE7509">
								<div class="card-body">

									<h4 class="card-title">${dto.goodsVO.goodsname}</h4>
									<p class="card-text">${dto.goodsVO.price}원</p>
									<p class="card-text">${dto.goodsVO.description}</p>
									<p class="card-text">${dto.pdate}</p>


								</div>

							</div>
						</div>
					</c:forEach>
 --%>

				</div>





			</div>
		</div>
	</div>

</body>
</html>