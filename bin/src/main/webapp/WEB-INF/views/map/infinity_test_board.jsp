<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap css cdn -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	type="text/css" />

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

<!-- jquery cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script>
	$(function() {

		$("#sel").change(function() {

			location.href = "/map/home"

		});

	});
</script>

<!-- <style>
.jumbotron {
	text-align: center;
	height: 300px;
}

.qcontent {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 1000px;
	height: 20px;
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

#hashtag {
	font-size: 13px;
	padding: 0.01px;
}

#hashtag:hover {
	background-color: #dddddd;
}

.top {
	background-color: #e7ab3c;
	border-radius: 10px;
	cursor: pointer;
	position: fixed;
	right: 5px;
	font-size: 15px;
	bottom: 500px;
	padding: 10px;
}

body::-webkit-scrollbar {
	width: 10px;
}

body::-webkit-scrollbar-thumb {
	background-color: #666666;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

body::-webkit-scrollbar-track {
	background-color: #CCCCCC;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
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
 -->
<!-- <style>
/* CSS */
.pageTitle {position: fixed; left: 0; top: 0; width: 100%; height: 52px; line-height: 52px; color: #fff; text-align: center; background: #111;}
article {padding: 52px 3% 0;}
article .block {padding: 20px; min-height: 500px;}
article .block p {line-height: 22px; color: #fff; font-size: 16px; font-weight: 600;}
article .block:nth-child(2n+1) {background: #999;}
article .block:nth-child(2n) {background: #222;}

</style> -->


<script>
//Javascript
var count = 0;
//????????? ?????? ??????
window.onscroll = function(e) {
    //???????????? ?????? ?????????
    //window height + window scrollY ?????? document height?????? ??? ??????,
    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
    	//????????? ?????? (????????? ??????)
        count++;
        var addContent = '<div class="block"><p>'+ count +'????????? ????????? ?????????</p></div>';
        //article??? ???????????? ???????????? append
        $('article').append(addContent);
    }
};
</script>


<style>
.counter{
	background-color:black;
	color:yellow;
	font-weight:bold;
}
</style>



<script>

expireDate = new Date
expireDate.setMonth(expireDate.getMonth()+6)
jcount = eval(cookieVal("jaafarCounter"))
jcount++
document.cookie = "jaafarCounter="+jcount+";expires=" + expireDate.toGMTString()

console.log(jcount);


function cookieVal(cookieName) {
	thisCookie = document.cookie.split("; ")
	for (i=0; i<thisCookie.length; i++){
		if (cookieName == thisCookie[i].split("=")[0]){
			return thisCookie[i].split("=")[1]
		}
	}
	return 0
}



</script>



</head>
<body style="padding-top: 128px">

	<!-- header -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<!-- Login Check -->




<!-- HTML -->
<header>                
    <h1 class="pageTitle">Infinity scroll</h1>
</header>
<!-- <article>
    <div class="block">
        <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem mollitia accusamus sequi ipsa, rerum nam laboriosam, ipsam aperiam deleniti beatae expedita id quisquam veritatis corporis, voluptates ducimus molestiae eum adipisci.
        </p>
    </div>
    <div class="block">
        <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem mollitia accusamus sequi ipsa, rerum nam laboriosam, ipsam aperiam deleniti beatae expedita id quisquam veritatis corporis, voluptates ducimus molestiae eum adipisci.
        </p>
    </div>
    ??????
</article> -->




????????? ?????????????????? <script>page_counter(jcount);</script>??? ?????????????????????.







	<%-- <!-- Contact Section Begin -->
	<section class="contact-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<!-- ?????? ?????? ???????????? -->
					<select id="sel" style="border: none; font-size: 22px;">
						<option value='${location}' selected>${location}</option>
						<option value="relocaion">?????? ?????? ????????????</option>
					</select> <br> <br>

		

					<!-- ????????? ??? -->
					<form action="/map/write_view" method="get">
						<!-- ????????? ?????? -->
						<input id="location" type="hidden" name="location"
							value="${location}" /> <input type="hidden" id="member_id"
							name="member_id"
							value="<sec:authentication property="principal.member_id"/>">
				


						<!-- ???????????? ??????????????? ?????? ????????? BOX -->
						<div class=" row" style="padding-bottom: 30px;">
							<select name="hashtag" id="hashtag" class="form-control col-sm-1"
								style="margin-left: 15px; text-align-last: center; font-size: 18px;">
								<option value="??????">??????</option>
								<option value="??????????????????">??????????????????</option>
								<option value="??????/????????????">??????/????????????</option>
								<option value="??????">??????</option>
								<option value="??????">??????</option>
								<option value="????????????">????????????</option>
								<option value="??????">??????</option>
								<option value="??????">??????</option>

							</select> <span class="col-sm-9"></span>

							<button class="btn btn-outline-secondary col-sm-1" id="qw"
								style="margin-left: 65px;" type="submit">??? ??????</button>
						</div>
					</form>

					<br />



						<!-- board ????????? -->
						<table class="table">
						<c:forEach items="${list}" var="list">
						
							<tbody id="mapList">
								<td>
								<a href="/map/board/${list.boardVO.board_id}?location=${location}&member_id=${member_id}">

								
									
								
											
										<!-- ?????? ????????? -->
										<div class="user-Info row" style="margin: 20px auto 0px 5px">
									    <div class="profile_box ">
										<img src="/resources/img/member/profile/${list.boardVO.memberVO.thumbnail}" name="profile" alt="" class="profile" />
										</div>
										<div style="padding:7px"> ${list.boardVO.memberVO.nickname} </div>	
										</div>
										
									
										
						
											<!-- ????????? ?????? -->
											<span style="font-size: 13px; color: gray;"><fmt:formatDate value="${list.boardVO.pdate}" pattern="yyyy.MM.dd" /></span>
											<span style="font-size: 13px; color: gray;"> ?????????${list.boardVO.hit}</span>
											<span style="font-size: 13px; color: gray;"> ?????????${list.boardVO.plike}</span>
											<span style="font-size: 13px; color: gray;">${list.boardVO.hashtag}</span>
											<br>	
											<br>							
											<!-- ????????? ????????? ????????? -->			
											<div>
											<img src="/resources/img/location/${list.imgname}" style="width: 780px; height: 450px; object-fit: cover; border-radius: 10px;">
										
											<br>	
											<br>
											<div style="font-size:20px;">${list.boardVO.content}</div></a>
								
								 <!-- ???????????? --> 
									<c:set var="hashtag" value="${list.boardVO.hashtag}" />
									<c:set var="tag" value="${fn:split(hashtag, ' ')}" /> 
									<c:forEach var="t" items="${tag}">
									<span><button id="hashtag" name="keyword" class="btn btn-disabled" style="" value="${t}"
									onclick="location.href='${pageContext.request.contextPath}/map/qnatag'">${t}</button></span>
									</c:forEach>
								
								
								
								</td>
							</tbody>
						</c:forEach>

					</table>




					<!-- ????????? -->
					<div class="ul">
						<ul class="pagination justify-content-center"
							style="padding-bottom: 50px; padding-top: 50px;">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link"
									href="board?location=${location}&member_id=${member_id}${pageMaker.makeQuery(pageMaker.startPage - 1) }">
										Previous</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
								<li class="page-item"><a class="page-link"
									href="board?location=${location}&member_id=${member_id}${pageMaker.makeQuery(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item"><a class="page-link"
									href="board?location=${location}&member_id=${member_id}${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
							</c:if>
						</ul>
					</div>


				</div>

			</div>
		</div>
	</section>

	<script type="text/javascript">
		$('#hashtag')
				.change(
						function() {
							var hashtag = $(this).val();
							var location = $('#location').val();
							console.log("?????? ??????????????? ???????" + hashtag);
							console.log("?????? ????????? ???????" + location);

							if (hashtag == "??????") {
								console.log(hashtag);
								window.location.href = "/map/board?location=${location}&nickname=${nickname}&member_id=${member_id}";
							}

							var url = "/map/location/tag";
						
							$.ajax({
										url : url,
										type : "get",
										data : {
											hashtag : hashtag,
											location : location,
										},
										success : function(data) {

											console.log(data);
											$(".table").empty();
											var html = "<table class='table'>";
											for (var i = 1; i <= data.length; i++) {

												html += "<tbody id='qnaList'><td>"
														+ "<a href='${pageContext.request.contextPath}/commu/qna_view?board_id="
														+ data[i - 1].boardVO.board_id
														+ "'>"

														+ "<div style='font-weight: bold; font-size: 18px;'>"
														+ data[i - 1].boardVO.title
														+ "</div>"
														+ "<div>"
														+ data[i - 1].content
														+ "</div> <span>"
														+ data[i - 1].boardVO.memberVO.nickname
														+ "</span>"
														+ "<span style='font-size: 13px; color: gray;'>"
														+ data[i - 1].boardVO.pdate
														+ "</span> "
														+ "<span style='font-size: 13px; color: gray;'> ????????? "
														+ data[i - 1].boardVO.hit
														+ "</span>"
														+ "</a>"
														+ "</td></tbody>"

											}
											html += "</table>"
											$(".ul").prepend(html);

										}, //ajax ?????? ??? end

										error : function(request, status, error) {
											alert("code:" + request.status
													+ "\n" + "message:"
													+ request.responseText
													+ "\n" + "error:" + error);

										} // ajax ?????? ??? end

									})
						})
	</script>


 --%>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>




</body>
</html>