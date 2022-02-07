<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2015 날씨 정보</title>

	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	
   	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</head>
<body>
	<div class="container">
		<div class="d-flex">
			<!-- menu -->
			<section class="col-1">
			</section>
			<section class="col-11">
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${WeatherHistoryList}" var="item">
						<tr>
							<td>
								<fmt:formatDate value="${item.date}" pattern="yyyy년 M월 d일"/>
							</td>
							<td>${item.weather}
								<c:choose>
									<c:when test="${item.weather == '맑음'}">
										<img src="/images/sunny.jpeg" alt="맑음아이콘">
									</c:when>
									<c:when test="${item.weather == '구름조금'}">
										<img src="/images/partlyCloudy.jpeg" alt="구름조금아이콘">
									</c:when>
									<c:when test="${item.weather == '흐림'}">
										<img src="/images/cloudy.jpeg" alt="흐림아이콘">
									</c:when>
									<c:when test="${item.weather == '비'}">
										<img src="/images/rainy.jpeg" alt="비아이콘">
									</c:when>
								</c:choose>
							</td>
							<td>${item.temperatures}°C</td>
							<td>${item.precipitation}mm</td>
							<td>${item.microDust}</td>
							<td>${item.windSpeed}km/h</td>
						</tr>
						</c:forEach>	
					</tbody>
				</table>
			</section>
		</div>
		<footer></footer>
	</div>
</body>
</html>