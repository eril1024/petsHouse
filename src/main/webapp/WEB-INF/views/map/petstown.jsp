<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body style="padding-top:128px">

  <!-- header -->
   <%@ include file="/WEB-INF/views/include/header.jsp"%>
   
    <!-- Map Section Begin -->

  
           
    <!-- Map Section Begin -->

    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                <h3>종로구</h3>
                
                
          <table border=1 style="width:1140px;">
      <tr>
      	<td>글번호</td>
         <td>제목</td>
         <td>내용</td>
         <td>작성일자</td>
         <td>좋아요</td>
         <td>조회수</td>
     
      </tr>
      <c:forEach items="${list}" var="list">
         <tr>
         	<td>${list.board_id}</td>
 			  <td><c:forEach begin="1" end="${list.pindent}">[re]</c:forEach>
 			  
             <a id="a-content"href="${pageContext.request.contextPath}/restful/board/${list.board_id}">${list.title}</a></td>        
            <td>${list.content}</td>
          
            <td>${list.pdate}</td>
            <td>${list.plike}</td>
            <td>${list.hit}</td>
        
         </tr>
      </c:forEach>
      </table>
      
            <div style="text-align:center">
   <c:if test="${pageMaker.prev}">
         <a href="petstown${pageMaker.makeQuery(pageMaker.startPage - 1) }">«</a>
      </c:if>

      <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
         <c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
         <a href="petstown${pageMaker.makeQuery(idx)}">${idx}</a>
      </c:forEach>
      
      <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
         <a href="petstown${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
      </c:if> 
	<br/>
   
   
   


 <a href="board/rest_write_view">글작성</a>
     
      </div>
      
      
      
        </div>           
               
            </div>
        </div>
    </section>
  
   <!-- Footer -->
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>  

 
    
    
    
</body>
</html>