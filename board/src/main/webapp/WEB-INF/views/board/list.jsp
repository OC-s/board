<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</script>
</head>
<body>

	<div class="container">
		<form action="search" method="get" name="search-form">
			<table class="table table-hover">
				<thead>
					<tr>
						<h1 style="text-align: center;">게시판</h1>
					</tr>
					<tr>
						<td>
							<a href="write" class="btn btn-outline-primary">작성</a>
						</td>
						<td colspan="3" style="text-align: right;">
						 	<div>
						 		<select name="type">
									<option selected value="all">검색 내용 선택</option>	
									<option value="title">제목</option>	
									<option value="nickname">닉네임</option>	
								</select> 
		                       	<input type="text" name="keyword" id="keyword" value="" placeholder="검색어를 입력하세요.">
		                       	<button type="submit" onclick=""><span>검색</span></button>
		                   	</div>
						</td>
					</tr>
				 	<tr class="table-warning">
				      <th scope="col">#</th>
				      <th scope="col">닉네임</th>
				      <th scope="col">제목</th>
				      <th scope="col">내용</th>
		    		</tr>
				</thead>
				<tbody>
				
				<c:forEach var="list" items="${list }" begin="${map.startNo -1}" end="${map.endNo -1}">
					<c:choose>
						<c:when test="${empty list.check }">
							<c:choose>
							<c:when test="${empty keyword}">
								<tr>
									<td>${list.number }</td>
									<td>${list.nickname}</td>
									<td><a href="detail?number=${list.number}">${list.title }</a></td>
									<td>${list.contents}</td>
								</tr>
							</c:when>
								<c:otherwise>
									<tr>
										<td>${list.number }</td>
										<td>${list.nickname}</td>
										<td><a href="detail?number=${list.number}">${list.title }</a></td>
										<td>${list.contents}</td>
									</tr>
								</c:otherwise> 
							</c:choose>
						</c:when>
						
						<c:otherwise>
							<c:choose>
								<c:when test="${empty keyword}">
									<tr class="table-primary">
										<td>${list.number }</td>
										<td>${list.nickname}</td>
										<td><a href="detail?number=${list.number}">${list.title }</a></td>
										<td>${list.contents}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr class="table-primary">
										<td>${list.number }</td>
										<td>${list.nickname}</td>
										<td><a href="detail?number=${list.number}">${list.title }</a></td>
										<td>${list.contents}</td>
									</tr>
								</c:otherwise> 
							</c:choose>
						</c:otherwise>
						
					</c:choose>
				</c:forEach>
				
				<tr>
					<td colspan="8">
						<nav aria-label="Page navigation example">
					  	<ul class="pagination justify-content-center" style="margin-bottom: 0; margin-top: 10px;" >
						  	<c:choose>
						  		<c:when test="${map.isPre }">
							  		<c:choose>
							  			<c:when test="${empty keyword}">
							  			 	<li class="page-item"><a class="page-link" href="list?cp=${map.currentPage-5 }">이전</a></li>
							  			</c:when>
							  			<c:otherwise>
										    <li class="page-item"><a class="page-link" href="search?type=${type }&keyword=${keyword}&cp=${map.currentPage-5 }">이전</a></li>
							  			</c:otherwise>
							  		</c:choose>
							  	</c:when>
						 	</c:choose>
							  	
						  	<c:forEach var="i" begin="${map.startPage }" end="${map.endPage }">
						  		<c:choose>
						  			<c:when test="${empty keyword}">
									    <li class="page-item"><a class="page-link" href="list?cp=${i}">${i }</a></li>
						  			</c:when>
						  			<c:otherwise>
									    <li class="page-item"><a class="page-link" href="search?type=${type }&keyword=${keyword}&cp=${i}">${i }</a></li>
						  			</c:otherwise>
						  		</c:choose> 
						  	</c:forEach>
							  	
							<c:choose>
							    <c:when test="${map.isNext }">
							    	<c:choose>
							  			<c:when test="${empty keyword}">
										    <li class="page-item"><a class="page-link" href="list?cp=${map.currentPage+5 }">다음</a></li>
							  			</c:when>
							  			<c:otherwise>
										    <li class="page-item"><a class="page-link" href="search?type=${type }&keyword=${keyword}&cp=${map.currentPage+5 }">다음</a></li>
						  				</c:otherwise>
							  		</c:choose>
							    </c:when>
						    </c:choose>
					  	</ul>
						</nav>
					</td>
					</tr>
				
				</tbody>
			</table>
		</form>
	</div>

</body>
</html>