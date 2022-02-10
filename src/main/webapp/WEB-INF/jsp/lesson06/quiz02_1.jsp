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
			<div class="form-inline">
				<input type="text" id="url" name="url" class="form-control col-10 mr-5" placeholder="즐겨찾기 주소">
				<button type="button" id="urlCheckBtn" class="btn btn-info">중복 확인</button>
			</div>	
			<!-- <div id="urlStatusArea"></div> -->
			
			<small id="isDuplicationText" class="text-danger d-none">중복된 url입니다.</small>
			<small id="availableUrlText" class="text-success d-none">저장가능한 url입니다.</small>
		</div>
		
		<button type="submit" id="submitBtn" class="btn btn-success btn-block">추가</button>
	</div>
	
<script>
	$(document).ready(function() {
		// 중복 버튼 확인 클릭 
		$('#urlCheckBtn').on('click', function(e) {
	
			let url = $('#url').val().trim();
			
			if (url == '') {
				alert("검사할 url을 입력해주세요.");
				return;
			}
			 
			if (url.startsWith('http') == false && url.startsWith('https') == false) {
				alert("주소 형식이 잘못되었습니다.");
				return;
			}
			
			// 이름이 중복됐는지 확인 
			$.ajax({
				type : "POST"
				, url : "/lesson06/is_duplication_url"
				, data : {"url":url}
				, success : function(data) {
					if (data.urlResult == true) {
						// 중복일 때
						$('#isDuplicationText').removeClass('d-none');
						$('#availableUrlText').addClass('d-none');
					} else {
						// 중복이 아닐 때 
						$('#availableUrlText').removeClass('d-none');
						$('#isDuplicationText').addClass('d-none');
					}
				}
				, error : function(e) {
					alert("error : " + e);
				}
			});
		});
		
		// 즐겨찾기 추가 
		$('#submitBtn').on('click', function(e) {
			e.preventDefault();
			
			let name = $('#name').val().trim();
			if (name == '') {
				alert("제목을 입력하세요.");
				return;
			}
			
			// 중복확인 체크 
			if ($('#availableUrlText').hasClass('d-none') == true) {
				// 저장할 수 있는 문구가 없으면 검사를 다시 해야함 
				alert("다시 중복 확인을 해주세요.");
				return;
			}
			
			$.ajax({
				type : "POST"
				, url : "/lesson06/quiz02_3"
				, data : {"name":name, "url":url}
				, success : function(data) {
					if (data.result == 'success') {
						location.href = "/lesson06/quiz02_4";
					} else {
						alert("주소가 저장되지 못하였습니다.");
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