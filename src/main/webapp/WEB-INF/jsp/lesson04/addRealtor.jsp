<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공인중개사 추가</title>
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	
   	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<form method="post" action="/lesson04/quiz02/add_realtor">
			<h1>공인중개사 추가</h1>
			
			<div class="form-group">
				<label for="office">상호명</label>
				<input type="text" id="office" name="office" class="form-control col-6" placeholder="중개사 이름을 작성하세요.">
			</div>
			
			<div class="form-group">
				<label for="phoneNumber">전화번호</label>
				<input type="text" id="phoneNumber" name="phoneNumber" class="form-control col-6" placeholder="ex) 010-5555-6666">
			</div>
			
			<div class="form-group">
				<label for="address">주소</label>
				<input type="text" id="address" name="address" class="form-control col-6" placeholder="중개사 위치를 작성하세요.">
			</div>
			
			<div class="form-group">
				<label for="grade">등급</label>
				<input type="text" id="grade" name="grade" class="form-control col-6" placeholder="중개사 등급을 작성하세요.">
			</div>
			
			<input type="submit" class="btn btn-primary" value="추가">
		</form>
	</div>
</body>
</html>