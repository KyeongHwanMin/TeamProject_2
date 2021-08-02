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
    <script type="text/JavaScript"  src=http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js></script>
    <script type="text/javascript">
  $(document).ready(function(){
    var rows = document.getElementById("tmp_table_body").getElementsByTagName("tr");
    
	
    // tr만큼 루프돌면서 컬럼값 접근
    for( var r=0; r<rows.length; r++ ){
      var cells = rows[r].getElementsByTagName("td");

      var cell_1 = cells[2].firstChild.data;		// 이름
      var cell_2 = cells[3].firstChild.data;		// 나이
      var cell_3 = cells[4].firstChild.data;		// 성별

      console.log(cell_1);	// 홍길동, 김영희
      console.log(cell_2);	// 23, 25
      console.log(cell_3);	// 남자,여자
    }
  });
</script>
    <script type="text/javascript">
 function remove_schedule0(){
 
    	    alert("클릭");
    	    subj.value=value;
    	    document.form.action= "sccedule_card_delete.do";
    	    document.form.submit();

    	   
 	 
 		 
    }
    function remove_schedule(r,num){
    	
    	
    	//var i=r.parentNode.parentNode.rowIndex;
    	// document.getElementById("My_schedule").deleteRow(i);
    	// var rows = document.getElementById("tmp_table_body").getElementsByTagName("tr");

    	    var form = $('#subj'+num)[0];  
	  		  var data = new FormData(form);	  
	  		  $.ajax({
	  			 type:"POST",
	  			 url:'sccedule_card_delete.do',
	  			 data : data,
	  			 processData: false,
	  			contentType: false,
	  			cache: false,  
	  		  });		
	  		 alert(num+"일차 저장 되었습니다.");
 	 
 		 
    }
    </script>
</head>
<body>

<%@ include file="/WEB-INF/view/userpage/header.jsp"%>
<br/><br/><br/>
<div class="container">
<c:if test="${count == 0}">
   <table width="700" border="1" cellpadding="0" cellspacing="0" id="Myschedule">
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
<table id="My_schedule" class="table table-hover table-striped text-center" style="border:1px solid;">
<thead>
	<tr>
		<th>번호</th>
		<th>여행 시작날짜</th>
		<th>일수</th>
		<th>계획 제목</th>
		<th>아이디</th>
		<th>삭제</th>
	</tr>
</thead>
<tbody id="tmp_table_body">
<c:forEach var="article" items="${articleList }" varStatus="status">
<c:set var="id" value="${article.user_id }"/>
<c:if test="${sessionScope.user_id == id}">
	<tr id="sc" name="sc">	
		<td id="number" style="width:5%;" >${number} <c:set var="number" value="${number-1 }"/></td>
		<td id="date" style="width:10%;">${article.date1 }</td>
		<td id="day"style="width:10%;">${article.day1 }</td>
		<td id="subject" style="display:none">${article.subject }</td>
		<td id="subject" style="width:50%;"><a href="schedule_table_content.do?num1=${article.num1}&pageNum=${currentPage}"> ${article.subject }</a></td>
		<td id="user_id">${article.user_id }</td>
		<td><input type="button" style="width:50pt" value="삭제" class="btn btn-success" onclick="remove_schedule(this,${ status.index})" /></td>
</c:if>
</c:forEach>
</tbody>
</table>
</c:if>
<br/>
<!--
<c:forEach var="article" items="${articleList }" varStatus="status"> 
  <form name="subj" id="subj"  method="post"action="sccedule_card_delete.do" > 
<div id="test">
  <textarea class="form-control" id="subject" name="subject" >${article.subject }</textarea> 	 
  <input type="button" style="width:50pt" value="삭제" class="btn btn-success" onclick="remove_schedule0()" /></div>
   </form>
</c:forEach>
 -->
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
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>