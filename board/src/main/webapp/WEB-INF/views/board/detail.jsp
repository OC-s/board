<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

	<div class="container">
		<table class="table table-striped-columns">
			<h1 style="text-align: center;">조회</h1>
			<tr>
				<th>작성번호</th>
				<th>닉네임</th>
				<th>제목</th>
				<th>내용</th>
			</tr>
			
			<tr>
				<td><input type="hidden" name="list" value="${list.number}">${list.number }</td>
				<td>${list.nickname}</td>
				<td>${list.title}</td>
				<td>${list.contents}</td>
			</tr>
			
			<tr>
				<td colspan="4">
					<a href="list" class="btn btn-outline-primary">목록가기</a>
					<a href="modify?number=${list.number }" class="btn btn-outline-primary">수정하기</a>
					<a href="delete?number=${list.number }" class="btn btn-outline-primary">삭제하기</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>