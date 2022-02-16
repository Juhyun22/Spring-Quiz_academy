<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>통나무 펜션 - 예약하기</title>
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- datepicker -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- stylesheet -->
	<link rel="stylesheet" type="text/css" href="/css/booking.css">
</head>
<body>
	<div class="container">
		<jsp:include page="booking_header.jsp"/>
		<jsp:include page="booking_menu.jsp"/>
		<div class="contents">
			<section class="reserve-title d-flex justify-content-center align-items-center">
				<div>
					<h1>예약 하기</h1>
				</div>
			</section>
			<section class="resverve-list d-flex">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="form-group">
						<label for="name"><b>이름</b></label>
						<input type="text" class="form-control" id="name" name="name">
					</div>
					<div class="form-group">
						<label for="date"><b>예약날짜</b></label>
						<input type="text" class="form-control" id="date" name="date">
					</div>
					<div class="form-group">
						<label for="day"><b>숙박일수</b></label>
						<input type="text" class="form-control" id="day" name="day">
					</div>
					<div class="form-group">
						<label for="headcount"><b>숙박인원</b></label>
						<input type="text" class="form-control" id="headcount" name="headcount">
					</div>
					<div class="form-group">
						<label for="phoneNumber"><b>전화번호</b></label>
						<input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
					</div>
					
					<button type="button" class="reserveBtn btn btn-warning form-control">예약하기</button>
				</div>
				<div class="col-3"></div>
			</section>
		</div>
		<jsp:include page="booking_footer.jsp" />
	</div>
	
<script>
	$(document).ready(function(e) {
		// datepicker (예약날짜)
		$('#date').datepicker({
			dateFormat: 'yy-mm-dd'
			, minDate: 0 // 오늘부터 그 뒤 선택
		});
		
		$('.reserveBtn').on('click', function(e) { 
			let name = $('#name').val().trim();
			let date = $('#date').val().trim();
			let day = $('#day').val().trim();
			let headcount = $('#headcount').val().trim();
			let phoneNumber = $('#phoneNumber').val().trim();
			
			// validaton check
			if (name == '') {
				alert("이름을 입력해주세요.");
				return;
			}
			
			if (date.length < 1) {
				alert("날짜를 선택해주세요.");
				return;
			}
			
			if (day == '') {
				alert("숙박일을 입력해주세요.");
				return;
			}
			
			if (isNaN(day)) { // 숫자가 아닌 경우 
				alert("숙박일은 숫자만 입력 가능합니다.");
				return;
			}
			
			if (headcount.length < 1) {
				alert("숙박인원을 입력해주세요.");
				return;
			}
			
			if (isNaN(headcount)) {
				alert("숙박인원은 숫자만 입력 가능합니다.");
				return;
			}
			
			if (phoneNumber == '') {
				alert("전화번호를 입력해주세요.");
				return;
			}
			
			$.ajax ({
				type: "POST"
				, url: "/lesson06/quiz03/4"
				, data: {"name":name, "date":date, "day":day, "headcount":headcount, 
					"phoneNumber":phoneNumber}
				, success: function(data) {
					if (data.code == 1) {
						alert("예약이 완료되었습니다.");
						location.href = "/lesson06/quiz03/1";
					} else {
						alert("예약 처리에 실패했습니다. 관리자에게 문의해주세요.");
					}
				}
				, error: function(e) {
					alert("예약하는데 실패했습니다. 관리자에게 문의해주세요." + e);
				}
			});
		});
	});
</script>
</body>
</html>