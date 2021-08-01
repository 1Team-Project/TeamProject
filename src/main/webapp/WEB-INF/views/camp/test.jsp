<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../design/header.jsp" %>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
<link href='${pageContext.request.contextPath}/resources/main/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/main/fullcalendar-5.9.0/lib/main.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyCg0PD8H71-0PruOX_43yU0-Xxdn_whFFM',
    eventSources: [
    {
          googleCalendarId: '5ml1p9ttlq4q0pl03nr1g60cko@group.calendar.google.com',
          className: 'CampUs',
          color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          //textColor: 'black' 
        }
    ,{
        googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com"
      , className : "koHolidays"
      , color : "#FF0000"
      , textColor : "#FFFFFF"
  }
    
    ]
  });
  calendar.render();
});


</script>
<style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>

<%@include file="../../design/footer.jsp" %>