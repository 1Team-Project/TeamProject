<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../design/header.jsp" %>
</head>
<body>
		<div class="row">
		 	<div class="col-md-1"></div>
		  	<div class="col-md-10">
		  		<div class="row">
		  			<div class="main_left">
				    	<div class="col-md-12 colorthema hh4 padding6px margintb20"> 예약하기 </div>
       					<div class="slide_opt">
       						<input type="radio" name="img" id="img1" checked/>
       						<ul class="slide_img">
	        					<li><img src="../../resources/main/images/cmap.jpg"/></li>
	        				</ul>
            			</div>
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
		    </div>
			<div class="col-md-12"></div>
		</div>
		
		<div class="reservation">
			<div class="col-md-1"></div>
			
			
		
		</div>
	    <script src="../../resources/main/js/camp.js"></script>

<%@include file="../design/footer.jsp" %>
</body>
</html>