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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>



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
 div.card {
      margin:5px;
      width:300px;
     height:200px;
     backgroundColor="white";
      box-sizing: border-box;
      }
      
      <!-- 목록-->
      .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:80px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>

<body>

	<div class="fheader">
		<%@ include file="/WEB-INF/view/userpage/header.jsp"%>
	</div>
	<div class="r">
		<div class="left">

			<!-- 아래는 본인들의 내용 작성하기 -->

			<div id="mapwrap">
				<!-- 지도가 표시될 div -->
				<div id="map" style="width:98%;height:100%;position:relative;overflow:hidden;"></div>
				<div id="menu_wrap" class="bg_white">
		<div class="option">
            <div>           
                   <h1>찜 목록</h1>  &nbsp
            </div>
        </div>
		<c:forEach var="mylist" items="${mylist}" varStatus="status"> 
		
        <ul id="placesList">   
                 <div> <h6> ${mylist.HOME_NAME}</h6></div>
	                <div>  <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="70" height="70"></div>
					<div>	${mylist.HOME_ADDRESS} </div>	
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        	    <button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>
	         		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn  btn-dark" onclick="add(this.id,6)" title="6일차 일정추가">6일차</button>		        
        </ul>
        <div id="pagination"></div>
       </c:forEach>
    </div>
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

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 		
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker,infowindow );
    };
}
//일정 추가 버튼 메서드
function add(id,n) {
		var id = id.split(',');
	document.getElementById("p_place"+n).value = id[0];
	document.getElementById("p_y"+n).value = id[1];
	document.getElementById("p_x"+n).value = id[2];
	
}
	</script>
		</div>
<div class="right">
<br>
<div class="container mt-3">
<input type="text" name="subject" id="subject" value="${subject }" size="45"><br>
 <input type="text" name="date" id="date" value="${date }" size="8">
<input type="text" name="day"  id="day" value="${day }일" size="2">
<input type="text" name="with"  id="with" value="${with }"size="3">
<input type="text" name="travel"  id="travel" value="${travel }"size="45">
</div>
<br><br>
 <c:forEach var="dayCnt" begin="1" end="${day}" step="1">
 
 <button type="button" class="btn btn-success" name="day_btn${dayCnt}" id="day_btn${dayCnt}" data-toggle="collapse" data-target="#col${dayCnt}">  ${ dayCnt}일차  </button>

<div id="col${dayCnt}" class="collapse in">
<br/>
 <form name="sccedule_card${dayCnt}" action="" method="post">
  <div class="form-group">
  <label for="exampleFormControlText1">장소</label>
  <input class="form-control form-control-lg" type="text" name="p_place${ dayCnt}" id="p_place${ dayCnt}" readonly style="background-color:#FFFFF0" placeholder='지도에서 "${ dayCnt}일차" 버튼 누르기'>
  </div>
  <div class="form-group">
  <input class="form-control form-control-lg" type="text" name="p_y${ dayCnt}" id="p_y${ dayCnt}" style="display:none" >
  </div>
  <div class="form-group">
  <input class="form-control form-control-lg" type="text" name="p_x${ dayCnt}" id="p_x${ dayCnt}" style="display:none"   >
  </div>
 <div class="form-group">
  <label for="exampleFormControlText2">시간</label>
  <input class="form-control form-control-lg" type="time" name="p_time${ dayCnt}" id="p_time${ dayCnt}" value="00:00:00">
  </div>
  <div class="form-group">
    <label for="exampleFormControlTextarea3">메모</label>
    <textarea class="form-control" name="p_context${ dayCnt}" id="p_context${ dayCnt}" rows="3"></textarea>
  </div>

  <button type="button" class="btn btn-danger" id="create${dayCnt}" name="create${dayCnt}"   value="create" onclick="create(${dayCnt})" >  일정 넣기 </button> 
  </form>
  
  <form name="day_card${dayCnt}" id="day_card${dayCnt}"  method="post" action="sccedule_card.do">	 
	 <div id="field${dayCnt}"></div><br>
	 <button type="button" class="btn btn-info" id="send_bt" name="send_bt"   onclick="clkBtn(${dayCnt})" style="float: right; width:40%" >  ${dayCnt}일차 저장 </button>
	 <br><br><br><br><br>
   </form>
   </div> 
    </c:forEach>
    <button type="button" class="btn btn-primary" name="reload" id="reload" style="width:40%" onclick="location.href='schedule_table.do'" style="float: right" > 내 일정 보기</button>
    </div>
  <script>
  function clkBtn(num){
	/*  if(document.getElementById("p_place1") && document.getElementById("p_place1").value =="" ){
	  		alert("1일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place2") && document.getElementById("p_place2").value ==""   ){
	  		alert("2일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place3") && document.getElementById("p_place3").value =="" ){
	  		alert("3일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place4") && document.getElementById("p_place4").value ==""){
	  		alert("4일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place5") && document.getElementById("p_place5").value ==""){
	  		alert("5일차 장소를 선택하세요. ");
	  		return false;
	  	}if(document.getElementById("p_place6") && document.getElementById("p_place6").value ==""){
	  		alert("6일차 장소를 선택하세요. ");
	  		return false;
	  	}*/
	  	 if(document.getElementById("c_place1")){
	  		 var form = $('#day_card'+num)[0];  
	  		  var data = new FormData(form);	  
	  		  $.ajax({
	  			 type:"POST",
	  			 url:'sccedule_card.do',
	  			 data : data,
	  			 processData: false,
	  			contentType: false,
	  			cache: false,  			
	  		  });
	  		 alert(num+"일차 저장 되었습니다.");
	  	}else if(document.getElementById("c_place2")){
	  		 var form = $('#day_card'+num)[0];  
	  		  var data = new FormData(form);	  
	  		  $.ajax({
	  			 type:"POST",
	  			 url:'sccedule_card.do',
	  			 data : data,
	  			 processData: false,
	  			contentType: false,
	  			cache: false,  			
	  		  });
	  		 alert(num+"일차 저장 되었습니다.");
	  	}else if(document.getElementById("c_place3")){
	  		 var form = $('#day_card'+num)[0];  
	  		  var data = new FormData(form);	  
	  		  $.ajax({
	  			 type:"POST",
	  			 url:'sccedule_card.do',
	  			 data : data,
	  			 processData: false,
	  			contentType: false,
	  			cache: false,  			
	  		  });
	  		 alert(num+"일차 저장 되었습니다.");
	  	}else if(document.getElementById("c_place4")){
	  		 var form = $('#day_card'+num)[0];  
	  		  var data = new FormData(form);	  
	  		  $.ajax({
	  			 type:"POST",
	  			 url:'sccedule_card.do',
	  			 data : data,
	  			 processData: false,
	  			contentType: false,
	  			cache: false,  			
	  		  });
	  		 alert(num+"일차 저장 되었습니다.");
	  	}else if(document.getElementById("c_place5")){
	  		 var form = $('#day_card'+num)[0];  
	  		  var data = new FormData(form);	  
	  		  $.ajax({
	  			 type:"POST",
	  			 url:'sccedule_card.do',
	  			 data : data,
	  			 processData: false,
	  			contentType: false,
	  			cache: false,  			
	  		  });
	  		 alert(num+"일차 저장 되었습니다.");
	  	}else if(document.getElementById("c_place6")){
	  		 var form = $('#day_card'+num)[0];  
	  		  var data = new FormData(form);	  
	  		  $.ajax({
	  			 type:"POST",
	  			 url:'sccedule_card.do',
	  			 data : data,
	  			 processData: false,
	  			contentType: false,
	  			cache: false,  			
	  		  });
	  		 alert(num+"일차 저장 되었습니다.");
	  		 }
  }
 
  </script>


<script type='text/javascript'>  
    function create(num) {  	
    	if(num == 1){    		 		
        	var c_place = document.sccedule_card1.p_place1.value;
        	var c_context = document.sccedule_card1.p_context1.value; 
        	var c_time = document.sccedule_card1.p_time1.value;
        	var c_y = document.sccedule_card1.p_y1.value;
    		var c_x = document.sccedule_card1.p_x1.value;}
    	if(num == 2){		
        	var c_place = document.sccedule_card2.p_place2.value;
        	var c_context = document.sccedule_card2.p_context2.value;
        	var c_time = document.sccedule_card2.p_time2.value;
        	var c_y = document.sccedule_card2.p_y2.value;
    		var c_x = document.sccedule_card2.p_x2.value;}
    	if(num == 3){     		
        	var c_place = document.sccedule_card3.p_place3.value;
        	var c_context = document.sccedule_card3.p_context3.value;    	
        	var c_time = document.sccedule_card3.p_time3.value;
        	var c_y = document.sccedule_card3.p_y3.value;
    		var c_x = document.sccedule_card3.p_x3.value;}
    	if(num == 4){		
        	var c_place = document.sccedule_card4.p_place4.value;
        	var c_context = document.sccedule_card4.p_context4.value;
        	var c_time = document.sccedule_card4.p_time4.value;
        	var c_y = document.sccedule_card4.p_y4.value;
    		var c_x = document.sccedule_card4.p_x4.value;}
    	if(num == 5){ 		
        	var c_place = document.sccedule_card5.p_place5.value;
        	var c_context = document.sccedule_card5.p_context5.value;	
        	var c_time = document.sccedule_card5.p_time5.value;
        	var c_y = document.sccedule_card5.p_y5.value;
    		var c_x = document.sccedule_card5.p_x5.value;}
    	if(num == 6){    		
        	var c_place = document.sccedule_card6.p_place6.value;
        	var c_context = document.sccedule_card6.p_context6.value;
        	var c_time = document.sccedule_card6.p_time6.value;
        	var c_y = document.sccedule_card6.p_y6.value;
    		var c_x = document.sccedule_card6.p_x6.value;}
    	if(num == 7){   		
        	var c_place = document.sccedule_card7.p_place7.value;
        	var c_context = document.sccedule_card7.p_context7.value;	
        	var c_time = document.sccedule_card7.p_time7.value;
        	var c_y = document.sccedule_card7.p_y7.value;
    		var c_x = document.sccedule_card7.p_x7.value;}
	
        var addDiv = document.createElement('div');
        
        addDiv.innerHTML =  '<div id="card'+num+'" name="card'+num+'" class="card">'+
        ' <textarea class="form-control" name="c_place'+num+'" id="c_place'+num+'" rows="1">'+c_place+'</textarea>'+
        ' <textarea class="form-control" name="c_time'+num+'" id="c_time'+num+'" rows="1">'+c_time+'</textarea>'+
        ' <textarea class="form-control" name="c_y'+num+'" id="c_y'+num+'" rows="1"style="display:none">'+c_y+'</textarea>'+
        ' <textarea class="form-control" name="c_x'+num+'" id="c_x'+num+'" rows="1" style="display:none">'+c_x+'</textarea>'+
        ' <textarea class="form-control" name="c_context'+num+'" id="c_context'+num+'" rows="6">'+c_context+'</textarea></div>'+
        '<input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div(this,'+num+')" />';   
        
        document.getElementById('field'+num).appendChild(addDiv);
        
   } 
    function remove_div(obj,num){
    	
    	document.getElementById('field'+num).removeChild(obj.parentNode);
    	}
    
</script>

</div>		

</body>
</html>
