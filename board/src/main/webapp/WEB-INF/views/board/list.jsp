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
		<table class="table table-hover">
			<thead>
				<tr>
					<h1 style="text-align: center;">게시판</h1>
				</tr>
				<tr>
					<td colspan="4"><a href="write" class="btn btn-outline-primary">작성</a></td>
				</tr>
			 	<tr class="table-warning">
			      <th scope="col">#</th>
			      <th scope="col">닉네임</th>
			      <th scope="col">제목</th>
			      <th scope="col">내용</th>
	    		</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${list }">
				<c:choose>
					<c:when test="${empty list.check }">
						<tr>
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
			</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>