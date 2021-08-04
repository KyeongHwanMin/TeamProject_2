<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <!--  어드민쪽 헤더 태그(*) -->
  <%@ include file ="../adminHeader.jsp" %>
    
  <div id="layoutSidenav_content">
   <main>
     <div class="container-fluid px-4">
        <h3 class="mt-4">관광지 정보 수정</h3>
           <ol class="breadcrumb mb-4">
               <li class="breadcrumb-item"><a href="/jejuguseok/adminpage/index.do">Admin Main</a></li>
               <li class="breadcrumb-item"><a href="attractionForm.do">관광지 등록</a></li>
           </ol>

<!-- 관광지 수정 -->
<div id="layoutSidenav_content">
<main>
<div class="container-fluid px-4">
<div class="card mb-4">

<form action="attupdatePro.do?no=${no}" method="post" enctype="multipart/form-data">
<input type="hidden" id="type" name="type" value="attraction">
<input type="hidden" id="no" name="no" value="${lo.no}">
	<!-- 관광지 번호: ${lo.no} <br />	 -->
	관광지명: <input type="text" name ="name" value="${lo.name}"/> <br />	
	관광지 주소: <input type="text" name ="address" value="${lo.address}" /> <br />	
	관광지 정보: <textarea id="content" name ="content" rows="5" cols="20" > ${lo.content} </textarea> <br />
	위도: <input type="text" id="x" name="x"  value="${lo.x}" ><br/>
	경도: <input type="text" id="y" name="y" value="${lo.y}"><br/>
<div class="form-group">
  <label class="col-md-4 control-label" for="location">지역 선택</label>
  <div class="col-md-4">
    <select id="location" name="location" class="form-control">
      <option value="${lo.location}">${lo.location}</option>
      <option value="jejusi">제주시</option>
      <option value="seoquiposi">서귀포시</option>
      <option value="jungmun">중문</option>
      <option value="jejuairport">제주국제공항</option>
      <option value="aweol">애월/한림/협재</option>
      <option value="pyoseon">표선/상산</option>
      <option value="hamduk">함덕/김녕/세화</option>
    </select>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="category">테마 선택</label>
  <div class="col-md-4">
    <select id="category" name="category" class="form-control">
      <option value="${lo.category}">${lo.category}</option>
				<option value="history">역사/문화</option>
				<option value="nature">자연/경치</option>
				<option value="healing">휴식/힐링</option>
				<option value="leisure">레저/체험/학습</option>
    </select>
  </div>
</div>

	<input type="submit" value ="수정"onclick="adminpage/index.do"/>
	<input type="button" value="취소" onclick="adminpage/index.do">
	 <br/>
</form>

</div>
</div>
</main>
</div>