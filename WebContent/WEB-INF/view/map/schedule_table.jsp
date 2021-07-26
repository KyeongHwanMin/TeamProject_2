<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
<title>table</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="plugins/colorbox/colorbox.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet" type="text/css" href="styles/blog_styles.css">
<link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">


<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<meta http-equiv="X-UA-Compatible" content="ie=edge"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
  
       div.r {
        width: 100%;
        height:100%;
       
        display: flex; 
        table-align:center;   }
    
    </style>
</head>
<body>

<%@ include file="/WEB-INF/view/userpage/header.jsp"%>
<br/><br/><br/>
<div class="container">
<c:if test="${count == 0}">
   <table width="700" border="1" cellpadding="0" cellspacing="0">
   <tr>
       <td align="center">
       게시판에 저장된 글이 없습니다.
       </td>
   </table>
</c:if>

<c:if test="${count > 0}">

<br/>

<h1 class="text-center"><a href="#">내 여행 일정 표</a> </h1>
<br/><br/>
<table class="table table-hover table-striped text-center" style="border:1px solid;">
<thead>
	<tr>
		<th>번호</th>
		<th>여행 시작날짜</th>
		<th>일수</th>
		<th>계획 제목</th>
		<th>아이디</th>
	</tr>
</thead>
<tbody>
<c:forEach var="article" items="${articleList }">
	<tr>	
		<td style="width:5%;" >${number} <c:set var="number" value="${number-1 }"/></td>
		<td style="width:10%;">${article.date1 }</td>
		<td style="width:10%;">${article.day1 }</td>
		<td style="width:50%;"><a href="schedule_table_content.do?num1=${article.num1}&pageNum=${currentPage}"> ${article.subject }</a></td>
		<td>${article.id }</td>
	</tr>	

</c:forEach>
</tbody>
</table>
</c:if>
<br/>
<div>
	<ul class="pagination justify-content-center">
<c:if test="${count > 0}">
 <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
       <li> <a href="schedule_table.do?pageNum=${startPage - 10 }" style="margin-right:5px;" class="text-secondary">◀</a></li>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <li> <a href="schedule_table.do?pageNum=${i}" style="margin-right:5px;" class="text-secondary">${i}</a></li>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
       <li> <a href="schedule_table.do?pageNum=${startPage + 10}" style="margin-right:5px;" class="text-secondary">▶</a></li>
   </c:if>
</c:if>
</ul>

</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>