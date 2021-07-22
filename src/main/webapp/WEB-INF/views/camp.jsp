<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../design/header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/main/css/camp.css" >
</head>
<body>
<div class="row">
  		<div class="row">
  		<div class="col-md-1"></div>
  			<div class="main_left">
		    	<div class="col-md-12 colorthema hh4 padding6px margintb20"> 예약하기 </div>
     					<img src="/resources/main/images/camp.jpg">
    		</div>
    		<div class="main_right">
				<div class="col-md-12  hh4 padding6px margintb20"> 달력 </div>
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
		</div>
	<div class="col-md-12"></div>
</div>

<div class="reservation">
	<div class="col-md-2"></div>
	<form>
      <p><input type="date"></p>
      <p><input type="date"></p>
      <p><input type="submit" value="Submit"></p>
    </form>
</div>
   <script src="../../resources/main/js/camp.js"></script>


</body>
</html>
<%@include file="../design/footer.jsp" %>