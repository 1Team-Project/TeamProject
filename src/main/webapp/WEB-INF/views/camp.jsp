<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/camp.css"/>
</head>
<body>
    <div calss="">
    	<div class="calendar">
        	<div class="header">
          		<div class="year-month"></div>
          			<div class="nav">
          	  		<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
          	  		<button class="nav-btn go-today" onclick="goToday()">Today</button>
          	  		<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
          		</div>
        	</div>
           	<div class="main">
            	<div class="days">
            	 <div class="day">일</div>
            	 <div class="day">월</div>
           	     <div class="day">화</div>
            	 <div class="day">수</div>
            	 <div class="day">목</div>
            	 <div class="day">금</div>
            	 <div class="day">토</div>
            </div>
           <div class="dates"></div>
        	</div>
   		</div>
    </div>
	<script src="/resources/main/js/camp.js"></script>
	
</body>

<%@include file="../design/footer.jsp" %>