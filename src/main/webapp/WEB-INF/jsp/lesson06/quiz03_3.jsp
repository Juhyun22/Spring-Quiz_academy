<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>통나무 펜션 - 예약 목록</title>
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
					<img id="bannerImages" src="/images/cloudy.jpeg" alt="배너 사진">
				</div>
			</section>
			<section class="resverve-list">
				<h1>예약확인</h1>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" class="form-control" id="name" name="name">
				</div>
				<div class="form-group">
					<label for="phoneNumber">전화번호</label>
					<input type="text" class="form-control" id="phoneNumber" name="phoneNumber">
				</div>
				<button type="button" id="lookupBtn" class="btn btn-success">조회하기</button>
			</section>
		</div>
		<jsp:include page="booking_footer.jsp" />
	</div>
	
<script>
	$(document).ready(function(e) {
		
		// 조회하기 버튼 클릭 
		$('#lookupBtn').on('click', function(e) {
			let name = $('#name').val().trim();
			let phoneNumber = $('#phoneNumber').val().trim();
			
			// validation check
			if (name.length < 1) {
				alert("이름을 입력해주세요.");
				return;
			}
			
			if (phoneNumber == '') {
				alert("전화번호를 입력해주세요.");
				return;
			}
			
			if (phoneNumber.startsWith("010") == false) {
				alert("010으로 시작하는 번호만 입력할 수 있습니다.");
				return;
			}
			
			$.ajax({
				type: "POST"
				, url: "/lesson06/quiz03/6"
				, data: {"name":name, "phoneNumber":phoneNumber}
				, success: function(data) {
					// {"result":"success", "code":1, "booking":{"name":이름, "phoneNumber":~}}
					if (data.code == 1) {
						// 성공
						let book = data.booking;
						let message = "이름: " + book.name + "\n날짜: " + book.date.slice(0, 10) 
						+ "\n일수: " + book.day + "\n인원: " + book.headcount 
						+ "\n상태: " + book.state;
						
						alert(message);
					} else {
						// 없음
						alert("예약 내역이 없습니다.");
					}
				}
				, error: function(e) {
					alert("서버 통신 실패. 관리자에게 문의해주세요." + e);
				}
			});
		});
	});
</script>
</body>
</html>