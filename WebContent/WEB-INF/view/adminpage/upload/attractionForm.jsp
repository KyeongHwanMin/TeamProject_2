<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 관리자용
관광지 번호: place_num(시퀀스 자동생성)
장소: place_name
주소: place_address
장소 정보: place_content
관광지 분류: place_category
관광지 지역: place_local
관광지 이미지: place_img
 -->

<form action="attractionPro.do" method="post" enctype="multipart/form-data">
	장소명: <input type="text" name="place_name" /> <br /> 주소: <input
		type="text" name="place_address" /> <br /> 장소 정보:
	<textarea id="content" name="place_content" rows="5" cols="20"> </textarea>
	<br />
	
	<div class="form-group">
		<label class="col-md-4 control-label" for="place_category">관광지
			선택</label>
		<div class="col-md-4">
			<select id="place_category" name="place_category"
				class="form-control">
				<option value="history">역사/문화</option>
				<option value="nature">자연/경치</option>
				<option value="healing">휴식/힐링</option>
				<option value="leisure">레저/체험/학습</option>
			</select>
		</div>
	</div>
	<!-- 숙소 지역 선택 -->
<div class="form-group">
  <label class="col-md-4 control-label" for="place_local">지역 선택</label>
  <div class="col-md-4">
    <select id="place_local" name="place_local" class="form-control">
      <option value="jejusi">제주시</option>
      <option value="seogwiposi">서귀포시</option>
      <option value="jungmun">중문</option>
      <option value="jejuairport">제주국제공항</option>
      <option value="aweol">애월/한림/협재</option>
      <option value="pyoseon">표선/성산</option>
      <option value="hamduk">함덕/김녕/세화</option>
    </select>
  </div>
</div>

	이미지: <input type="file" name="place_img" /><br /> <input
		type="submit" value="확인" /> <input type="button" value="취소"
		onclick="/WEB-INF/view/adminpage/index.jsp"> <br />
</form>
