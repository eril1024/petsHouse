<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>프로필</title>

<!-- bootstrap css cdn --<!-- > -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css" />

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.1.min.js" type="application/javascript"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
	.user-profile__container {
		border-radius: 4px;
		border: 1px solid #dadce0;
		text-align: center;
		min-height: 350px;
		margin: 20px auto;
	}
	
	.sns_container, .review_container, .qna_container, .knowhow_container {
		border-radius: 4px;
		border: 1px solid #dadce0;
		text-align: center;
		min-height: 200px;	
	}
	
	.sns_container div, .review_container div, .qna_container div, .knowhow_container div{
		height:200px; 
		line-height:200px;
	}

	.box {
		width: 130px;
		height: 130px;
		border-radius: 70%;
		overflow: hidden;
		margin: 10px auto;
	}
	
	.profile {
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.profile_box {
		width: 40px;
		height: 40px;
		border-radius: 70%;
		overflow: hidden;
		margin: 5px;
	}
	
	.sns, .knowhow, .qna, .review{
		padding-top: 20px;
		padding-left: 20px;
		padding-bottom: 50px;
	}
	
	.sns img, .knowhow img, .review img{
		width:250px; 
		height:250px;
		border-radius: 8px;
	}
	
	.sns_hit{
		position: absolute;
	    bottom: 50px;
	    right: 35px;
	    font-size: 15px;
	    color: #fff;
	    text-shadow: 0 0 4px rgb(0 0 0 / 50%);
	}
	
	.knowhow_hit{
		position: absolute;
	    bottom: 45px;
	    right: 35px;
	    font-size: 15px;
	    color: #fff;
	    text-shadow: 0 0 4px rgb(0 0 0 / 50%);
	}
	
	.total {
		color: #FFBF00;
		font-weight: bold;
		font-size: 20px;
	}
	
	.more{
		float: right; 
		padding: 10px 20px 0px 0px;
		color: #FFBF00;
		font-size: 16px;
	}
	
	a:link {
		text-decoration: none;
		color: #333333;
	}
	
	a:visited {
		text-decoration: none;
		color: #333333;
	}
	
	a:active {
		text-decoration: none;
		color: #333333;
	}
	
	a:hover {
		text-decoration: none;
	}

	span.star-prototype, span.star-prototype>*, span.star, span.star>* {
	   height: 16px;
	   background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
	   display: inline-block;
	}
	
	span.star-prototype>*, span.star>* {
	   background-position: 0 0;
	   max-width: 80px;
	}
	
	#navbars>li:nth-child(4) {
  		background-color: #e7ab3c;
	}
	
</style>

<script>
   $(document).ready(function() {
      $.fn.generateStars = function() {
         return this.each(function(i, e) {
            $(e).html($('<span/>').width($(e).text() * 16));
         });
      };

      // 숫자 평점을 별로 변환하도록 호출하는 함수
      $('.star-prototype').generateStars();
   });
</script>

</head>
<body style="padding-top: 200px;">
	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container" style="min-height: 900px;">
    	<div class="row">
			<div class="col-lg-3 wrap--profile">	
				<form id="myPage" name="myPage" action="${pageContext.request.contextPath}/commu/thumbnail" method="post">
					<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
						<input type="hidden" id="member_id" value="<sec:authentication property="principal.member_id" var="follower_id" />">
					</sec:authorize>
						
				<div class="user-profile__container">
					<div class="user-profile__profile-image box" style="background: #BDBDBD;">
						<a href="/myPage/${member.nickname}">
						<img src="/resources/img/member/profile/${member.thumbnail}" class="profile" /></a>
					</div>

					<div class="profile-info">
						<div class="profile-info__name">
							<input type="hidden" id="member" value="${member.nickname}" />
							<a href="/myPage/${member.nickname}"><h3 style="margin-bottom:10px;">${member.nickname}</h3></a>
							<a href="#followerModal" class="follower" data-toggle="modal">팔로워<span class="highlight">${follower}&nbsp;&nbsp;</span> </a>
				          	<a href="#followingModal" data-toggle="modal">팔로잉<span class="highlight">${following}</span></a>
						</div>
				
						<!-- follower list Modal start -->
					    <div class="modal" id="followerModal">
						  <div class="modal-dialog">
				  	    	  <div class="modal-content">			      
									<!-- Modal Header -->
									<div class="modal-header">
										<h5 class="modal-title">팔로워 회원 목록</h5>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
										        
									<!-- Modal body -->
									<div class="followerlist modal-body row">
									 <c:if test="${empty followerlist}">
								    	<span style="margin:15px;">팔로워 회원이 없습니다.</span>
								    </c:if>
								     <c:if test="${not empty followerlist}">	
                           				<c:forEach items="${followerlist}" var="followerlist">
                              				<div class="profile_box" style="margin-left:15px;">
                              					<a href="/myPage/${followerlist.memberVO.nickname}">
                              					<img src="/resources/img/member/profile/${followerlist.memberVO.thumbnail}" class="profile" />
                              				</div>
                              				<div style="padding-top:10px;">${followerlist.follower_id}</div></a>
                          				</c:forEach>
                          			</c:if>
                        			</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" class="btn" style="background-color: #FFC81E; color:black;" data-dismiss="modal">닫기</button>
									</div>            
								</div>
							</div>
						</div>
						<!-- follower list Modal end -->
								   
						<!-- following list Modal start -->
						<div class="modal" id="followingModal">
							<div class="modal-dialog">
								<div class="modal-content">
								      
									<!-- Modal Header -->
									<div class="modal-header">
								       <h5 class="modal-title">팔로잉 회원 목록</h5>
								       <button type="button" class="close" data-dismiss="modal">&times;</button>
								    </div>
								        
								    <!-- Modal body -->
								    <div class="modal-body row">
								    <c:if test="${empty followinglist}">
								    	<span style="margin:15px;">팔로잉 회원이 없습니다.</span>
								    </c:if>
								    
								    <c:if test="${not empty followinglist}">		
								        <c:forEach items="${followinglist}" var="followinglist">
                              				<div class="profile_box" style="margin-left:15px;">
                              					<a href="/myPage/${followinglist.memberVO.nickname}">
                              					<img src="/resources/img/member/profile/${followinglist.memberVO.thumbnail}" class="profile" />
                              				</div>
                              				<div style="padding-top:10px;">${followinglist.memberVO.nickname}</div></a>
                          				</c:forEach>
                          			</c:if>							        
								    </div>
								        
								    <!-- Modal footer -->
								    <div class="modal-footer">
								        <button type="button" class="btn" style="background-color: #FFC81E; color:black;" data-dismiss="modal">닫기</button>
								    </div>
								 </div>
							</div>
						</div>
						<!-- following list Modal end -->
							 
						<!-- 본인 계정인 경우 수정 버튼 발생, principal로 확인-->	   	
						<c:if test="${member.member_id eq follower_id}">
							<div class="profile-info__actions" style = "padding-top : 50px;">
								<a class="btn" href="/myPage/updateMember" style="background-color: #FFC81E; color:black;">설정</a>
							</div>
						</c:if>
								
						<!-- 본인 계정이 아닌 경우 팔로우 버튼 발생, principal로 확인-->	   	
						<c:if test="${member.member_id ne follower_id}">	
							<c:if test="${followcheck == 0}">							
								<div class="profile-info__actions" style = "padding-top : 50px;">
					        		<button type="button" class="follow btn" style="background-color: #FFC81E; color:black;" onclick="follow();">팔로우</button>
						        </div>	   
					        </c:if>		
				    	    <c:if test="${followcheck != 0}">							
								<div class="profile-info__actions" style = "padding-top : 50px;">
					     			<button type="button" class="unfollow btn" style="background-color: #FFC81E; color:black;" onclick="unfollow();">언팔로우</button>
								</div>	   
							</c:if>		
						</c:if>					
					</div>
					</div>
					</form>
				</div>
				<!-- profile Content End-->
				
				<div class="col-lg-9 wrap--profile">	
					<!-- SNS 게시글 조회 -->
					<div class="sns row">
						<c:if test="${empty sns}">
							<div class="col-12"> 
								<span style="font-size:20px;font-weight: bold;">SNS </span> <span class="total">${snsTotal}</span><hr />		
							</div>
							<div class="col-12 sns_container">
								<div>SNS를 작성해주세요</div>
							</div>
						</c:if>
						<c:if test="${not empty sns}">							
							<div class="col-12"> 
								<span style="font-size:20px;font-weight: bold;">SNS </span> <span class="total">${snsTotal}</span>
								<a href="/myPage/sns?nickname=${member.nickname}" class="more">더보기</a><hr />		
							</div>	
							<c:forEach items="${sns}" var="sns">
								<c:if test="${sns.rnum le 3}">
									<div class="col-lg-4 col-md-4 col-sm-4 wrap--profile text-center">	
										<a href="/commu/sns/${sns.boardVO.board_id}"> 
										<img src="/resources/img/member/sns/${sns.imgname}" style="margin-bottom:10px"/></a>								
										<span class="sns_hit">조회수 ${sns.boardVO.hit}</span>					
										<a href="/commu/sns/${sns.boardVO.board_id}"><i class="far fa-heart" style="font-size:20px;"></i>&nbsp;&nbsp;${sns.boardVO.plike}</a>
										
										<c:forEach items="${comment}" var="comment">  
											<c:if test="${comment.pgroup eq sns.boardVO.board_id}">
												<a href="/commu/sns/${sns.boardVO.board_id}">
												<i class="far fa-comment" style="margin-left:20px; font-size:20px;"></i>&nbsp;&nbsp;${comment.count}</a>								
											</c:if>
										</c:forEach>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
				
					<!-- 노하우 게시글 조회 -->
					<div class="knowhow row">	
						<c:if test="${empty knowhow}">
							<div class="col-12"> 
								<span style="font-size:20px;font-weight: bold;">노하우 </span> <span class="total">${knowhowTotal}</span><hr />		
							</div>
							<div class="col-12 knowhow_container">
								<div>노하우를 작성해주세요</div>
							</div>
						</c:if>
						<c:if test="${not empty knowhow}">							
							<div class="col-12"> 
								<span style="font-size:20px;font-weight: bold;">노하우 </span> <span class="total">${knowhowTotal}</span>
								<a href="/myPage/knowhow?nickname=${member.nickname}" class="more">더보기</a><hr />	
							</div>	
							<c:forEach items="${knowhow}" var="knowhow">
								<c:if test="${knowhow.rnum le 3}">
									<div class="col-lg-4 col-md-4 col-sm-4 wrap--profile text-center">	
										<a href="/commu/tips/${knowhow.boardVO.board_id}">
										<img src="/resources/img/tips/${knowhow.imgname}" alt=""></a>								
										<span class="knowhow_hit">조회수 ${knowhow.boardVO.hit}</span>
										<h6 style="margin-top:10px;">${knowhow.boardVO.title}</h6>
									</div>
		                        </c:if>
							</c:forEach>	
						</c:if>
					</div>	
					
					<!-- 리뷰 게시글 조회 -->
					<div class="review row">
						<c:if test="${empty review}">
							<div class="col-12"> 
								<span style="font-size:20px;font-weight: bold;">리뷰 </span> <span class="total">${reviewTotal}</span><hr />							
							</div>	
							<div class="col-12 review_container">
								<div>리뷰를 작성해주세요</div>
							</div>
						</c:if>
						<c:if test="${not empty review}">
							<div class="col-12"> 
								<span style="font-size:20px;font-weight: bold;">리뷰 </span> <span class="total">${reviewTotal}</span>
								<a href="/myPage/review?nickname=${member.nickname}" class="more">더보기</a><hr />						
							</div>	
							<c:forEach items="${review}" var="review">
								<c:if test="${review.rnum le 3}">
									<div class="col-lg-4 col-md-4 col-sm-4 wrap--profile text-center">
										<c:forEach items="${boardlist}" var="boardlist">
											<c:if test="${boardlist.goodsVO.goods_id eq review.goodsVO.goods_id}">	
												<a href="/admin/goods_detail/${boardlist.board_id}">
												<img src="/resources/img/admin/goods/${boardlist.goodsVO.thumbnail}"/></a>
											</c:if>		
										</c:forEach>											
										<h6 style="padding-top:10px;">${review.goodsVO.goodsname}</h6>
										
										 <c:forEach items="${goodsscore}" var="rate">
		                             		 <c:if test="${rate.goodsVO.goods_id eq review.goodsVO.goods_id}">
				                                 <span class="star-prototype"> ${rate.avgscore}</span>
		                                		 &nbsp; <span>리뷰 ${rate.count}</span>
		                               	  	 </c:if>
	                                 	</c:forEach>
									</div>
								</c:if>
							</c:forEach>	
						</c:if>	
					</div>	
					
					<!-- Q&A 게시글 조회 -->
					<div class="qna row">
						<c:if test="${empty qna}">
							<div class="col-12"> 
								<span style="font-size:20px;font-weight: bold;">질문과답변 </span> <span class="total">${qnaTotal}</span><hr />							
							</div>	
							<div class="col-12 qna_container">
								<div>질문과답변을 작성해주세요</div>
							</div>
						</c:if>
						<c:if test="${not empty qna}">
							<div class="col-12"> 
								<span style="font-size:20px;font-weight: bold;">질문과답변 </span> <span class="total">${qnaTotal}</span>
								<a href="/myPage/qna?nickname=${member.nickname}" class="more">더보기</a><hr />		
							</div>	
							<div class="col-12"> 
								<c:forEach items="${qna}" var="qna">
									<c:if test="${qna.rnum le 5}">
										<form action="/commu/qnatag" method="get">
											<a href="/commu/qna/${qna.board_id}">
												<div style="font-weight: normal; font-size: 18px;">${qna.title}</div>
													<div>${qna.content}</div>									
													<span style="font-size: 15px; color: gray;"><fmt:formatDate value="${qna.pdate}" pattern="yyyy.MM.dd" /></span>
													<span style="font-size: 15px; color: gray;">조회수 ${qna.hit}</span>
														
													<c:set var="hashtag" value="${qna.hashtag}" />
													<c:set var="tag" value="${fn:split(hashtag, '#')}" />
													<c:forEach var="tag" items="${tag}">
														<c:if test="${not empty qna.hashtag}">
															<span><button id="hashtag" name="keyword" class="btn btn-disabled" style="" value="${tag}"
																onclick="location.href='${pageContext.request.contextPath}/search'">#${tag}</button></span>
														</c:if>
														</c:forEach>
											</a>
										</form>
										<hr />	
									</c:if>
								</c:forEach>
							</div>	
						</c:if>			
					</div>
					</div>
				</div>
			</div>
	<script>
	   	var nickname = $('#member').val();  
	   	console.log(nickname);
	  	
	   	//팔로우 요청
	    function follow(){  	         
	    	$.ajax({
	    		type :"POST",
		        url :"/myPage/follow/" + nickname,     
		        success :function(data){
		           console.log(data);	
		           var followerlist = data.followerlist;
		          
		           html = "";
		           for(var i in followerlist){
		        	   html += "<div class='profile_box' style='margin-left:15px;'>"
		        	   		+ "<a href='/myPage/" + followerlist[i].memberVO.nickname + "'>"
		        	   		+ "<img src='/resources/img/member/profile/" + followerlist[i].memberVO.thumbnail + "' class='profile' /></div>"
		        	   		+ "<div style='padding-top:10px;'>" + followerlist[i].follower_id + "</div></a>";
		           }
		          
		           html += "</div>";
		                  
		           $('.follower').empty();
		           $('.follower').append('팔로워<span>' + data.follower + '&nbsp;&nbsp;</span></a>');                 
		           $('.followerlist').empty();
		           $('.followerlist').append(html);
		           $('.follow').remove();	          
		           $('.profile-info').append('<button type="button" class="unfollow btn" style="background-color: #FFC81E; color:black;" onclick="unfollow();">언팔로우</button>');               
		        },  

		        error: function(e){
			    	console.log(e);
			    }
	   		});//ajax end
		};//follow end
	    
		//팔로우 취소
		function unfollow(){  
	    	$.ajax({
	    		type :"POST",
		        url :"/myPage/unfollow/" + nickname,
		        success :function(data){
		        	console.log(data);	
		        	var followerlist = data.followerlist;
			          
		        	html = "";
			        for(var i in followerlist){
			         	html += "<div class='profile_box' style='margin-left:15px;'>"
			       	   		 + "<a href='/myPage/" + followerlist[i].memberVO.nickname + "'>"
			        	   	 + "<img src='/resources/img/member/profile/" + followerlist[i].memberVO.thumbnail + "' class='profile' /></div>"
			        	   	 + "<div style='padding-top:10px;'>" + followerlist[i].follower_id + "</div></a>";
			           }
			          
			           html += "</div>";
			               		           
		        	$('.follower').empty();
			        $('.follower').append('팔로워<span>' + data.follower + '&nbsp;&nbsp;</span></a>');  
			        $('.followerlist').empty();
			        $('.followerlist').append(html);
		            $('.unfollow').remove();		           
		            $('.profile-info').append('<button type="button" class="follow btn" style="background-color: #FFC81E; color:black;" onclick="follow();">팔로우</button>'); 
		        },
		        error: function(e){
			    	console.log(e);
			    }
	   		});//ajax end
		};//unfollow end
	</script>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

   <!-- Bootstrap core JavaScript -->
   <script src="/resources/js/bootstrap.min.js"></script>
   <script src="/resources/js/jquery.countdown.min.js"></script>
   <script src="/resources/js/jquery.nice-select.min.js"></script>
   <script src="/resources/js/jquery.zoom.min.js"></script>
   <script src="/resources/js/jquery.dd.min.js"></script>
   <script src="/resources/js/jquery.slicknav.js"></script>
   <script src="/resources/js/owl.carousel.min.js"></script>
   <script src="/resources/js/main.js"></script>
   
   <!-- modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>
</body>
</html>												
														