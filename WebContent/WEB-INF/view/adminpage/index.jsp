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
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">관광지 관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/jejuguseok/attractionForm.do">장소 등록하기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">숙소 관리</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/jejuguseok/homeForm.do">장소 등록하기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">알림(${count})</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="/jejuguseok/adminpage/list.do">답변하기</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                         
                        </div>
                        <div class="row">
                         
                                     
     <div class="col-lg-6">
          <div class="card mb-4">
            <div class="card-header">
               <i class="fas fa-chart-pie me-1"></i>
                  많이 가는 동반 유형                    
                    </div>
                      <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>              
                      <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>                
           </div>
      </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        회원 연령별 통계
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
      <div class="card-header">
          <i class="fas fa-table me-1"></i>
               회원 목록 
      </div>
            <div class="card-body">
               <table id="datatablesSimple">
                  <thead>
                    <tr>
                       <th>이름</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>거주지</th>
                        <th>나이</th>
                        <th>성별</th>
                       <th>가입 날짜</th>
                      <th>회원 상태</th>
                    </tr>
                  </thead>
                    <tfoot>
                      <tr>
                      <th>이름</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>거주지</th>
                        <th>나이</th>
                        <th>성별</th>
                       <th>가입 날짜</th>
                      <th>회원 상태</th>
                      <th></th>
                     </tr>
                   </tfoot>

              <tbody>
              
               <c:forEach var="userDTO" items="${list2}">
                        <tr>
                          <td>${userDTO.name}</td>
                          <td>${userDTO.user_id}</td>
                          <td>${userDTO.email}</td>
                          <td>${userDTO.address}</td>
                          <td>${userDTO.year_birth}</td>
                          <td>${userDTO.gender}</td>
                          <td>${userDTO.signupdate}</td>
                          <td>
                          	<c:if test="${userDTO.num==9}">관리자</c:if>
                          	<c:if test="${userDTO.num==0}">유저</c:if>
                          </td>
                            <td> <c:if test="${userDTO.num==0}">
                              <button type="button" class="btn btn-primary btn-sm" onclick ="window.location='memberDelete.do?user_id=${userDTO.user_id}'"> 회원 삭제 </button> 
                             </c:if>    
                          </td>
                       </tr>
                </c:forEach>   
             </tbody>
         </table>
      </div>
   </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
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
            labels: ["10~20", "20~30", "30~40", "40~50", "50~"],
            datasets: [{
              label: "회원 연령별 인원",
              backgroundColor: "rgba(2,117,216,1)",
              borderColor: "rgba(2,117,216,1)",
              data: [${to1020}, ${to2030}, ${to3040}, ${to4050}, ${to50}],
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
                  maxTicksLimit: 5
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
