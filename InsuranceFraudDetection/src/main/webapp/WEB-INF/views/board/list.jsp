<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
  <main id="main">

    <!-- ======= Contact Section ======= -->
    <section class="breadcrumbs">
	<div class="container">
		<div class="pg-opt">
		    <div class="row">
		        <div class="col-md-6 pc">
		            <h2><fmt:message key="BOARD_LIST"/> 
		            <c:if test="${empty name}">
		            <small style="color:red;"><fmt:message key="LOGIN"/></small>
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
		${message}
		<div class="content">
			<form action="<c:url value='/board/search'/>" method="get">
				<div class="pull-right" style="margin-bottom: 5px;">
				<div class="col-xs-9">
			        <input type="text" name="keyword" class="form-control">
			    </div>
			        <input type="submit" class="btn btn-warning" value="<fmt:message key="SEARCH"/>">
				</div>
			</form>
		    <table class="table table-hover table-bordered">
			<thead>
			<tr>
				<!-- td class="pc"><fmt:message key="NO"/></td-->
				<td><fmt:message key="BOARD_ID"/></td>
				<td class="pc"><fmt:message key="WRITER"/></td>
				<td><fmt:message key="SUBJECT"/></td>
				<td class="pc"><fmt:message key="WRITE_DATE"/></td>
				<td class="pc"><fmt:message key="READ_COUNT"/></td>
				<!--td class="pc"><fmt:message key="FILE"/></td-->
			</tr>
			</thead>
			<c:set var="seq" value="${(page-1)*10}" scope="page" />
			<c:forEach var="board" items="${boardList}">
			<tr>
				<c:set var="seq" value="${seq + 1}" scope="page"/>
				<!-- td class="pc">${seq}</td-->
				<td>${board.boardId}<!-- (${board.categoryId})--></td>
				<td class="pc">${board.writer}</td>
				<td>
				<jk:reply replynum="${board.replyNumber}" replystep="${board.replyStep}"/>
				<a href='<c:url value="/board/${board.boardId}"/>'>${board.title}</a>
				</td>
				<td class="pc"><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></td>
				<td class="pc">${board.readCount}</td>
				<!-- td class="pc"><span class="glyphicon glyphicon-file"></span-->
			</tr>
			</c:forEach>
			</table>
	
			<table class="table">
			<tr>
				<td align="left">
					<jk:paging categoryId="${categoryId}" totalPageCount="${totalPageCount}" nowPage="${page}"/>
				</td>
				<td align="right">
					<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
				</td>
			</tr>
			</table>
		</div>
	</div> 
    </section><!-- End Contact Section -->

    <!-- ======= Map Section ======= -->
    <section class="map mt-2">
      <div class="container-fluid p-0">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3024.2219901290355!2d-74.00369368400567!3d40.71312937933185!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a23e28c1191%3A0x49f75d3281df052a!2s150%20Park%20Row%2C%20New%20York%2C%20NY%2010007%2C%20USA!5e0!3m2!1sen!2sbg!4v1579767901424!5m2!1sen!2sbg" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
      </div>
    </section><!-- End Map Section -->

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