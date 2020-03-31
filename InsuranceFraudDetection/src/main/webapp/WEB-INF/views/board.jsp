<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:setBundle basename="i18n/board" />
<html lang="en">
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<main id="main">

    <!-- ======= About Us Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>QnA</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>QnA</li>
          </ol>
        </div>

      </div>
    </section><!-- End About Us Section -->

    <!-- ======= About Section ======= -->
    
    <section class="team" data-aos="fade-up" data-aos-easing="ease-in-out" data-aos-duration="500">
  	<div class="boardContainer">
	    <div class="pg-opt">
	        <div class="row">
	            <div class="col-md-6 pc">
	                <h2><fmt:message key="CONTENT"/></h2>
	            </div>
	            <div class="col-md-6">
	                <ol class="breadcrumb">
	                    <li><fmt:message key="BOARD"/></li>
	                    <li class="active"><fmt:message key="CONTENT"/></li>
	                </ol>
	            </div>
	        </div>
	    </div>
		<div class="content">
	
		<table class="table table-bordered">
		<tr class="pc">
			<td colspan=2 align="right">
			<a href='<c:url value="/board/cat/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="BOARD_LIST"/></button></a>
			<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
			<a href='<c:url value="/board/reply/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="REPLY"/></button></a>
			<a href='<c:url value="/board/update/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="UPDATE"/></button></a>
			<a href='<c:url value="/board/delete/${board.boardId}"/>'><button type="button" class="btn btn-info"><fmt:message key="DELETE"/></button></a>
			</td>
		</tr>
		<tr>
			<td width="20%"><fmt:message key="BOARD_ID"/></td>
			<td>${board.boardId}</td>
		</tr>
		<tr>
			<td width="20%"><fmt:message key="WRITER"/></td>
			<td>${board.writer}</td>
		</tr>
		<tr>
			<td width="20%"><fmt:message key="WRITE_DATE"/></td>
			<td><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd HH:mm:ss"/></td>
		</tr>
		<tr>
			<td><fmt:message key="SUBJECT"/> </td>
			<td>${board.title}</td>
		</tr>
		<tr>
			<td><fmt:message key="CONTENT"/></td>
			<td class="board_content">${board.content}</td>
		</tr>
		<c:if test="${!empty board.fileName}">
		<tr>
			<td><fmt:message key="FILE"/></td>
			<td>
			<%--c:if test="${!empty sessionScope.userid}"--%>
			<c:set var="len" value="${fn:length(board.fileName)}"/>
			<c:set var="filetype" value="${fn:toUpperCase(fn:substring(board.fileName, len-4, len))}"/>
			<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}"><img src='<c:url value="/file/${board.fileId}"/>' class="img-thumbnail"><br></c:if>
			<%--/c:if--%>
			<a href='<c:url value="/file/${board.fileId}"/>'>${board.fileName} (<fmt:formatNumber>${board.fileSize}</fmt:formatNumber>byte)</a>
			</td>
		</tr>
		</c:if>
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
  
    </section><!-- End About Section -->

    <!-- ======= Facts Section ======= -->
    <section class="facts section-bg" data-aos="fade-up">

    </section><!-- End Facts Section -->

    <!-- ======= Our Skills Section ======= -->
    <section class="skills" data-aos="fade-up">
    </section><!-- End Our Skills Section -->

    <!-- ======= Tetstimonials Section ======= -->
 

  </main><!-- End #main -->

	
<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
  <script type="text/javascript">
  	document.getElementById('header').setAttribute('class', 'fixed-top')
  </script>
</body>
</html>
