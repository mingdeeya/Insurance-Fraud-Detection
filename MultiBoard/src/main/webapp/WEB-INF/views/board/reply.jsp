<%@ page contentType="text/html; charset=utf-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="i18n/board"/>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
<body>
<jsp:include page="/WEB-INF/views/include/bodyHeader.jsp"/>
<div class="container">
	<div class="pg-opt">
		<div class="row">
			<div class="col-md-6 pc">
				<h2><fmt:message key="REPLY_ARTICLE"/></h2>
			</div>
			<div class="col-md-6">
				<ol class="breadcrumb">
					<li><fmt:message key="BOARD"/></li>
					<li class="active"><fmt:message key="REPLY_ARTICLE"/></li>
				</ol>
			</div>
		</div>
	</div>
	<div class="content">
	<form action="<c:url value='/board/reply'/>" method="post" enctype="multipart/form-data" class="form-horizontal">
	<div class="form-group">
		<label class="control-label col-sm-2" for="writer"><fmt:message key="WRITER"/></label>
		<div class="col-sm-2">
			<input type="text" name="writer" id="writer" value="${sessionScope.name}" ${!empty sessionScope.name ? "readonly" : ""} class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="email"><fmt:message key="EMAIL"/></label>
		<div class="col-sm-4">
			<input type="text" name="email" id="email" value="${sessionScope.email}" ${!empty sessionScope.email ? "readonly" : ""} class="form-control" required>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="password"><fmt:message key="PASSWORD"/></label>
		<div class="col-sm-2">
			<input type="password" name="password" id="password" class="form-control" required>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="title"><fmt:message key="TITLE"/></label>
		<div class="col-sm-8">
			<input type="text" name="title" id="title" class="form-control" value="${board.title}" required>
		</div>
	</div>
	</form>
	</div>
</div>
</body>
</html>