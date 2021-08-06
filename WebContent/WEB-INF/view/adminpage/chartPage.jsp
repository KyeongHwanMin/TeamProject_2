<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <!--  어드민쪽 헤더 태그(*) -->
  <%@ include file ="adminHeader.jsp" %>
    
  <div id="layoutSidenav_content">
   <main>
     <div class="container-fluid px-4">
        <h1 class="mt-4">찜하기 통계</h1>



 <%--     아래부터는 본문!    --%>
	    
	  <!-- 차트 링크 -->
	  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


				<div class="row">
				
			<div class="col-xl-6">
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 관광지 카테고리별 통계 </div>
					<div class="card-body">
						<canvas id="myChart" width="100%" height="50"></canvas>
					</div>
				</div>
			</div>
			
			<div class="col-xl-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-bar me-1"></i> 관광지 장소별 통계 </div>
					<div class="card-body">
						<canvas id="myChart2" width="100%" height="50"></canvas>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-pie me-1"></i> 숙소 카테고리별 통계 </div>
					<div class="card-body">
						<canvas id="myChart3" width="100%" height="50"></canvas>
					</div>
				</div>
			</div>

			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-pie me-1"></i> 숙소 장소별 통계 </div>
					<div class="card-body">
						<canvas id="myChart4" width="100%" height="50"></canvas>
					</div>
				</div>
			</div>
			
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-chart-pie me-1"></i> 숙소 장소별 통계 </div>
					<div class="card-body">
						<canvas id="myChart5" width="100%" height="50"></canvas>
					</div>
				</div>
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
	    

      
		  <%-- 관광지 카테고리별 통계 바 차트 --%>
		  <script type="text/javascript">
		    var ctx = document.getElementById('myChart');
		    var myChart = new Chart(ctx, {
		      type: 'bar',
		      data: {
		        labels: ['Nature', 'Healing', 'Leisure', 'History'],
		        datasets: [{
		          label: '인원',
		          data: [${location_category[0].count}, ${location_category[1].count}, ${location_category[2].count}, ${location_category[3].count}],
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
	  
		  <%-- 관광지 장소별 통계 바 차트 --%>
		  <script type="text/javascript">
		    var ctx = document.getElementById('myChart2').getContext('2d');
		    var chart = new Chart(ctx, {
		      // 챠트 종류를 선택
		      type: 'line',
		
		      // 챠트를 그릴 데이타
		      data: {
		        labels: ['제주시', '표선', '애월', '서귀포시', '제주공항', '함덕'],
		        datasets: [{
		          label: '인원',
		          backgroundColor: 'transparent',
		          borderColor: 'red',
		          data: [${location_location[0].count}, ${location_location[1].count}, ${location_location[2].count}, ${location_location[3].count},
		        	  ${location_location[4].count}, ${location_location[5].count}]
		        }]
		      },
		      // 옵션
		      options: {}
		    });
		  </script>
  
  
  
		 	<%-- 숙소 카테고리별 통계 파이 차트 --%>
		  <script type="text/javascript">
		  data = {
		        datasets: [{
		            backgroundColor: ['red','yellow','blue','orange'],
		            data: [${home_category[0].count}, ${home_category[1].count}, ${home_category[2].count}, ${home_category[3].count}]
		        }],       
		        // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
		        labels: ['호텔','펜션','게스트하우스','모텔'] 
		    };
		
		
		  var ctx2 = document.getElementById("myChart3");
		  var myDoughnutChart = new Chart(ctx2, {
		      type: 'doughnut',
		      data: data,
		      options: {}
		  });
		  </script>
  
		  	<%-- 숙소 장소별 통계 파이 차트 --%>
		    <script type="text/javascript">
			 
			var colors = ['red','skyblue','yellowgreen','violet','orange','gray','black'];
			
			
			var donutOptions = {
			  cutoutPercentage: 30, //도넛두께 : 값이 클수록 얇아짐
			  legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}}
			};
			
			
			var chDonutData1 = {
			    labels: ['중문', '함덕', '서귀포시','제주시','애월','표선','제주공항'],
			    datasets: [
			      {
			        backgroundColor: colors.slice(0,6),
			        borderWidth: 0,
			        data: [${home_location[0].count}, ${home_location[1].count}, ${home_location[2].count},
			        	${home_location[3].count}, ${home_location[4].count}, ${home_location[5].count}, ${home_location[6].count}]
			      }
			    ]
			};
			
			var chDonut1 = document.getElementById("myChart4");
			  if (chDonut1) {
			    new Chart(chDonut1, {
			      type: 'pie',
			      data: chDonutData1,
			      options: donutOptions
			  });
			}
			  
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