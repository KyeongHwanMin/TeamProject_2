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

 <style>
  
</style>
</head>

<body>

	<div class="super_container">

		<%@ include file="/WEB-INF/view/userpage/header.jsp"%>

		<!-- 아래는 본인들의 내용 작성하기 -->

		<div id="map" style="width: 1500; height: 100vh;"></div>

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
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">주소</a></div> ' + 
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

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 		
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}
	</script>

	</div>		
</body>
</html>
