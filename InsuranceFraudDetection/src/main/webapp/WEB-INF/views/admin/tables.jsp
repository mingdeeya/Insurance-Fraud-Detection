<%@ page contentType="text/html; charset=utf-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <jsp:include page="/WEB-INF/views/include/admin/adminStaticFiles.jsp"/>

<body class="">
 <jsp:include page="/WEB-INF/views/include/admin/adminHeader.jsp"/>
 
 
      <!-- End Navbar -->
      
      <div class="content">
      	<div class="card text-center">
  <div class="card-header">
    <ul class="nav nav-tabs card-header-tabs">
      <li class="nav-item">
        <a class="nav-link active" href="#">ALL</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Not Delete</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Delete</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>
  </div>
  <div class="card-body">
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table">
                    <thead class=" text-primary">
					    <tr>
					   	  <th scope="col">userNum</th>
					      <th scope="col">userId</th>
					      <th scope="col">name</th>
					      <th scope="col">email</th>
					      <th scope="col">phone</th>
					      <th scope="col">birth</th>
					      <th scope="col">가입일</th>
					      <th scope="col">삭제일</th>
					      <th scope="col">삭제유무</th>
					      <th scope="col">삭제/복구</th>
					    </tr>              			
                    </thead>
                    <tbody>
						<c:forEach var="member" items="${memberList}">
								<tr>
									<td>${member.userNum}</td>
									<td><a href="<c:url value='/admin/user/${member.userId}'/>">${member.userId}</a></td>
									<td>${member.name}</td>
									<td>${member.email}</td>
									<td>${member.phone}</td>
									<td><fmt:formatDate value="${member.birth}" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${member.insertDay}" pattern="yyyy-MM-dd"/></td>
									<td><fmt:formatDate value="${member.delDay}" pattern="yyyy-MM-dd"/></td>
									<c:if test="${member.delCount==0}">
									<td>유지</td>
									</c:if>
									<c:if test="${member.delCount==1}">
									<td>삭제</td>
									</c:if>
									<c:if test="${member.delCount==0}">
									<td><button class="btn btn-danger">삭제</button></td>
									</c:if>
									<c:if test="${member.delCount==1}">
									<td><button class="btn btn-primary">복구</button></td>
									</c:if>
								</tr>
					 	</c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
  		</div>
</div>
<div align="center">
<nav aria-label="Page navigation example" >
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>

 <jsp:include page="/WEB-INF/views/include/admin/adminFooter.jsp"/>
   
  </div>
 <jsp:include page="/WEB-INF/views/include/admin/adminStaticJsp.jsp"/>
</body>

</html>