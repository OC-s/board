<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<form action="modify" method="post">
			<table class="table table-striped-columns">
				<h1 style="text-align: center;">수정</h1>
				<tr>
					<td><input type="hidden" name="number" value="${list.number}"></td>
				</tr>
				<div class="mb-3">
					<label for="writer" class="form-label">닉네임</label> 
					<input type="text" name="nickname" class="form-control" id="nickname" value="${list.nickname }">
				</div>
				<div class="mb-3">
					<label for="title" class="form-label">제목</label> 
					<input type="text" name="title" class="form-control" id="title" value="${list.title }">
				</div>
				<div class="mb-3">
					<label for="contents" class="form-label">내용</label>
					<textarea class="form-control"  name="contents" id="contents" rows="3">${list.contents }</textarea>
				</div>
				<tr>
					<td colspan="4">
						<a href="list" class="btn btn-outline-primary">목록가기</a>
						<button type="submit" class="btn btn-outline-success">수정완료</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>