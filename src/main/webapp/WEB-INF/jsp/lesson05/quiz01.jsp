<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL Core 라이브러리 (1)</title>
</head>
<body>
	<h1>1. JSTL core 변수</h1>
	<c:set var="number1" value="36"/>
	<c:set var="number2">3</c:set>
	
	<b>첫번째 숫자 : ${number1}</b> <br> <%-- <h3></h3>으로 했어도 됐음.. --%>
	<b>두번째 숫자 : ${number2}</b> <br>
	
	<h1>2. JSTL core 연산</h1>
	<b>더하기 : ${number1 + number2}</b> <br>
	<b>빼기 : ${number1 - number2}</b> <br>
	<b>곱하기 : ${number1 * number2}</b> <br>
	<b>나누기 : ${number1 / number2}</b> <br>
	
	<h1>3. JSTL core out</h1>
	<c:out value="<title>core out</title>" />
	
	<h1>4. JSTL core if</h1>
	<c:set var="average" value="${(number1 + number2) / 2}"/>
	<c:if test="${average >= 10}">
		<h1>${average}</h1>
	</c:if>
	<c:if test="${average < 10}">
		<h3>${average}</h3>
	</c:if>
	
	<h1>5. JSTL core if - alert</h1>
	<c:if test="${number1 * number2 > 100}">
		<script>alert('너무 큰 수 입니다.');</script>
	</c:if>
</body>
</html>