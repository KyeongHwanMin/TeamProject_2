<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 
숙소 번호: num(시퀀스 자동생성)
숙소명: name
위도 경도: x, y
숙소 주소: address
숙소 정보: content
지역 분류: location
숙소 분류: type
숙소 이미지: img
 -->


<form class="form-horizontal" action="homePro.do" method="post" enctype="multipart/form-data">
<!-- 숙소 지역/정보 등록 -->
<legend>숙소 지역/정보 등록</legend>
	<input type="hidden" id="type" name="type" value="home">
	숙소명: <input type="text" name ="name" /> <br />	
	숙소 주소: <input type="text" name ="address" /> <br />	
	숙소 정보: <textarea id="content" name ="content" rows="5" cols="20"> </textarea> <br />
	위도: <input type="text" id="x" name="x" placeholder="GoogleMap 33.~"><br/>
	경도: <input type="text" id="y" name="y" placeholder="GoogleMap 126.~"><br/>
<!-- 숙소 지역 선택 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="location">지역 선택</label>
  <div class="col-md-4">
    <select id="location" name="location" class="form-control">
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
  <label class="col-md-4 control-label" for="category">숙소 선택</label>
  <div class="col-md-4">
    <select id="category" name="category" class="form-control">
      <option value="motel">모텔</option>
      <option value="guesthouse">게스트하우스</option>
      <option value="pention">펜션</option>
      <option value="hotel">호텔</option>
    </select>
  </div>
</div>
	이미지: <input type="file" name="img" /><br />
	<input type="submit" value ="확인" />
	<input type="button" value="취소" onclick="/WEB-INF/view/adminpage/index.jsp">
	 <br/>
</form>