<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <!--  어드민쪽 헤더 태그(*) -->
  <%@ include file ="adminHeader.jsp" %>

	
	<!--  본문  -->
	
	  <title>부트스트랩 차트그리기</title>
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	    
	  <!-- 차트 링크 -->
	  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

	<body>
	  <div class="container">
	    <canvas id="myChart"></canvas>
	  </div>

	  <!-- 부트스트랩 -->
	  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	    crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	    crossorigin="anonymous"></script>
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	    crossorigin="anonymous"></script>
	  <!-- 차트 -->
	  <script>
	    var ctx = document.getElementById('myChart');
	    var myChart = new Chart(ctx, {
	      type: 'bar',
	      data: {
	        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
	        datasets: [{
	          label: '# of Votes',
	          data: [12, 19, 3, 5, 2, 3],
	          backgroundColor: [
	            'rgba(255, 99, 132, 0.2)',
	            'rgba(54, 162, 235, 0.2)',
	            'rgba(255, 206, 86, 0.2)',
	            'rgba(75, 192, 192, 0.2)',
	            'rgba(153, 102, 255, 0.2)',
	            'rgba(255, 159, 64, 0.2)'
	          ],
	          borderColor: [
	            'rgba(255, 99, 132, 1)',
	            'rgba(54, 162, 235, 1)',
	            'rgba(255, 206, 86, 1)',
	            'rgba(75, 192, 192, 1)',
	            'rgba(153, 102, 255, 1)',
	            'rgba(255, 159, 64, 1)'
	          ],
	          borderWidth: 1
	        }]
	      },
	      options: {
	        scales: {
	          yAxes: [{
	            ticks: {
	              beginAtZero: true
	            }
	          }]
	        }
	      }
	    });

	  </script>
	</body>
	
<!-- BOTTOM  태그(*) -->
</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/assets/demo/chart-area-demo.js"></script>
        <script src="/jejuguseok/adminStyle/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/js/datatables-simple-demo.js"></script>
    </body>
</html>            