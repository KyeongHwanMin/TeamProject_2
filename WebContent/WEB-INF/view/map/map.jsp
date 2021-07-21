<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Blog</title>
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



 <style>
  div.fheader {
        width: 100%;
         height:13%;
        display: flex;
        box-sizing: border-box;
      
       
      }
       div.r {
        width: 100%;
         height:87%;
        display: flex;
       
      }
      div.left {
     	width:70%;
        height:100%;
        float: left;
        box-sizing: border-box;
        background: #ece6cc;
      }
      div.right {
      	
     	width:30%;
     	height:100%;
        float: right;
        box-sizing: border-box;
        background: #ece6cc;
        overflow:auto;
      
      }
    </style>
</head>

<body>

<div class="fheader">
<%@ include file="/WEB-INF/view/userpage/header.jsp"%>
</div>
<div class="r">
      <div class="left">
		

		<!-- 아래는 본인들의 내용 작성하기 -->

		<div id="map" style="width: ; height: 87vh;"></div>

		<script
			src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a95cadba8f57feb150276e9f4194f8aa"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.433421435965604, 126.51971115454302), // 지도의 중심좌표
		        level: 9, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 
		

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		
		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);
		
		// 데이터
		
		<c:forEach var="maplist" items="${maplist}">

		// 마커 생성 표시
		var marker =  new kakao.maps.Marker({
			position:new kakao.maps.LatLng(${maplist.y}, ${maplist.x}),
			map:map
			});
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		//var iwContent = '<div style=padding:30px;>${maplist.address}<br><a href="http://localhost:8080/jejuguseok/index.do" style="color:blue" target="_blank">보기&nbsp</a> <a href="http://localhost:8080/jejuguseok/map.do" style="color:blue" target="_blank">&nbsp길찾기</a></div>'; 
		var iwContent =
        '          <div> &nbsp ${maplist.place}</div>' + 
        '               <div> &nbsp <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70"></div>' +
		'				<div>&nbsp	${maplist.address} </div>' +		
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
        ' 				<button type="button" id="${maplist.place}"  class="btn btn-success" onclick="add(this.id)" title="일정추가">일정추가</button>'+
        '                <div>&nbsp</div>';
	    
	    
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	     
	    content : iwContent, 
	    removable : iwRemoveable
	});
	kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

	</c:forEach>
	//============================
// 일정 추가 버튼 메서드
function add(id) {
    document.getElementById()
}
	
// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 		
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}
	</script>
</div>
<div class="right">
<form action="schedule_pro.do" method="post" id="contactForm"  >

    <legend>일정 조회</legend>

  <input type='date' name='date'/>
  <fieldset class="form-group">
      <legend class="mt-4">예상일정</legend>
     <select class="form-select" aria-label="Default select example" id="day" name="day">
  <option selected>여행 일수</option>
  <option value="1">1박2일</option>
  <option value="2">2박3일</option>
  <option value="3">3박4일</option>
  <option value="4">4박5일</option>
  <option value="5">5박6일</option>
  <option value="6">6박7일</option>
</select>   
    </fieldset>
    
    <fieldset class="form-group">
      <legend class="mt-4">동반유형</legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="with" id="with" value="혼자" checked="">
          혼자
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="with" id="with" value="커플">
          커플
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="with" id="with" value="가족">
          가족
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="with" id="with" value="2~4명">
          2~4명
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="with" id="with" value="5명 이상">
          5명 이상
        </label>
      </div>
      
    </fieldset>
    
    <fieldset class="form-group">
      <legend class="mt-4">여행목적</legend>
      <div class="form-check">
                <input class="form-check-input" id="역사문화" type="checkbox" name="travel" value="역사/문화" />
                <label class="form-check-label" for="역사문화">역사/문화</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" id="자연경치" type="checkbox" name="travel" value="자연/경치" />
                <label class="form-check-label" for="자연경치">자연/경치</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" id="레처체험학습" type="checkbox" name="travel" value="레처/체험/학습" />
                <label class="form-check-label" for="레처체험학습">레처/체험/학습</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" id="휴식힐링" type="checkbox" name="travel" value="휴식/힐링" />
                <label class="form-check-label" for="휴식힐링">휴식/힐링</label>
            </div>
	</fieldset>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 


  <input type="submit" value="저장 하기">
  </form>
 </div> 
 </div>









</body>
</html>