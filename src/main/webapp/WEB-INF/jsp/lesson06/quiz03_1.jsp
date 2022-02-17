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
					<h1>예약 목록 보기</h1>
				</div>
			</section>
			<section class="resverve-list">
				<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${bookingList}" var="booking">
							<tr>
								<td>${booking.name}</td>
								<td>
									<fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일"/>
								</td>
								<td>${booking.day}</td>
								<td>${booking.headcount}</td>
								<td>${booking.phoneNumber}</td>
								<td>
									<c:choose>
										<c:when test="${booking.state eq '대기중'}">
											<span class="text-info">대기중</span>
										</c:when>
										<c:when test="${booking.state == '확정'}">
											<div class="text-success">확정</div>
										</c:when>
										<c:when test="${booking.state == '취소'}">
											<div class="text-success">취소</div>
										</c:when>
									</c:choose>
								</td>
								<td>
									<button type="button" class="del-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</div>
		<jsp:include page="booking_footer.jsp" />
	</div>
	
<script>
	$(document).ready(function(e) {
		$('.del-btn').on('click', function(e) {
			let id = $(this).data('booking-id');
			
			$.ajax({
				type: "DELETE"
				, url: "/lesson06/quiz03/2"
				, data: {"id":id}
				, success: function(data) {
					if (data.result == "success") {
						alert("삭제 성공");
						location.reload(); // 성공적으로 삭제된 후에 새로고침 
					} else {
						alert("삭제 하는데 실패하였습니다. 관리자에게 문의하여주세요.");
					}
				}
				, error: function(e) {
					alert("error: " + e);
				}
			}); 
		});
		
	});
</script>
</body>
</html>