<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배탈의 민족</title>

	<!-- bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	
   	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="/css/store.css">
</head>
<body>
	<div class="wrap">
		<%-- 로고 --%>
		<header class="d-flex align-items-center bg-info">
			<h1><a href="/store/store_information" class="logo ml-3 text-white">배탈의 민족</a></h1>
		</header>
		
		<%-- 메인(가게들) --%>
		<section class="information">
			<div class="information">
				<div class="display-3 mb-3">우리동네 가게</div>
			</div>
			<form method="get" action="/store/reviews">
			<div class="stores d-flex flex-column">
				<c:forEach items="${storeList}" var="item">
						<a href="/store/reviews?id=${item.id}" target="_blank" class="box p-3 mb-3 store_info" id="id" name="id">
							<div><h3>${item.name}</h3></div>
							<div><h5>전화번호 : ${item.phoneNumber}</h5></div>
							<div><h5>주소 : ${item.address}</h5></div>
						</a>
				</c:forEach>
			</div>
			</form>
		</section>
		
		<%-- 회사정보 --%>
		<hr>
		<footer class="address">
			<div><h5>(주)우와한형제</h5></div>
			<div><h6 class="text-muted">고객센터 : 1500-1500</h6></div>			
		</footer>
	</div>
</body>
</html>