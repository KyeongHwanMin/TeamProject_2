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
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        
                        <div class="row">
                       
     <div class="col-lg-6">
          <div class="card mb-4">
            <div class="card-header">
               <i class="fas fa-chart-pie me-1"></i>
                   카테고리별 통계                                
                    </div>
                      <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>              
                      <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>                
           </div>
      </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        성별 통계 
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            
                             <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        회원별 카테고리 통계  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                         red=20대,yellow=30대,blue=40대,green=50대 
                                    </div>
                                    <div class="card-body"><canvas id="ageChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        
                        
                        </div>                  
                    </div>
                    
               </main>
          </div>
                       
     
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/assets/demo/chart-area-demo.js"></script>
        <script type="text/javascript">
     // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';

        // Bar Chart Example
        var ctx = document.getElementById("myBarChart");
        var myLineChart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ["남", "여"],
            datasets: [{
              label: "성별 별 통계",
              backgroundColor: "rgba(2,117,216,1)",
              borderColor: "rgba(2,117,216,1)",
              data: [],
            }],
          },
          options: {
            scales: {
              xAxes: [{
                time: {
                  unit: 'month'
                },
                gridLines: {
                  display: false
                },
                ticks: {
                  maxTicksLimit: 6
                }
              }],
              yAxes: [{
                ticks: {
                  min: 0,
                  max: 50,
                  maxTicksLimit: 4
                },
                gridLines: {
                  display: true
                }
              }],
            },
            legend: {
              display: false
            }
          }
        });
        
        
        
        
        
        </script>
        
        <script type="text/javascript"> 
       	  //파이 차트 - 동행 유형 
         // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';
        
        var ctx = document.getElementById("myPieChart");
        var myPieChart = new Chart(ctx, {
          type: 'pie',
          data: {
            labels: ["역사/문화", "자연/경치", "레저/체험/학습", "휴식/힐링"],
            datasets: [{
            data: [${history_list[0].count}, ${nature_list[0].count}, ${leisurel_list[0].count}, ${healing_list[0].count}],
              backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', '#a72898'],
            }],
          },
        });
        
        </script>
       
        <script>
        // 다중차트
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
         
        
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/jejuguseok/adminStyle/js/datatables-simple-demo.js"></script>
    </body>
</html>
