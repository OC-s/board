<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1 style="text-align: center;">쓰기</h1>
		<form action="write" method="post" onsubmit="return Check()">
			<div class="mb-3">
				<label for="writer" class="form-label">닉네임</label> 
				<input type="text" name="nickname" class="form-control" id="nickname" placeholder="닉네임" value="${list.nickname }">
			</div>
			<div class="mb-3">
				<label for="title" class="form-label">제목</label> 
				<input type="text" name="title" class="form-control" id="title" placeholder="제목">
			</div>
			<div class="mb-3">
				<label for="contents" class="form-label">내용</label>
				<textarea class="form-control"  name="contents" id="contents" rows="3"></textarea>
			</div>
			<div class="form-check">
	 			<input class="form-check-input" type="checkbox" name="check" value="y" id="check"> 중요 체크
			</div>
			
			&ensp;
			
			<div>
				<button type="submit" class="btn btn-outline-primary">전송</button>
			</div>
		</form>
	</div>
	
	<!-- 미입력 유효성 검사 -->
	<script type="text/javascript">
		function Check(){
			if(nickname.value ==""){
				nickname.focus();
				alert('닉네임을 입력하세요');
				return false
			}
			if(title.value ==""){
				title.focus();
				alert('제목을 입력하세요');
				return false
			}
			if(contents.value ==""){
				contents.focus();
				alert('내용을 입력하세요');
				return false
			}
		}
	</script>
</body>
</html>