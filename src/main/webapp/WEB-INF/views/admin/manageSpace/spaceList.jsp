<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../../views/common/admin-top.jsp"></jsp:include>


<div class="page-wrapper">
	<div class="container">
		<div class="row">
		<jsp:include page="../../../views/common/admin-left-sidebar.jsp"></jsp:include>
			<div class="col-md-10">
				<table align="center" class="table col-10 mb-3">
					
					<tr>
						<td > 번호</td>
						<td > 공간명</td>
						<td > 승인여부</td>
						<td > 승인일 </td>
						<td > 승인 거부 메일 </td>
						
					</tr>
					<c:forEach items="${sList }" var="space" >
					<tr>
						<td > ${space.spaceNo }</td>
						<td > <a href='/space/detail.kh?spaceNo=${space.spaceNo } '>${space.spaceName }</a></td>
						<td > 
						<c:if test='${space.approval eq "N"}'><b style = "color:red"> ${space.approval}1</b></c:if>
						<c:if test='${space.approval eq "Y"}'>${space.approval}1</c:if>
						</td>
						<td > ${space.approvalDate }</td>
						<td > ${space.rejectMailChk }</td>
						
					</tr>
					</c:forEach>
				</table>
				
				<!-- 페이징 -->
		<table align="center" class="table col-10 table-borderless" width="100%">
		<tr align='center' height="20">
		<td align='center'>
		<ul class="pagination justify-content-center">
			<c:if test="${paging.currentPage != 1 }">
			<li class="page-item"><a class="page-link" href='/partner/${urlVal }.kh?page=${paging.currentPage - 1 }'>이전</a>
			</li>
			</c:if>
			
			<c:forEach var='p' begin="${paging.startNavi }" end="${paging.endNavi }">
				<c:if test="${paging.currentPage eq p}">
				<li class="page-item disabled"><a class="page-link" href='#' >${p }</a></li>
				</c:if>
				<c:if test="${paging.currentPage ne p}">
				<li class="page-item"><a class="page-link"  href="/partner/${urlVal }.kh?page=${p }">${p }</a>
				</li>
				</c:if>
			</c:forEach>
			
			<c:if test="${paging.currentPage <paging.maxPage }">
			<li class="page-item"><a class="page-link"  href='/partner/${urlVal }.kh?page=${paging.currentPage + 1 }'>다음</a>
			</li>
			</c:if>
		</ul>
		</td>
		</tr>
	</table>
			</div>		
		</div>
	</div>
</div>

</body>
</html>