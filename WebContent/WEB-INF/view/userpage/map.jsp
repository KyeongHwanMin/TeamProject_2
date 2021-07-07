<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="utf-8">
	<title>다음 지도 API</title>
</head>
<body>
	<div id="map" style="width:100%;height:100vh;"></div>

	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a95cadba8f57feb150276e9f4194f8aa"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.373421435965604, 126.51971115454302), // 지도의 중심좌표
		        level: 9, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 마커 생성 표시
		var marker = new kakao.maps.Marker({
			position:new kakao.maps.LatLng(33.50578048522039, 126.49567856271265),
			map:map
			});
		var iwContent = '<div style="padding:5px;">1일차 <br><a href="https://map.kakao.com/,33.450701,126.570667" style="color:blue" target="_blank">내용</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(33.50578048522039, 126.49567856271265); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
	
	//============================
	// 마커 생성 표시
	var marker2 = new kakao.maps.Marker({
		position:new kakao.maps.LatLng(33.36195228389686, 126.39817490456976),
		map:map
		});
	var iwContent2 = '<div style="padding:5px;">2일차 <br><a href="https://map.kakao.com/,33.450701,126.570667" style="color:blue" target="_blank">내용</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition2 = new kakao.maps.LatLng(33.36195228389686, 126.39817490456976); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow2 = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent2 
});
//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow2.open(map, marker2); 
    
//============================
// 마커 생성 표시
var marker3 = new kakao.maps.Marker({
	position:new kakao.maps.LatLng(33.30687931382514, 126.61378158531329),
	map:map
	});
var iwContent3 = '<div style="padding:5px;">3일차 <br><a href="https://map.kakao.com/,33.450701,126.570667" style="color:blue" target="_blank">내용</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition3 = new kakao.maps.LatLng(33.30687931382514, 126.61378158531329); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow3 = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent3 
});
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow3.open(map, marker3); 



		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도에 선을 표시한다 
		var polyline = new kakao.maps.Polyline({
			map: map, // 선을 표시할 지도 객체 
			path: [ // 선을 구성하는 좌표 배열
				new kakao.maps.LatLng(33.50578048522039, 126.49567856271265),
				new kakao.maps.LatLng(33.36195228389686, 126.39817490456976),
				new kakao.maps.LatLng(33.30687931382514, 126.61378158531329)
			],
			strokeWeight: 3, // 선의 두께
			strokeColor: '#FF0000', // 선 색
			strokeOpacity: 0.9, // 선 투명도
			strokeStyle: 'solid' // 선 스타일
		});	

		// 도형에 mouseover 이벤트를 등록한다 
		kakao.maps.event.addListener(polyline, 'mouseover', function() {
			console.log('도형에 mouseover 이벤트가 발생했습니다!');
		});

		// 도형에 mouseout 이벤트를 등록한다 
		kakao.maps.event.addListener(polyline, 'mouseout', function() {
			console.log('도형에 mouseout 이벤트가 발생했습니다!');
		});

		// 도형에 mousedown 이벤트를 등록한다
		kakao.maps.event.addListener(polyline, 'mousedown', function() {
			console.log('도형에 mousedown 이벤트가 발생했습니다!');
		});
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		
		



	</script>
</body>
</html>
 