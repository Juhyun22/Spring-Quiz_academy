<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>즐겨찾기 추가</title>
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" id="name" name="name" class="form-control col-4" placeholder="즐겨찾기 제목">
		</div>
		
		<div class="form-group">
			<label for="url">주소</label>
			<input type="text" id="url" name="url" class="form-control" placeholder="즐겨찾기 주소">
		</div>
		
		<button id="submitBtn" class="btn btn-success btn-block">추가</button>
	</div>
	
<script>
	$(document).ready(function() {
		$('#submitBtn').on('click', function(e) {
			
			let name = $('#name').val().trim();
			if (name == '') {
				alert("제목을 입력하세요.");
				return;
			}
			
			let url = $('#url').val();
			if (url.length < 1) {
				alert("주소를 입력하세요.");
				return;
			}
			
			// http도 아니고 https도 아닐 때 => alert();을 띄워야함 
			if (url.startsWith('http') == false && url.startsWith('https') == false) {
				alert("주소 형식이 잘못되었습니다.");
				return;
			}
			
			// 서버 호출 
			$.ajax({
				type : "POST"
				, url : "/lesson06/quiz01_2"
				, data : {"name":name, "url":url}
				, success : function(data) {
					// alert(data.result);
					if (data.result == 'success') {
						// 목록 화면으로 이동 
						location.href = "/lesson06/quiz01_3"
					} else {
						alert("error");
					}
				}
				, error : function(e) {
					alert("error : " + e);
				}
			});
		});
	});
</script>
</body>
</html>