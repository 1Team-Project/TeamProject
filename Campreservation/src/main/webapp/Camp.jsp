<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link rel="stylesheet" href="Style.css">
</head>
<body>
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
             <div class="day">��</div>
             <div class="day">��</div>
             <div class="day">ȭ</div>
             <div class="day">��</div>
             <div class="day">��</div>
             <div class="day">��</div>
             <div class="day">��</div>
            </div>
           <div class="dates"></div>
        </div>
    </div>
    <script src="Camp.js"></script>
</body>
</html>