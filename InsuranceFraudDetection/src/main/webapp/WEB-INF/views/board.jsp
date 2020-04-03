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
            <li><a href="./">Home</a></li>
            <li>QnA</li>
          </ol>
        </div>

      </div>
    </section>
    <!-- End About Us Section -->
    
	<!-- 게시판 리스트 시작 -->
        <section id="board-list" class="white-wrapper" style="background-color:#f5f5f5;">
	        <div class="container">
		        <div class="pg-opt">
				    <div class="row">
				        <div class="col-md-6 pc">
				            <h2><fmt:message key="BOARD_LIST"/> 
				            <c:if test="${empty name}">
				            <br>
				            <small style="color:red; font-size:0.6em"><fmt:message key="LOGIN"/></small>
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
			    <form action="<c:url value='/board/search'/>" method="get">
				<div class="pull-right" style="margin-bottom: 5px;">
				    <input type="text" name="keyword" class="form-control" style="width:60%">
				    <input type="submit" class="btn btn-warning" value="<fmt:message key="SEARCH"/>">
				</div>
			</form>
			
			<div class="section-inner">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-sm-offset-1">
                            <div class="row post-list mb60">
                            	<!-- 글 리스트 시작 -->
                            	<c:set var="seq" value="${(page-1)*10}" scope="page" />
                            	<c:forEach var="board" items="${boardList}">
                            	
                                <div class="col-xs-12 blog-caption pure-white-wrapper" style="width:100%">
                                	<!-- 글 번호 -->
                                	<div><c:set var="seq" value="${seq + 1}" scope="page"/> 1 </div>
                                	
                                	<!-- 글 제목 -->
                                	<h4 class="mb60"><a href='<c:url value="/board/${board.boardId}"/>'>${board.title}</a> 
                                	Student Reaches Goal </h4>
                                	
                                	<!-- 작성자 -->
                                	<div>${board.writer}</div>
                                	
                                	<!-- 작성일 -->
                                	
                                	<div><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></div>
                                
                                	<!-- 조회수 -->
                                	<div>${board.readCount}</div>
                                	
                                	<!-- 내용  -->
                                    <p class="mb20"><small>Enthusiastically leverage other's prospective architectures whereas frictionless e-markets. Efficiently procrastinate high-quality benefits vis-a-vis goal-oriented platforms. Uniquely seize exceptional materials whereas turnkey growth strategies. Dynamically evolve world-class leadership skills through web-enabled products. Globally utilize fully researched ROI through scalable leadership skills.</small></p>
									<div class="vertical-center-js">
                                        <a href="#" class="btn btn-info btn-green">View</a>
                                    </div>
                                </div>
                                </c:forEach>
                                <div class="col-xs-12 blog-caption pure-white-wrapper">
                                    &nbsp; <h4 class="mb60"> 
                                    	<font size="4">1</font> 
                                    	Student Reaches Goal 
                                    	<font size="4" style="font-face:맑은고딕, 돋움">작성일 2020-03-03</font></h4>                                    	
                                    <br>
                                    <p class="mb20"><small>Enthusiastically leverage other's prospective architectures whereas frictionless e-markets. Efficiently procrastinate high-quality benefits vis-a-vis goal-oriented platforms. Uniquely seize exceptional materials whereas turnkey growth strategies. Dynamically evolve world-class leadership skills through web-enabled products. Globally utilize fully researched ROI through scalable leadership skills.</small></p>
                                    <div class="vertical-center-js">
                                        <a class="btn btn-info btn-green" href='<c:url value="/board/${board.boardId}"/>'>View</a>
                                    </div>
                                </div>
                            </div>
                            <!-- 글 리스트 끝 -->
                        </div>
                    </div>
                </div>
                <table class="table">
				<tr>
					<!-- 페이징 태그 오류 -->
					<%-- <td align="left">
						<jk:paging categoryId="${categoryId}" totalPageCount="${totalPageCount}" nowPage="${page}"/>
					</td> --%>
					<td align="right">
						<a href='<c:url value="/board/write/${categoryId}"/>'><button type="button" class="btn btn-info"><fmt:message key="WRITE_NEW_ARTICLE"/></button></a>
					</td>
				</tr>
				</table>
            </div>
		    </div>
		    
		    <table class="table table-hover table-bordered">
		<thead>
		<tr>
			<!-- td class="pc"><fmt:message key="NO"/></td-->
			<td><fmt:message key="BOARD_ID"/></td>
			<td class="pc"><fmt:message key="WRITER"/></td>
			<td><fmt:message key="SUBJECT"/></td>
			<td class="pc"><fmt:message key="WRITE_DATE"/></td>
			<td class="pc"><fmt:message key="READ_COUNT"/></td>
		</tr>
		</thead>
		<c:set var="seq" value="${(page-1)*10}" scope="page" />
		<c:forEach var="board" items="${boardList}">
		<tr>
			<c:set var="seq" value="${seq + 1}" scope="page"/>
			<td>${board.boardId}<!-- (${board.categoryId})--></td>
			<td class="pc">${board.writer}</td>
			<td>
			<a href='<c:url value="/board/${board.boardId}"/>'>${board.title}</a>
			</td>
			<td class="pc"><fmt:formatDate value="${board.writeDate}" pattern="YYYY-MM-dd"/></td>
			<td class="pc">${board.readCount}</td>
		</tr>
		</c:forEach>
		</table>
			    
        </section>
  </main><!-- End #main -->

	
<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  <jsp:include page="/WEB-INF/views/include/staticJsp.jsp"/>
  <script type="text/javascript">
  	document.getElementById('header').setAttribute('class', 'fixed-top')
  </script>
</body>







<style>
.accent-alt {
    color: #1EACCC;
}

/*-----------------------------------------------------------------------------------*/
/* OMMON
/*-----------------------------------------------------------------------------------*/
body {
    font-family: 'Work Sans', sans-serif;
    font-size: 16px;
    line-height: 2.028571429;
    background-color: #f5f5f5;
    font-weight: 300;
    padding: 0;
    overflow-x: hidden;
}

.mb20 {
    margin-bottom: 20px;
}

.mb60 {
    margin-bottom: 60px;
}

h4 {
    font-family: 'Work Sans',serif;
    font-weight:300;
    text-transform: uppercase;
}


/* WRAPPERS */
.white-wrapper {
    background-color: #f5f5f5;
}

.pure-white-wrapper {
    background-color: #fff;
}

#board-list {
	align:center;
	position: relative;
  	overflow: hidden;
}


/*-----------------------------------------------------------------------------------*/
/* BUTTONS
/*-----------------------------------------------------------------------------------*/
.btn {
    text-transform: uppercase;
    letter-spacing: 2px;
    padding: 12px 18px;
    border-radius: 0px;
    font-weight: 800;
    border-width: 3px;
}

.btn-primary {
    background-color: #C0B6A0;
    border-color: #C0B6A0;
}

.btn-primary.active,
 .btn-primary:active,
 .open>.dropdown-toggle.btn-primary,
 .btn-primary.active.focus,
 .btn-primary.active:focus,
 .btn-primary.active:hover,
 .btn-primary:active.focus,
 .btn-primary:active:focus,
 .btn-primary:active:hover,
 .open>.dropdown-toggle.btn-primary.focus,
 .open>.dropdown-toggle.btn-primary:focus,
 .open>.dropdown-toggle.btn-primary:hover,
 .btn-primary.focus,  .btn-primary:focus {
    background-color: #30363d;
    border-color: #30363d;
}

.btn-primary:hover {
    background-color: #222;
    border-color: #222;
}

.btn-primary.btn-outlined {
    background-color: transparent;
    border: 3px solid #C0B6A0;
    color: #C0B6A0;
}

.btn-primary.btn-outlined.active,
.active .btn-primary.btn-outlined,
.active .btn-primary.btn-outlined:focus {
    background-color: #C0B6A0;
    border: 3px solid #C0B6A0;
    color: #fff;
}

.btn-white {
    border: 3px solid #fff;
    background-color: #fff;
    color: #C0B6A0 !important;
}

.active .btn-white,
.active .btn-white:focus,
.active .btn-white:hover {
    border: 3px solid #222;
    background-color: #222;
    color: #222;
}

.active .btn-white span, .btn-white:hover span {
    color: #222;
}

.btn-white:hover {
    border: 3px solid #222;
    background-color: #222 !important;
    color: #fff !important;
}

.btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus {
    outline: none;
}

/*-----------------------------------------------------------------------------------*/
/*  FEATURE BOXES
/*-----------------------------------------------------------------------------------*/

.hover-overlay h4:after, 
.post-tile h4:after, 
.post-tile-alt h4:after, 
.post-list 
.blog-caption h4:after {
    content: '';
    background-color: #fff;
    height: 2px;
    width: calc(100% - 10%);
    position: absolute;
    left: 40px;
    margin-top: 40px;
    padding: 0 40px;
    text-transform: uppercase;
}

.post-tile > div,.post-tile-alt > div {
    padding: 0px 40px;
    min-height: 380px;
}

.post-tile h4:after, .post-tile-alt h4:after, .post-list .blog-caption h4:after {
    background-color: #222;
}

.post-tile-alt h4:after {
    left: auto;
    right: 40px;
}

 .single-section-title h3, .widget-title, .post-list .blog-caption h4 {
    font-size: 20px;
    font-weight: 300;
    letter-spacing: 3px;
 }

 .post-comments .well {
    padding: 0 20px 20px;
    margin-bottom: 40px;
    background-color: transparent;
}


.blog-caption {
	margin-top:30px;
	align: center;
	text-align:center:
	position:absolute;
}

.post-list .blog-caption {
    padding: 60px 40px;
    float:center;
}

</style>
</html>
