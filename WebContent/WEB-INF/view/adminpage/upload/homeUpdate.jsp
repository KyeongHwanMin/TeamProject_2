<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
숙소 정보 업데이트!@@
 -->

<!-- Header -->
<%@ include file ="../adminHeader.jsp" %>


<div id="layoutSidenav_content">
<main>
<div class="container-fluid px-4">
<div class="card mb-4">
<form class="form-horizontal" action="homeUpdatePro.do?home_no=${home_no}" >


<legend>숙소 지역/정보 수정 </legend>
	숙소명: <input type="text" name ="home_name"   value="${dto.home_name}"/> <br />	
	숙소 주소: <input type="text" name ="home_address" value="${dto.home_address}" /> <br />	
	숙소 정보: <textarea id="home_content" name ="home_content" rows="5" cols="20" > ${dto.home_content} </textarea> <br />
	위도: <input type="text" id="x" name="x"  value="${dto.x}" ><br/>
	경도: <input type="text" id="y" name="y" value="${dto.y}"><br/>


<!-- 숙소 지역 선택 -->
 
<div class="form-group">
  <label class="col-md-4 control-label" for="home_local">지역 선택</label>
  <div class="col-md-4">
    <select id="home_local" name="home_local" class="form-control">
      
      <option value="${dto.home_local}"> ${dto.home_local} </option>

      <option value="jejusi">제주시</option>
      <option value="seogwiposi">서귀포시</option>
      <option value="jungmun">중문</option>
      <option value="jejuairport">제주국제공항</option>
      <option value="aweol">애월/한림/협재</option>
      <option value="pyoseon">표선/상산</option>
      <option value="hamduk">함덕/김녕/세화</option>
    </select>
  </div>
</div>


<!-- 숙소 유형 선택 -->

<div class="form-group">
  <label class="col-md-4 control-label" for="home_type">숙소 선택</label>
  <div class="col-md-4">
    <select id="type" name="home_type" class="form-control">
      <option value="${dto.home_type}">${dto.home_type}</option>
      <option value="motel">모텔</option>
      <option value="guesthouse">게스트하우스</option>
      <option value="pention">펜션</option>
      <option value="hotel">호텔</option>
    </select>
  </div>
</div>


	이미지: <input type="file" name="home_img" /><br />
	<input type="submit" value ="수정" />
	<input type="button" value="취소" onclick="adminpage/index.do">
	 <br/>
</form>

</div>
</div>
</main>
</div>