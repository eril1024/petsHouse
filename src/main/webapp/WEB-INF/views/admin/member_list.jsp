<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<meta name="viewport"
   content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>storehome</title>

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

<script type="text/javascript">

	$(document).ready(function() {
		$('.a-delete').click(function(event) {		
			event.preventDefault();
		
			var trObj = $(this).parent().parent();

			$.ajax({
				type : "DELETE",
				url : $(this).attr("href"),
				cache : false,
				success : function(result) {
					console.log(result);
					if (result == "SUCCESS") {
						$(trObj).remove();
					}
				},
				error : function(e) {
					console.log(e);
				}
			})
		});
	});
</script>

<style>

.table2 {
	display: table;
	margin: 50px auto;
	width: 700px;
	font-size: 20px;
	font-stretch: extra-condensed;
	text-align: center;
}

h2 {
	text-align: center;
}

.member{
	padding-top:20px;
}
</style>
</head>


<body>


	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<table class="table2 table-hover" border="1">
		<h2 class="member">회원 관리</h2>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>닉네임</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${list}" var="member">
			<tr>
				<td>${member.rnum}</td>
				<td><a href="/admin/member_detail/${member.member_id}">${member.name}</a></td>
				<td>${member.member_id}</td>
				<td>${member.nickname}</td>
				<td><a class="a-delete" data-bid='${member.member_id}'                      
					href="/admin/member_list/${member.member_id}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 -->
	<ul class="pagination justify-content-center" style="padding-bottom: 50px; padding-top: 20px;">
		<c:if test="${pageMaker.prev}">
			<li class="page-item"><a class="page-link" href="member_list${pageMaker.makeQuery(pageMaker.startPage - 1) }"> Previous</a></li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
			<li class="page-item"><a class="page-link" href="member_list${pageMaker.makeQuery(idx)}">${idx}</a></li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li class="page-item"><a class="page-link" href="member_list${pageMaker.makeQuery(pageMaker.endPage +1) }">Next</a></li>
		</c:if>
	</ul>
      
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>

   <!-- Bootstrap core JavaScript -->
   <script src="/resources/store/vendor/jquery/jquery.min.js"></script>
   <script
      src="/resources/store/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
