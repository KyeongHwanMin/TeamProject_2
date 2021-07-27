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
        <h1 class="mt-4">회원 목록</h1>
           <ol class="breadcrumb mb-4">
               <li class="breadcrumb-item"><a href="/jejuguseok/index.do">Dashboard</a></li>
               <li class="breadcrumb-item active">회원 목록</li>
           </ol>

<%--차트  --%>

<h1> 차트 </h1>
<div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        Pie Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>

 <%--     회원 목록 페이지    --%>

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
                       </tr>
                </c:forEach>   
             </tbody>
         </table>
      </div>
   </div>


<!--   -->

     </div>
   </main>
  </div>
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
            
            