<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${sns.content}</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
p {
	margin: 20px 0px;
}

.i {
	width: 269px;
	height: 269px;
	object-fit: cover;
}

body {
	font-family: Arial;
	margin: 0;
}

.sidebar-section {
	position: relative;
	min-height: 100%;
	padding-left: 40px;
	margin-left: 20px;
	border-left: 1px solid #ededed;
}

* {
	box-sizing: border-box;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
	position: relative;
}

/* Hide the images by default */
.mySlides {
	display: none;
	width: 780px;
	margin: 10px auto;
}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
	cursor: pointer;
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 40%;
	width: auto;
	padding: 40px;
	margin-top: -50px;
	color: white;
	font-weight: bold;
	font-size: 20px;
	border-radius: 0 3px 3px 0;
	user-select: none;
	-webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Six columns side by side */
.column {
	float: left;
	width: 16.66%;
}

/* Add a transparency effect for thumnbail images */
.demo {
	opacity: 0.6;
}

.active, .demo:hover {
	opacity: 1;
}

/* The dots/bullets/indicators */
.dot {
	cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active, .dot:hover {
	background-color: #717171;
}

.profile_box {
	width: 30px;
	height: 30px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile_box2 {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
	margin: 5px;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.recent {
	width: 130px;
	height: 130px;
	border-radius: 10px;
	margin: 3px;
}
</style>
<script>
	//로그인 체크
	$(document).ready(function() {
		var member_id = $("#member_id").val();

		function checkLogin() {
			if (member_id == undefined) {
				alert("로그인 후 글을 작성해주세요.");
				location.href = '/login/login';
			}
		}
		//댓글 작성 로그인 체크
		$('#cw').click(function() {
			checkLogin();
		});
	});
</script>

</head>
<body style="padding-top: 200px">

	<%@ include file="/WEB-INF/views/include/header.jsp"%>



	 
		<div class="mt-150 mb-150">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">

						<input type="hidden" name="board_id" value="${board_id}">
						<input type="hidden" name="boardVO.memberVO.nickname"
							value="${sns.memberVO.nickname}">
						
						
						<div class="row" width="100%">

							<div class="profile_box" >
								<img src="/resources/img/member/profile/${sns.memberVO.thumbnail}"
									name="profile" alt="" class="profile" />
							</div>
							<p class="nickname" style="padding-top: 7px; font-size: 15px;">
								${sns.memberVO.nickname} &nbsp&nbsp</p>
							<div class="pdate" style="clear: left; float : right; padding-bottom: 25px; text-align: right;">
							 ${sns.pdate}   
							</div> 
						</div>
							
 

						 
						<c:forEach var="img" items="${img}">
							<div class="mySlides">

								<img src="/resources/img/member/sns/${img.imgname}"
									style="width: 780px; height: 450px; object-fit: cover; border-radius: 10px;">
							</div>
						</c:forEach>
						<div style="text-align: center">
							<span class="dot" onclick="currentSlide(1)"></span> <span
								class="dot" onclick="currentSlide(2)"></span> <span class="dot"
								onclick="currentSlide(3)"></span> <span class="dot"
								onclick="currentSlide(4)"></span> <span class="dot"
								onclick="currentSlide(5)"></span>
						</div>


						<a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next"
							onclick="plusSlides(1)">❯</a>





						<div class="row user_info">

							 <!-- 좋아요 구현 -->

							<!-- Profile Section -->
							<div  class="container">
								
								<div class="row col-lg-12">
									<div class="profile-info_name">
								 
										<input type="hidden" id="board_id" value="${board_id}" />
									</div>
								</div>

								<div class="row col-lg-12">
								 
										
									 

									<!-- likelist Modal start -->
									<div class="modal" id="likeModal">
										<div class="modal-dialog">
											<div class="modal-content">

												<!-- Modal Header -->
												<div class="modal-header">
													<h4 class="modal-title">좋아요한 회원 목록</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>

												<!-- Modal body -->
												<div class="likelist modal-body">
													<c:forEach items="${likelist}" var="likelist">
														<p>${likelist.memberVO.member_id}</p>
													</c:forEach>
												</div>

												<!-- Modal footer -->
												<div class="modal-footer">
													<button type="button" class="btn btn-warning"
														data-dismiss="modal">Close</button>
												</div>

											</div>
											<!-- modal-content end -->
										</div>
									</div>
									<!-- like list Modal end -->

									<!-- 본인이 좋아요 누른 게시글이 아닌 경우 좋아요 버튼 발생 이미 눌렀던 경우는 좋아요 취소버튼 발생하게 구현해야 할것!-->

									<c:if test="${likecheck == 0}">
										<div class="col-lg-12">
										
											<a href="javascript:void(0);" class="like"
												style="cursor: hand;" onclick="like();"><img
												src="/resources/img/location/before_like.png"
												style="width: 30px;"></a>
												
												<a href="#likeModal" class="like_amount" data-toggle="modal"
											 > ${like_amount} </a><div class="profile-info row"></div>
										
										</div>
									</c:if>

									<c:if test="${likecheck != 0}">
										<div class="col-lg-12">
											<a href="javascript:void(0);" class="likecancel"
												style="cursor: hand;" onclick="likecancel();"><img
												src="/resources/img/location/after_like.png"
												style="width: 30px;"></a>
											<a href="#likeModal" class="like_amount" data-toggle="modal">
											 ${like_amount} </a></div>
										</div>
									</c:if>


								</div>
								<!-- row col-lg-12 end -->
							</div>
							<!-- profile-info end -->
							<!-- Profile Section -->

							<script type="text/javascript">
								//좋아요 요청
								function like() {
									var board_id = $('#pgroup').val();
									// var pre_nickname = $('#nickname').val();  

									console.log(board_id);

									$
											.ajax({
												type : "POST",
												url : "/commu/sns/like/"
														+ board_id,
												success : function(data) {
													console.log(data);
													console
															.log(data.like_amount)
													var likelist = data.likelist;

													html = "";

													for ( var i in likelist) {
														html += "<p>"
																+ likelist[i].memberVO.member_id
																+ "</p>";
													}

													$('.like_amount').empty();
													
													$('.likelist').empty();
													$('.likelist').append(html);
													$('.like').remove();
													$('.profile-info')
															.append(
																	'<a href="javascript:void(0);" class="likecancel" style="cursor:hand;  padding-left:14px;" onclick="likecancel();"><img src="/resources/img/location/after_like.png" style="width:30px;"></a>');
													$('.like_amount')
													.append( 
																	+ data.like_amount
																	 );
												},
												error : function(e) {
													console.log(e);
												}
											});//ajax end
								};//like end

								//좋아요 취소
								function likecancel() {
									var board_id = $('#pgroup').val();
									// var pre_nickname = $('#nickname').val();

									console.log(board_id);

									$
											.ajax({
												type : "DELETE",
												url : "/commu/sns/likecancel/"
														+ board_id,
												success : function(data) {
													console.log(data);
													console
															.log(data.like_amount)
													var likelist = data.likelist;

													html = "";//꼭 써줘야 할것!

													for ( var i in likelist) {
														html += "<p>"
																+ likelist[i].memberVO.member_id
																+ "</p>";
													}

													$('.like_amount').empty();
												 
													$('.likelist').empty();
													$('.likelist').append(html);
													$('.likecancel').remove();
													$('.profile-info')
															.append(
																	'<a href="javascript:void(0);" class="like" style="cursor:hand; padding-left:14px;" onclick="like();"><img src="/resources/img/location/before_like.png" style="width:30px;"></a>');
													$('.like_amount')
													.append( 
																	+ data.like_amount
																	+  '</a>');
													},
												error : function(e) {
													console.log(e);
												}
											});//ajax end
								};//likecancel end
							</script>
							 </div>
						<div style="float:right;">
							 
							<span style="color: gray"> 조회수 ${sns.hit}</span>
						</div>
 
						<div style="padding-left:30px; min-height:100px;">
						 ${sns.content} 
						</div>

						<form action="${pageContext.request.contextPath}/commu/sns/hashtag" method="post">
							<ul class="pd-tags">
								<c:set var="hashtag" value="${sns.hashtag}" />
								<c:set var="tag" value="${fn:split(hashtag, ' ')}" />
								<c:forEach var="t" items="${tag}">

									<button id="hashtag" name="keyword" class="btn btn-disabled"
										value="${t}"
										onclick="location.href='${pageContext.request.contextPath}/commu/sns/hashtag'">${t}</button>

								</c:forEach>
							</ul>
						</form>



					</div> 



					<div class="col-lg-4">
						<div class="sidebar-section">


							<div class="archive-posts">
								 
									<div class="row">
										<div class="profile_box2">
											<img
												src="/resources/img/member/profile/${sns.memberVO.thumbnail}"
												name="profile" alt="" class="profile" />
										</div>
										<h4 style="padding-top: 30px;">${sns.memberVO.nickname}</h4>
										<a href="/myPage/${sns.memberVO.nickname}"
											style="padding-top: 35px;"> &nbsp 팔로우 </a>
									</div>

 
							</div>
							<br> <br>

							<div class="recent-posts">
								<h4>Recent Posts</h4>
								<ul>

									<c:forEach var="user" items="${user}">
										<a href="/commu/sns/${user.boardVO.board_id}"> <img
											src="/resources/img/member/sns/${user.imgname}"
											class="recent"></a>
									</c:forEach>

								</ul>
							</div>
							<br> <br>

							<div style="float: right">
								<sec:authentication property="principal" var="buttonhidden" />
								<sec:authorize access="isAuthenticated()">

									<!-- 현재 접속된 닉네임과 댓글보드에 저장된 닉네임을 비교해서 일치 하면 보이게 함 -->
									<c:if test="${buttonhidden.nickname eq sns.memberVO.nickname}">

										<button id="modify_button" type="button"
											class="btn btn-warning" onclick="modify_event();">수정</button>

										<button id="delete_button" type="button"
											class="btn btn-warning" onclick="button_event();">삭제</button>
									</c:if>
								</sec:authorize>



							</div>




							
 

						</div>
					</div>
				</div>
			</div>
		
 






	<div class="container" style="margin-top: 30px;">

		<input type="hidden" id="pgroup" value="${sns.board_id}">

		<div>
			<div>
				<h4>
					<strong>댓글&nbsp(${count})</strong>
				</h4>
			</div>
			<div>
				<div id="inputContent">
					<table class="table" style="margin: 10px;">
						<td class="row"><textarea style="resize: none;"
								class="form-control col-8" id="content" placeholder="댓글을 입력하세요"></textarea>
							<button id="cw" class="col-1 btn btn-outline-secondary"
								onClick="getComment()">등록</button></td>

					</table>
				</div>
			</div>
		</div>


		<div class="container">
			<c:forEach items="${comment}" var="m">
				<div id="comment" style="width: 800px;">


					<!-- 여기서부터 시큐리티 권한을준다 -->
					<sec:authentication property="principal" var="pinfo" />
					<sec:authorize access="isAuthenticated()">

						<!-- 현재 접속된 닉네임과 댓글보드에 저장된 닉네임을 비교해서 일치 하면 보이게 함 -->
						<c:if test="${pinfo.nickname eq m.memberVO.nickname}">

						<a class="a-del" style="float: right;" href="/commu/sns/comment/delete/${m.board_id}"><b>삭제</b></a>
						</c:if>
					</sec:authorize>
					<div class="row">
						<div class="profile_box">
							<a href="/myPage/${m.memberVO.nickname}"> <img
								src="/resources/img/member/profile/${m.memberVO.thumbnail}"
								name="profile" alt="" class="profile" />
						</div>
						<div style="padding: 6px; color: black;">
							<b>${m.memberVO.nickname}</b></a>
						</div>
						
					</div>
					<div style="padding-left: 30px;">${m.content}</div>
					<div class="pdate" style="padding-left: 30px;">${m.pdate}</div>
					<hr>
				</div>
			</c:forEach>

		</div>


		<div class="container">
			<form id="commentListForm" name="commentListForm" method="post">
				<div id="commentList"></div>
			</form>
		</div>
	</div>

	 



	<script type="text/javascript">
		var slideIndex = 1;
		showSlides(slideIndex);

		function plusSlides(n) {
			showSlides(slideIndex += n);
		}

		function currentSlide(n) {
			showSlides(slideIndex = n);
		}

		function showSlides(n) {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("demo");
			var captionText = document.getElementById("caption");
			if (n > slides.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = slides.length
			}
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
			captionText.innerHTML = dots[slideIndex - 1].alt;
		}
	</script>


	<script type="text/javascript">
		function getFormatDate(pdate) {

			var date = date.substr(0, 17);
			var date = date.split("T");
			var date = date[0] + " " + date[1];
			return pdate;
		}
	</script>
	<script type="text/javascript">
		function button_event() {
			if (confirm("정말 삭제하시겠습니까?") == true) { //확인
				location.href = '${pageContext.request.contextPath}/commu/sns/delete?board_id=${sns.board_id}'
			} else { //취소
				return;
			}
		}

		function modify_event() {
			if (confirm("수정하시겠습니까?") == true) { //확인
				location.href = '${pageContext.request.contextPath}/commu/sns/modify_view?board_id=${sns.board_id}'
			} else { //취소
				return;
			}
		}
	</script>

	<script type="text/javascript">
		// 댓글 작성 및 ajax로 댓글 불러오기 프로필사진, 닉네임, 내용, 날짜 넘김
		function getComment() {

			var member_id = $("#member_id").val();
			var thumbnail = $("#thumbnail").val();
			console.log(member_id);
			var pgroup = $("#pgroup").val();
			var content = $("#content").val();

			$
					.ajax({
						url : "/commu/sns/comment",
						type : "post",
						data : {
							member_id : member_id,
							pgroup : pgroup,
							content : content,
							thumbnail : thumbnail
						},
						success : function(data) {

							html = 	
								"<a class='a-del' style='float:right;' href='/commu/sns/comment/delete/" + data.board_id + "'><b>삭제</b></a>"
								+ "<div class='row'>"
								+ "<div class='profile_box'>"
								+ "<a href='/myPage/ " + data.memberVO.nickname + "'>"
								+ "<img src='/resources/img/member/profile/" + data.memberVO.thumbnail + "' class='profile'></div>"
								+ "<div style='padding:5px; color: black;'><b>" + data.memberVO.nickname + "</div></a></div></b>"
								+ "<div style='padding-left:40px;'>" + data.content + "</div>"
								+ "<div style='padding-left:40px;'>" + data.pdate + "</div><hr>"

								$("#comment").prepend(html);
							document.getElementById("content").value = '';
							// 댓글 삭제
							$(".a-del").click(function(event) { //id는 한번만 calss는 여러번 선택 가능
								event.preventDefault();
								console.log("삭제버튼 클릭")
								var tr = $(this).parent();

								$.ajax({
									type : 'DELETE', //method
									url : $(this).attr("href"),
									cache : false,

									success : function(result) {
										console.log("result: " + result);
										if (result == "SUCCESS") {
											$(tr).remove();
											alert("삭제되었습니다.");
										}
									},
									errer : function(e) {
										console.log(e);
									}
								}); //end of ajax
							}); // 삭제 종료	
						},
					})

		}
	
	

		// 댓글 삭제
		$(".a-del").click(function(event) { //id는 한번만 calss는 여러번 선택 가능.

			//하나의 id는 한 문서에서 한 번만 사용이 가능(가장 마지막 혹은 처음게 선택). 하나의 class는 

			event.preventDefault();

			var tr = $(this).parent();//자바스크립트 클로저

			$.ajax({
				type : 'DELETE', //method
				url : $(this).attr("href"), //주소를 받아오는 것이 두 번째 포인트.
				cache : false,
				success : function(result) {
					console.log("result: " + result);
					if (result == "SUCCESS") {
						$(tr).remove();
						alert("삭제되었습니다.");
					}
				},
				errer : function(e) {
					console.log(e);
				}
			}); //end of ajax
		}); // 삭제 종료

		

	
	</script>

	<script type="text/javascript">
		$(".pdate").each(function() {
			var times = transferTime($(this).text());
			$(this).text(times);
		});

		function transferTime(times) {
			var now = new Date();

			var sc = 1000;

			var today = new Date(times);
			//지나간 초
			var pastSecond = parseInt((now - today) / sc, 10);

			var date;
			var hour;
			var min;
			var str = "";

			var restSecond = 0;
			if (pastSecond > 86400) {
				date = parseInt(pastSecond / 86400, 10);
				restSecond = pastSecond % 86400;
				str = date + "일전 ";

				 

			} else if (pastSecond > 3600) {
				hour = parseInt(pastSecond / 3600, 10);
				restSecond = pastSecond % 3600;
				str = str + hour + "시간전";

			} else if (pastSecond > 60) {
				min = parseInt(pastSecond / 60, 10);
				restSecond = pastSecond % 60;
				str = str + min + "분전";
			} else {
				str = pastSecond + "초전";
			}

			return str;
		}
	</script>
	<div style="margin-top: 500px;">
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

</body>


<!-- Js Plugins -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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

</html>