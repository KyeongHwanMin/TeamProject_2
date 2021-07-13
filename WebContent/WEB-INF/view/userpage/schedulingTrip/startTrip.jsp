<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>start your trip</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/blog_styles.css">
<link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">
</head>

<body>
<div class="super_container">

<%@ include file ="../header.jsp" %>



<input type="hidden" id="userIdCheck" value="${userId}">

<div id="plannerDiv">
	
	<!-- 계획 입력 -->
	
	<div class="col-md-12">
	<form id="planFrm" name="planFrm" >
		<div class="row">
			<div class="form-group col-sm-12">
				<label>일정 이름</label>
				<input type="text" class="form-control" id="planTitle" name="planTitle" value="" placeholder="일정 제목 입력"/>
			</div>
			<div class="form-group col-sm-6">
				<label>여행 날짜</label>
				<input type="date" class="form-control" id="startDate" name="startDate" value="<fmt:formatDate value="" pattern="yyyy-MM-dd"/>"/>
			</div>
			
			<div class="form-group col-sm-4">
				<label>여행 일수</label>
				<div class="dropdown">
					<button class="btn btn-day btn-primary dropdown-toggle" id="method_status" type="button" id="dropdownMenuButton" data-toggle="dropdown">
					 일수
					</button>
					<ul id="method_type" class="dropdown-menu"  style="text-align:center;">	
						<li class="dropdown-item"><a href="#" id="planTotalDay" value="1"><div>1일</div></a></li>
						<li class="dropdown-item"><a href="#" id="planTotalDay" value="2"><div>2일</div></a></li>
						<li class="dropdown-item"><a href="#" id="planTotalDay" value="3"><div>3일</div></a></li>
						<li class="dropdown-item"><a href="#" id="planTotalDay" value="4"><div>4일</div></a></li>
						<li class="dropdown-item"><a href="#" id="planTotalDay" value="5"><div>5일</div></a></li>
						<li class="dropdown-item"><a href="#" id="planTotalDay" value="6"><div>6일</div></a></li>
						<li class="dropdown-item"><a href="#" id="planTotalDay" value="7"><div>7일</div></a></li>
					</ul>
				</div>
			</div>
			<div class="form-group col-sm-2">
				<input type="button" class="btn btn-primary mb-3" id="planFrmSubmit" name="planFrmSubmit" value="작성" style="float:right; margin-top: 25px;">
			</div>
		</div>
	</form>
	</div>
	<!-- 계획 입력 끝 -->
	
	
	
	<!-- 계획 출력 DIV -->
	<div id="schDiv"></div>
	</div>
</div>
</body>