<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>


 

<!DOCTYPE html>
<html lang="en">
     <!--  어드민쪽 헤더 태그(*) -->
  <%@ include file ="adminHeader.jsp" %>
            
            
 <%--    아래부터는 본문!      --%>
          
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">통계</h1>
    
                        <div class="row">
                        
                          <div class="col-lg-6">
          <div class="card mb-4">
            <div class="card-header">
               <i class="fas fa-chart-pie me-1"></i>
                  많이 가는 동반 유형                    
                    </div>
                      <div class="card-body"><canvas id="with" width="100%" height="50"></canvas></div>              
                      <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>                
           </div>
      </div>
          
     <div class="col-lg-6">
          <div class="card mb-4">
            <div class="card-header">
               <i class="fas fa-chart-pie me-1"></i>
                   카테고리별                               
                    </div>
                      <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>              
                      <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>                
           </div>
      </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        남자
                                    </div>
                                    <div class="card-body"><canvas id="horizontalBar" width="100%" height="40"></canvas></div>
                                </div>
                            </div>                             
                            
                             <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        나이대별 카테고리   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                         red=20대 &nbsp yellow=30대 &nbsp blue=40대 &nbsp green=50대 
                                    </div>
                                    <div class="card-body"><canvas id="ageChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                             <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        여자 
                                    </div>
                                    <div class="card-body"><canvas id="horizontalBar1" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        <canvas id="lineChart"></canvas>
                        
                        </div>                  
                    </div>
                    
               </main>
          </div>
           
     
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/assets/demo/chart-area-demo.js"></script>
     
     <script type="text/javascript">
     // 남자
     new Chart(document.getElementById("horizontalBar"), {
    	 "type": "horizontalBar",
    	 "data": {
    	 "labels": ["역사/문화", "자연/경치", "레저/체험/학습", "휴식/힐링"],
    	 "datasets": [{
    	 "label": "카테고리",
    	 data: [${list_male[2].count},${list_male[1].count},${list_male[0].count},${list_male[3].count}],
    	 "fill": false,
    	 "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
    	 "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
    	 "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"
    	 ],
    	 "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
    	 "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"
    	 ],
    	 "borderWidth": 1
    	 }]
    	 },
    	 "options": {
    	 "scales": {
    	 "xAxes": [{
    	 "ticks": {
    	 "beginAtZero": true
    	 }
    	 }]
    	 }
    	 }
    	 });
     </script>   
         <script type="text/javascript">
         //여자
     new Chart(document.getElementById("horizontalBar1"), {
    	 "type": "horizontalBar",
    	 "data": {
    	 "labels": ["역사/문화", "자연/경치", "레저/체험/학습", "휴식/힐링"],
    	 "datasets": [{
    	 "label": "카테고리",
    	 data: [${list_female[3].count},${list_female[1].count},${list_female[0].count},${list_female[2].count}],
    	 "fill": false,
    	 "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
    	 "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
    	 "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"
    	 ],
    	 "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
    	 "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)"
    	 ],
    	 "borderWidth": 1
    	 }]
    	 },
    	 "options": {
    	 "scales": {
    	 "xAxes": [{
    	 "ticks": {
    	 "beginAtZero": true
    	 }
    	 }]
    	 }
    	 }
    	 });
     </script>   
        
        
        
       
   
        <script type="text/javascript"> 
       	  //파이 차트 - 카테고리별 
         // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';
        
        var ctx = document.getElementById("myPieChart");
        var myPieChart = new Chart(ctx, {
          type: 'pie',
          data: {
            labels: ["역사/문화", "자연/경치", "레저/체험/학습", "휴식/힐링"],
            datasets: [{
            data: [${category_list[3].count}, ${category_list[1].count}, ${category_list[0].count}, ${category_list[2].count}],
              backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#a72898'],
            }],
          },
        });
        
        </script>
       
        <script>
        // 다중차트,나이대별
        const colors = ['red','yellow','blue','#a72898','#28a745']; 
        var chBar = document.getElementById("ageChart"); 
        var chartData = { labels: ["역사/문화", "자연/경치", "레저/체험/학습", "휴식/힐링"], 
        		datasets:
        			[{ data: [${list_20[3].count},${list_20[1].count},${list_20[2].count},${list_20[0].count}], 
        				backgroundColor: colors[0] }, 
        			{ data: [${list_30[2].count},${list_30[0].count},${list_30[1].count},${list_30[3].count}],
        					backgroundColor: colors[1] },
        			{ data: [${list_40[3].count},${list_40[2].count},${list_40[0].count},${list_40[1].count}], 
        						backgroundColor: colors[2] },
        			{ data: [${list_50[3].count},${list_50[1].count},${list_50[0].count},${list_50[2].count},], 
        							backgroundColor: colors[4] }] }; 
        var myChart = new Chart(chBar, { 
        	// 챠트 종류를 선택 
        	type: 'bar', 
        	// 챠트를 그릴 데이타 
        	data: chartData, 
        	// 옵션 
        	options: { 
        		legend: { 
        			display: false 
        			} } });

        
        </script>
       
   <script type="text/javascript"> 
       	  //파이 차트 - 동행 유형 
         // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';
        
        var ctx = document.getElementById("with");
        var myPieChart = new Chart(ctx, {
          type: 'pie',
          data: {
            labels: ["혼자", "커플", "가족", "2인~4인", "5인 이상"],
            datasets: [{
              data: [${alone}, ${couple}, ${fam}, ${over2}, ${over5}],
              backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#a72898'],
            }],
          },
        });
        
        </script>

        
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/js/datatables-simple-demo.js"></script>
    </body>
</html>
