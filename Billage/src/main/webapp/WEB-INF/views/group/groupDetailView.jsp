<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />


  <title>
    dateClick and selectable dates/times - Demos | FullCalendar
  </title>


<link href='/docs/dist/demo-to-codepen.css' rel='stylesheet' />


  <style>

    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 1100px;
      margin: 40px auto;
    }

  </style>



<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>

  





  <script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      selectable: true,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      dateClick: function(info) {
        alert('clicked ' + info.dateStr);
      },
      select: function(info) {
        alert('selected ' + info.startStr + ' to ' + info.endStr);
      }
    });

    calendar.render();
  });

</script>

</head>
<body>
  <div class='demo-topbar'>
  <button data-codepen class='codepen-button'>Edit in CodePen</button>

  

  
    Use your mouse or touch device to click/select dates/times
  
</div>

  <div id='calendar'></div>
</body>

</html>
