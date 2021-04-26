<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>펫츠하우스</title>
<!-- Css Styles -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
<link rel="stylesheet" href="/resources/css/select-style.css"
	type="text/css">
<link rel="stylesheet" href="/resources/js/select-index.js"
	type="text/css">

<style>

#hashtag:hover{
background-color:#dddddd;
}
#navbars>li:nth-child(1) {
   background-color: #e7ab3c;
}

.count {
	position: absolute;
	bottom: 85px;
	right: 40px;
	font-size: 13px;
	color: #fff;
	text-shadow: 0 0 4px rgb(0 0 0/ 50%);
}

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

.more {
	font-size: 13px;
	padding: 0.01px;
}

.profile_box {
	width: 40px;
	height: 40px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile {
	width: 40px;
	height: 40px;
	object-fit: cover;
}
</style>
<script>

</script>
</head>

<body style="padding-top: 180px">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">

		
		<input type="hidden" name="keyword" value="${param.keyword}">
		
		<h5><b>'${param.keyword}'</b>에 대한 검색결과 <b>${scount}건</b></h5>
			<br><br>
		


				<div id="snslist" class="row text-center">
					<c:forEach items="${moresns}" var="ms">
						<div class=" col-12 col-md-4 col-lg-3">

							<div class="user-Info row" style="margin: 20px auto 0px 5px">
								<div class="profile_box ">

									<img
										src="/resources/img/member/profile/${ms.boardVO.memberVO.thumbnail}"
										name="profile" alt="" class="profile" />
								</div>
								<div style="padding: 7px">${ms.boardVO.memberVO.nickname }
								</div>
								<a href="/myPage/${ms.boardVO.memberVO.nickname}"
									style="padding: 7px;"> 팔로우</a>


							</div>

							<div class="pi-pic shot">
								<a href="/commu/sns/${ms.boardVO.board_id}"> <img
									src="/resources/img/member/sns/${ms.imgname}" alt=""
										style="border-radius: 8px;height:250px; width:250px;" /><span
									class="count">조회수 ${ms.boardVO.hit}</span></a>
							</div>
								<div style="font-size : 20px; text-align:center; margin-top:8px;margin-bottom:30px; ">
							<i class="far fa-heart" style="font-size : 25px;"></i>&nbsp&nbsp${ms.boardVO.plike} 
							&nbsp&nbsp&nbsp&nbsp<c:forEach items="${ccount}" var="count">  
							<c:if test="${count.pgroup eq ms.boardVO.board_id}">
							<a href="/commu/sns/${ms.boardVO.board_id}">
							<i class="far fa-comment"  style="font-size : 25px;"></i>
							
							${count.count}</a></c:if></c:forEach></div>
						</div>


					</c:forEach>
				</div>
			
			<c:if test="${fn:length(snscount) > 12}">
                <input type="hidden" class="count" value="${fn:length(snscount)}" />
	            <div class="later col-lg-12 text-center">
	            	<button type="button" class="btn btn-warning" onClick="btnClick()">더보기</button>
		        </div>
		      </c:if>
	        
	</div>
<script>
	  var pageNum = 1;
      var check = $('.count').val() / 8;
     
      function btnClick(){
    	  pageNum += 1;
    	  
    	  if (pageNum > check) {
              $(".btn").hide();
           }
    	  
    	  console.log(pageNum);
    	  console.log(check);
    	  		  
    	  	$.ajax({
    	        type :"POST",
    	        url :"/snsmorelist",
    	        data : {
    	        	pageNum: pageNum,
    	        	keyword:"${param.keyword}"
    	        },
    	        success :function(data){
    	           console.log(data);
    	        
    	           var moresns = data.moresns;
    	           var ccount = data.ccount;    
					
    	          html = " "
    	           for(var i in moresns){
    	        	  html  += 	"<div class='col-12 col-md-4 col-lg-3'>"
								+"<div class='user-Info row' style='margin: 20px auto 0px 5px'>"
								+"<div class='profile_box '>"
								+"<img src='/resources/img/member/profile/"+moresns[i].boardVO.memberVO.thumbnail+"' name='profile' alt='' class='profile' />"
								+"</div><div style='padding: 7px'>"+moresns[i].boardVO.memberVO.nickname+"</div>"
								+"<a href='/myPage/"+moresns[i].boardVO.memberVO.nickname+"' style='padding: 7px;'> 팔로우</a></div>"
								+"<div class='pi-pic shot'><a href='/commu/sns/"+moresns[i].boardVO.board_id+"'> "
								+"<img src='/resources/img/member/sns/"+moresns[i].imgname+"' alt='' style='border-radius: 8px;height:250px; width:250px;' />"
								+"<span class='count'>조회수"+moresns[i].boardVO.hit+"</span></a></div>"
								+"<div style='font-size : 20px; text-align:center; margin-top:8px;margin-bottom:30px; '>"
								+"<i class='far fa-heart' style='font-size : 25px;'></i>&nbsp&nbsp"+moresns[i].boardVO.plike+"&nbsp&nbsp&nbsp&nbsp"
								
    	        	  for(var j in ccount){
  	       	          	if(ccount[j].pgroup == moresns[i].boardVO.board_id){
    	          			  html+="<a href='/commu/sns/"+moresns[i].boardVO.board_id+"'>"
									+"<i class='far fa-comment'  style='font-size : 25px;'></i>"
									+ccount[j].count+"</a></div></div></div>"
  	       	          	
  	       	          	}
    	        	  }//goods foreach end      	   
    	           } 
    	           
    	          
   	           if(moresns.length == 8){
		        		html += "<div class='btn col-lg-12 text-center'>"  
		            		 + "<button type='button' class='btn btn-warning' onClick='btnClick()'>더보기</button> </div>";			      
		        	}
   	           
   	          		 $('.btn').remove();
    	            $(".snslist").append(html); 
    	          
    	        }, 	        
    	        //success end
    	         error : function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				} // ajax 에러 시 end 
    	    }); //ajax end	 
      };
   </script>
   
   

	<!-- Blog Section End -->

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