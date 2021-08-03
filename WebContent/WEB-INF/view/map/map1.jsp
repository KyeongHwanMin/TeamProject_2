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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap4/bootstrap.min.css">
<link href="/jejuguseok/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/responsive.css">
<!-- 추가 css --> <link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap.min.css">

<style>
div.fheader {
	width: 100%;
	height: 13%;
	display: flex;
	box-sizing: border-box;
}

div.r {
	width: 100%;
	height: 87%;
	display: flex;
}

div.left {
	width: 70%;
	height: 100%;
	float: left;
	box-sizing: border-box;
	background: #ece6cc;
}

div.right {
	width: 30%;
	height: 100%;
	float: right;
	box-sizing: border-box;
	background: #ece6cc;
	overflow: auto;
}

#mapwrap {
	position: relative;
	overflow: hidden;
}

.category, .category * {
	margin: 0;
	padding: 0;
	color: #000;
}

.category {
	position: absolute;
	overflow: hidden;
	top: 20px;
	left: 10px;
	width: 150px;
	height: 50px;
	z-index: 10;
	border: 1px solid black;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
	font-size: 12px;
	text-align: center;
	background-color: #fff;
}

.category .menu_selected {
	background: #FF5F4A;
	color: #fff;
	border-left: 1px solid #915B2F;
	border-right: 1px solid #915B2F;
	margin: 0 -1px;
}

.category li {
	list-style: none;
	float: left;
	width: 50px;
	height: 45px;
	padding-top: 5px;
	cursor: pointer;
}

.category .ico_comm {
	display: block;
	margin: 0 auto 2px;
	width: 22px;
	height: 26px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png')
		no-repeat;
}

.category .ico_total {
	background-position: -10px 0;
}

.category .ico_tour {
	background-position: -10px -36px;
}

.category .ico_home {
	background-position: -10px -72px;
}
</style>
</head>

<body>

	


			<!-- 아래는 본인들의 내용 작성하기 -->

			<div id="mapwrap">
				<!-- 지도가 표시될 div -->
				<div id="map" style="width: 98%; height: 100%;"></div>
				<!-- 지도 위에 표시될 마커 카테고리 -->
				<div class="category">
					<ul>
						<li id="totalMenu" onclick="changeMarker('total')"><span
							class="ico_comm ico_total"></span> 전체</li>
						<li id="tourMenu" onclick="changeMarker('tour')"><span
							class="ico_comm ico_tour"></span> 관광지</li>
						<li id="homeMenu" onclick="changeMarker('home')"><span
							class="ico_comm ico_home"></span> 숙박</li>
					</ul>
				</div>
			</div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a95cadba8f57feb150276e9f4194f8aa"></script>
			<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
	 center: new kakao.maps.LatLng(33.403421435965604, 126.51971115454302), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨 
        
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();

// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMRIGHT);



// 전체 위치 마커가 표시될 좌표 배열입니다
var totalPositions=new Array();
var iwContent = new Array();
<c:forEach var="maplist" items="${maplist}" varStatus="status">
var totalPositions2 = [   
    new kakao.maps.LatLng(${maplist.y}, ${maplist.x})      
];
   
totalPositions = totalPositions.concat(totalPositions2);



</c:forEach>
//===================================================================
//console.log('totalPositions'+totalPositions);
//console.log('iwContent'+iwContent[500]);
//관광지 위치 마커가 표시될 좌표 배열입니다
var tourPositions=new Array();
<c:forEach var="maptourlist" items="${maptourlist}" varStatus="status">
var tourPositions2 = [   
    new kakao.maps.LatLng(${maptourlist.y}, ${maptourlist.x})                
];
 
    tourPositions = tourPositions.concat(tourPositions2);
</c:forEach>

//숙소 위치 마커가 표시될 좌표 배열입니다
var homePositions=new Array();
<c:forEach var="maphomelist" items="${maphomelist}" varStatus="status">
var homePositions2 = [   
    new kakao.maps.LatLng(${maphomelist.y}, ${maphomelist.x})                
];

homePositions = homePositions.concat(homePositions2);
</c:forEach>




var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
    totalMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
    tourMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
    homeMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

    
createtotalMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
createtourMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
createhomeMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

changeMarker('total'); // 지도에 커피숍 마커가 보이도록 설정합니다    


// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
function createMarkerImage(src, size, options) {
    var markerImage = new kakao.maps.MarkerImage(src, size, options);
    return markerImage;            
}

// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
function createMarker(position, image) {
    var marker = new kakao.maps.Marker({
        position: position,
        image: image,       
    });
    
    return marker;  
}   
   
// total 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
function createtotalMarkers() {
	<c:forEach var="maplist" items="${maplist}" varStatus="status">
	 iwContent[${status.index}] = 
		  '          <div> &nbsp ${maplist.name}</div>' + 
	        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
			'				<div>&nbsp	${maplist.address} </div>' +		
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.name},${maplist.y},${maplist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.name},${maplist.y},${maplist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.name},${maplist.y},${maplist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.name},${maplist.y},${maplist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.name},${maplist.y},${maplist.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.name},${maplist.y},${maplist.x}"  class="btn  btn-dark" onclick="add(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		    
	     </c:forEach>	 
    for (var i = 0; i < totalPositions.length; i++) {  
    	//console.log('마커출력'+i);
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {  
                spriteOrigin: new kakao.maps.Point(10, 0),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };     
       
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(totalPositions[i], markerImage, iwContent[i] );  
        //console.log('마커 위치'+totalPositions[i]);
        // 생성된 마커를 커피숍 마커 배열에 추가합니다
        //console.log('iwContent'+iwContent[10]);
        totalMarkers.push(marker);
        //console.log('토탈마커'+"data: " + JSON.stringify(totalMarkers[1]));
        
       //===================================================================
       
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
       
    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({    	
    	content : iwContent[i],
        removable : iwRemoveable
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));      
    }  //for       
}//createmarker()

// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
function settotalMarkers(map) {        
    for (var i = 0; i < totalMarkers.length; i++) {  
        totalMarkers[i].setMap(map);
    }        
}

// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
function createtourMarkers() {
	<c:forEach var="maptourlist" items="${maptourlist}" varStatus="status">
	 iwContent[${status.index}] = 
		  '          <div> &nbsp ${maptourlist.name}</div>' + 
	        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
			'				<div>&nbsp	${maptourlist.address} </div>' +		
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maptourlist.name},${maptourlist.y},${maptourlist.x}"  class="btn  btn-dark" onclick="add(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		    
	     </c:forEach>	 
    for (var i = 0; i < tourPositions.length; i++) {
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new kakao.maps.Point(10, 36),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };       
     
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(tourPositions[i], markerImage,iwContent[i]);  

        // 생성된 마커를 편의점 마커 배열에 추가합니다
        tourMarkers.push(marker);   
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
        
        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({    	
        	content : iwContent[i],
            removable : iwRemoveable
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));      
        
    }        
}

// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
function settourMarkers(map) {        
    for (var i = 0; i < tourMarkers.length; i++) {  
        tourMarkers[i].setMap(map);
    }        
}

// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
function createhomeMarkers() {
	<c:forEach var="maphomelist" items="${maphomelist}" varStatus="status">
	 iwContent[${status.index}] = 
		  '          <div> &nbsp ${maphomelist.name}</div>' + 
	        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
			'				<div>&nbsp	${maphomelist.address} </div>' +		
	        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>'+
	        ' 				<button type="button" style="width:2% padding:0.5px" id="${maphomelist.name},${maphomelist.y},${maphomelist.x}"  class="btn  btn-dark" onclick="add(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		    
	     </c:forEach>	 
    for (var i = 0; i < homePositions.length; i++) {
        
        var imageSize = new kakao.maps.Size(22, 26),
            imageOptions = {   
                spriteOrigin: new kakao.maps.Point(10, 72),    
                spriteSize: new kakao.maps.Size(36, 98)  
            };       
     
        // 마커이미지와 마커를 생성합니다
        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
            marker = createMarker(homePositions[i], markerImage,iwContent[i]);  

        // 생성된 마커를 주차장 마커 배열에 추가합니다
        homeMarkers.push(marker);     
        
iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
        
        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({    	
        	content : iwContent[i],
            removable : iwRemoveable
        });

        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));      
    }                
}

// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
function sethomeMarkers(map) {        
    for (var i = 0; i < homeMarkers.length; i++) {  
        homeMarkers[i].setMap(map);
    }        
}

// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
function changeMarker(type){
    
    var totalMenu = document.getElementById('totalMenu');
    var tourMenu = document.getElementById('tourMenu');
    var homeMenu = document.getElementById('homeMenu');
    
    // 커피숍 카테고리가 클릭됐을 때
    if (type === 'total') {
    
        // 커피숍 카테고리를 선택된 스타일로 변경하고
        totalMenu.className = 'menu_selected';
        
        // 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
        tourMenu.className = '';
        homeMenu.className = '';
        
        // 커피숍 마커들만 지도에 표시하도록 설정합니다
        settotalMarkers(map);
        settourMarkers(null);
        sethomeMarkers(null);
        
        
        
    } else if (type === 'tour') { // 편의점 카테고리가 클릭됐을 때
    
        // 편의점 카테고리를 선택된 스타일로 변경하고
        totalMenu.className = '';
        tourMenu.className = 'menu_selected';
        homeMenu.className = '';
        
        // 편의점 마커들만 지도에 표시하도록 설정합니다
        settotalMarkers(null);
        settourMarkers(map);
        sethomeMarkers(null);
        
    } else if (type === 'home') { // 주차장 카테고리가 클릭됐을 때
     
        // 주차장 카테고리를 선택된 스타일로 변경하고
        totalMenu.className = '';
        tourMenu.className = '';
        homeMenu.className = 'menu_selected';
        
        // 주차장 마커들만 지도에 표시하도록 설정합니다
        settotalMarkers(null);
        settourMarkers(null);
        sethomeMarkers(map);  
    }    
} 
//일정 추가 버튼 메서드
function add(id,n) {
		var id = id.split(',');
	document.getElementById("p_place"+n).value = id[0];
	document.getElementById("p_y"+n).value = id[1];
	document.getElementById("p_x"+n).value = id[2];
	
}
//인포윈도우를 표시하는 클로저를 만드는 함수입니다 		
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker,infowindow );
    };
}
	</script>
	




			


</body>
</html>