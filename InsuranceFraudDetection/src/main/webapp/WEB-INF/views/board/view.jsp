<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board" />
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <main id="main">

    <!-- ======= Header Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>QnA</h2>
          <ol>
            <li><a href="../">Home</a></li>
            <li>QnA</li>
          </ol>
        </div>

      </div>
    </section><!-- End Header Section -->
    
<!-- ======= Contact Section ======= -->
<section class="blog" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500" style="margin-top:8%; margin-bottom:4%">
     <div class="container" style="margin-bottom:10px">
        <div class="pg-opt">
	        <div class="row">
	            <div class="col-md-6 pc">
	                <h2><fmt:message key="BOARD_LIST"/> 
		            <c:if test="${empty name}">
		            <br><small style="color:red; font-size:0.6em"><fmt:message key="LOGIN"/></small>
		            </c:if>
		            </h2>
	            </div>
	            <div class="col-md-6">
	                <ol class="breadcrumb">
	                    <li><fmt:message key="BOARD"/></li>
		                <li class="active"><fmt:message key="BOARD_LIST"/></li>
	                </ol>
	            </div>
	        </div>
	    </div>
    </div>
    
   <div class="container">
      <div class="row">
	     <div class="col-lg-12 entries">
           <article class="entry entry-single">
             <h2 class="entry-title">
                <a href='<c:url value="/board/${board.boardId}"/>'>${board.title}</a>
             </h2>
             
            <div class="entry-meta">
            
                <ul>
				  <!-- <b>6</b> 글번호-->
                  <li class="d-flex align-items-center">
                  	  <i class="icofont-user"></i><fmt:message key="WRITER"/></li>
                  <li class="d-flex align-items-center">
	                  <i class="icofont-wall-clock"></i>
	                  <fmt:message key="WRITE_DATE"/></li>
                  <li class="d-flex align-items-center">
                  	  <i class="icofont-comment"></i> <a href="blog-single.html">12 Comments</a></li>
                  <li class="d-flex align-items-center">
                  	${board.readCount}
                  	<!-- 조회수 아이콘 추가하기 --> 
                </ul>
              </div>
			<div class="entry-content">
				<p class="mb20">${board.content}</p>
			</div>
           </article>
             <table style="align:center; text-align:center; float:center;">
             <tr>
				<td colspan=2 align="right">		
				<a href='<c:url value="/board/cat/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="BOARD_LIST"/></button></a>
				<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
				<a href='<c:url value="/board/reply/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="REPLY"/></button></a>
				<a href='<c:url value="/board/update/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="UPDATE"/></button></a>
				<a href='<c:url value="/board/delete/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="DELETE"/></button></a>
				</td>
			</tr>
			</table>
              </div>
          </div>
    </div>    
</section>

  </main><!-- End #main -->
    <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
  
  <!-- 위로 올라가는 화살표  -->
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  
  <!-- 위 코드 고정 시키기   -->
  <script type="text/javascript">
  	document.getElementById('header').setAttribute('class', 'fixed-top')
  </script>
  

</body>

</html>