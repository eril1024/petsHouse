<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>펫츠하우스</title>

<!-- Google Font -->
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
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
	<input type="hidden" id="location_security" name="location_security"
		value="<sec:authentication property="principal.location"/>">
	<input type="hidden" id="member_id" name="member_id"
		value="<sec:authentication property="principal.member_id"/>">
	<input type="hidden" id="nickname" name="nickname"
		value="<sec:authentication property="principal.nickname"/>">
</sec:authorize>
<style>
.top_profile_box {
	width: 40px;
	height: 40px;
	
}

.top_profile {
	width: 40px;
	height:40px;
	object-fit: cover;

	border-radius: 70%;
}

.top {
	background-color: #e7ab3c;
	border-radius: 10px;
	cursor: pointer;
	position: fixed;
	right: 20px;
	font-size: 15px;
	bottom: 80px;
	padding: 10px;
}

a:visited {
	color: #000000;
}

.logo img {
	width: 180px;
	height: 50px;
}
</style>
</head>

<body>

	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header Section Begin -->
	<header class="header-section fixed-top bg-white">
		<div class="container">
			<div class="inner-header">
				<div class="row" style="height: 70px">
					<div class="col-lg-3 " style="padding-left: 50px">
						<div class="logo">
							<a href="/home"> <img src="/resources/img/logo.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-lg-5 " style="padding-top: 10px;">
						<div class="advanced-search">

							<form action="${pageContext.request.contextPath}/search"
								class="input-group" method="get">
								<input type="text" name="keyword" placeholder="펫츠하우스 통합검색">
								<button type="submit">
									<i class="ti-search"></i>
								</button>
							</form>

						</div>
					</div>
					<div class="col-lg-4 text-right">

						<ul class="nav-right"
							style="padding-top: 16px; padding-right: 15px">

							<sec:authorize access="hasRole('ROLE_USER')">

								<li class="heart-icon">
									<div class="top_profile_box ">
										<a
											href="/myPage/<sec:authentication property="principal.nickname"/>">
											<img class="top_profile"
											src="/resources/img/member/profile/<sec:authentication  property="principal.thumbnail"/>">
										</a>
									</div>
								</li>
								<li><a
									href="/myPage/<sec:authentication property="principal.nickname"/>"><sec:authentication
											property="principal.nickname" />님</a></li>
							</sec:authorize>
							<li class="cart-icon"><a href="/myPage/cart" id="cartCount"><i
									class="icon_bag_alt"></i> </a></li>
							<!-- 로그아웃 버튼 -->
							<sec:authorize access="isAnonymous()">
								<li><a href="/login/login" class="login-panel">Login</a></li>
							</sec:authorize>
							<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
								<li><a href="/login/logout" class="login-panel">Logout</a></li>
							</sec:authorize>

						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="nav-item ">
			<div class="container">
				<div class="nav-depart">
					<div class="depart-btn">
						<i class="ti-menu"></i> <span>MY HOME</span>
						<ul class="depart-hover">
							<li class="active"><a href="#">프로필</a></li>
							<li><a href="#">주문배송내역조회</a></li>
							<li><a href="#">회원정보수정</a></li>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul id="navbars">
						<li><a href="/store/home">Home</a></li>
						<li><a href="/store/commu/home">커뮤니티</a>
							<ul class="dropdown">

								<li><a href="/commu/sns">SNS</a></li>
								<li><a href="/commu/tips">노하우</a></li>
								<li><a href="/commu/qna">질문과답변</a></li>

								<li><a onclick="location_auth()" href="#">펫츠타운</a></li>

							</ul></li>
						<li><a href="/store/home">STORE</a>
							<ul class="dropdown">
								<li><a href="/admin/notice">공지사항</a></li>
								<li><a href="/category/home">카테고리</a></li>
								<li><a href="/store/best">베스트상품</a></li>
								<li><a href="/store/event">이벤트</a></li>
							</ul></li>

						<li><sec:authorize
								access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
								<a
									href="/myPage/<sec:authentication property="principal.nickname"/>">마이페이지</a>
								<ul class="dropdown">
									<li><a href="/myPage/orderList">주문배송내역</a></li>
									<li><a href="/myPage/pointList">포인트</a></li>
									<li><a href="/myPage/updateMember">회원정보수정</a></li>
								</ul>
							</sec:authorize></li>

						<li><a href="/admin/home">관리자페이지</a>
							<ul class="dropdown">

								<li><a href="/admin/goods">상품관리</a></li>
								<li><a href="/admin/member_list">회원관리</a></li>
								<li><a href="/statistics/main/home">통계</a></li>
							</ul></li>

					</ul>
				</nav>

			</div>
		</div>

		<!-- 모바일 디비이스 상단메뉴 -->
		<div class="row " id="mobile-navbar">
			<div class="col-4">
				<nav class="navbar navbar-expand-md navbar-light"
					style="background-color: white; padding-top: 15px">

					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#collapsibleNavbar">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="collapsibleNavbar">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
						</ul>
					</div>
				</nav>
			</div>
			<div class="col-4 logo text-center" style="padding-top: 10px">
				<a href="/store/home"> <img class=""
					src="/resources/img/logo.png" alt="">
				</a>
			</div>
			<div class="col-4">
				<ul class="nav-right" style="padding-top: 16px; padding-right: 15px">

					<sec:authorize access="hasRole('ROLE_USER')">

						<li class="heart-icon">
							<div class="top_profile_box ">
								<a
									href="/myPage/<sec:authentication property="principal.nickname"/>">
									<img class="top_profile"
									src="/resources/img/member/profile/<sec:authentication  property="principal.thumbnail"/>">
								</a>
							</div>
						</li>
						<li><a
							href="/myPage/<sec:authentication property="principal.nickname"/>"><sec:authentication
									property="principal.nickname" />님</a></li>
					</sec:authorize>
					<li class="cart-icon"><a href="/myPage/cart" id="cartCount"><i
							class="icon_bag_alt"></i> </a></li>
					<!-- 로그아웃 버튼 -->
					<sec:authorize access="isAnonymous()">
						<li><a href="/login/login" class="login-panel">Login</a></li>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
						<li><a href="/login/logout" class="login-panel">Logout</a></li>
					</sec:authorize>

				</ul>
			</div>
			<div class="col-12">
				<hr>
			</div>

		</div>

		<!-- 상단 버튼 -->

	</header>
	<!-- Header End -->
	<div class="top" onclick="window.scrollTo(0,0);">top</div>
</body>
<script>
	$(document).ready(function() {
		var count = 0;
		if (sessionStorage.getItem("cartList") != null) {
			count = JSON.parse(sessionStorage.getItem("cartList")).length;
		}

		if (count > 0) {
			html = "<span id='cartCount'>" + count + "</span>"
			$("#cartCount").append(html)
		}

	})

	//위치기반 인증 자바스크립트 함수
	function location_auth() {

		try {
			var member_id = document.getElementById("member_id").value;
		} catch (e) {
			console.error(e);
			alert("로그인 후 이용 가능합니다.");
			location.href = "/login/login";
		}

		var location_security = document.getElementById("location_security").value;
		var member_id = document.getElementById("member_id").value;
		var nickname = document.getElementById("nickname").value;
		//var location = document.getElementById("location").value; 
		console.log(location_security);

		if (location_security == null) {

			location.href = "/map/home";

		} else {

			location.href = "/map/board?location=" + location_security
					+ "&member_id=" + member_id + "&nickname=" + nickname;

			console.log(location_security);
			console.log(member_id);
			console.log(nickname);

		}

	}
</script>
<!-- Js Plugins -->
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
</html>