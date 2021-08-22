<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
	- http://localhost:8080/jejuguseok/schedule_table_content.do
	- 여행 일정 제목을 클릭 했을 시 해당 내용을 지도에 마커로 출력
 --%> 
 <html>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

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
      div.card {
      margin:5px;
      width:300px;
     height:200px;
     backgroundColor="white";
      box-sizing: border-box;
      }
        <!-- 찜 목록-->
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


	<br /><br />
	<c:if test="${user_id == 'admin'}">
	<br /> <br /> 
	</c:if>

<div class="r">
      <div class="left">
		

		<!-- 아래는 본인들의 내용 작성하기 -->

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
					<c:if test="${myscheduledto.getDay1()==1}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		</c:if>
	        		<c:if test="${myscheduledto.getDay1() ==2}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        		</c:if>
	        		<c:if test="${myscheduledto.getDay1() ==3}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        	    <button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>
	        		</c:if>
	        		<c:if test="${myscheduledto.getDay1() ==4}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        	    <button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>
	        		</c:if>
	        		<c:if test="${myscheduledto.getDay1() ==5}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        	    <button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>
	        		</c:if>
	         		<c:if test="${myscheduledto.getDay1() ==6}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        	    <button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist.HOME_NAME},${mylist.y},${mylist.x}"  class="btn  btn-dark" onclick="add(this.id,6)" title="6일차 일정추가">6일차</button>
	        		</c:if>
	        				        
        </ul>
        <div id="pagination"></div>
       </c:forEach>
       <c:forEach var="mylist_t" items="${mylist_t}" varStatus="status"> 		
        <ul id="placesList">   
                 <div> <h6> ${mylist_t.name}</h6></div>
	                <div>  <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="70" height="70"></div>
					<div>	${mylist_t.address} </div>	
					<c:if test="${myscheduledto.getDay1()==1}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		</c:if>
	        		<c:if test="${myscheduledto.getDay1()==2}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        		</c:if>
	        		<c:if test="${myscheduledto.getDay1()==3}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>
	        		</c:if>
	        		<c:if test="${myscheduledto.getDay1()==4}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>
	        		</c:if>
	        		<c:if test="${myscheduledto.getDay1()==5}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>
	        		</c:if>
	        		<c:if test="${myscheduledto.getDay1()==6}">
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>
	        		<button type="button" style="width:30%; padding:2px" id="${mylist_t.name},${mylist_t.y},${mylist_t.x}"  class="btn  btn-dark" onclick="add(this.id,6)" title="6일차 일정추가">6일차</button>
	        		</c:if>
	        	    		        
        </ul>
        <div id="pagination"></div>
       </c:forEach>
    </div>

		<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a95cadba8f57feb150276e9f4194f8aa"></script>
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
		
			
	
		 <c:forEach var="mylist"  items="${place1}" varStatus="status">
		// 마커 생성 표시
		var marker =  new kakao.maps.Marker({
			position:new kakao.maps.LatLng(${y_list1.get(status.index)}, ${x_list1.get(status.index)}),
			map:map
			});
		
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		if(${myscheduledto.getDay1() }==1){  
		var iwContent =
        '          <div> &nbsp ${place1[status.index]}</div>' + 
        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
		'				<div>&nbsp	 </div>' +	
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==2){  
			var iwContent =
		        '          <div> &nbsp ${place1[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==3){  
			var iwContent =
		        '          <div> &nbsp ${place1[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==4){  
			var iwContent =
		        '          <div> &nbsp ${place1[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==5){  
			var iwContent =
		        '          <div> &nbsp ${place1[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==6){  
			var iwContent =
		        '          <div> &nbsp ${place1[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place1[status.index] },${y_list1[status.index]}, ${x_list1[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		}
		
	    
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	     
	    content : iwContent, 
	    removable : iwRemoveable
	});
	kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

	// 일정 추가 버튼 메서드
	function add1(id,n) {		
			var id = id.split(',');
		document.getElementById("p_place"+n).value = id[0];
		document.getElementById("p_y"+n).value = id[1];
		document.getElementById("p_x"+n).value = id[2];				
	}
	</c:forEach>
// 1111111111111111111111111111111111111111111111
<c:forEach var="mylist"  items="${place2}" varStatus="status">
		// 마커 생성 표시
		var marker =  new kakao.maps.Marker({
			position:new kakao.maps.LatLng(${y_list2.get(status.index)}, ${x_list2.get(status.index)}),
			map:map
			});
		
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		 
			if(${myscheduledto.getDay1() }==1){  
		var iwContent =
        '          <div> &nbsp ${place2[status.index]}</div>' + 
        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
		'				<div>&nbsp	 </div>' +	
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>&nbsp&nbsp<br>';
		}else if(${myscheduledto.getDay1() }==2){  
			var iwContent =
		        '          <div> &nbsp ${place2[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==3){  
			var iwContent =
		        '          <div> &nbsp ${place2[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==4){  
			var iwContent =
		        '          <div> &nbsp ${place2[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==5){  
			var iwContent =
		        '          <div> &nbsp ${place2[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==6){  
			var iwContent =
		        '          <div> &nbsp ${place2[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place2[status.index] },${y_list2[status.index]}, ${x_list2[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		}
	    
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	     
	    content : iwContent, 
	    removable : iwRemoveable
	});
	kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

	// 일정 추가 버튼 메서드
	function add1(id,n) {		
			var id = id.split(',');
		document.getElementById("p_place"+n).value = id[0];
		document.getElementById("p_y"+n).value = id[1];
		document.getElementById("p_x"+n).value = id[2];				
	}
	</c:forEach>
	// 22222222222222222222222222222222222222222222222222
	<c:forEach var="mylist"  items="${place3}" varStatus="status">
			// 마커 생성 표시
			var marker =  new kakao.maps.Marker({
				position:new kakao.maps.LatLng(${y_list3.get(status.index)}, ${x_list3.get(status.index)}),
				map:map
				});
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			if(${myscheduledto.getDay1() }==1){  
		var iwContent =
        '          <div> &nbsp ${place3[status.index]}</div>' + 
        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
		'				<div>&nbsp	 </div>' +	
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>&nbsp&nbsp<br>';
		}else if(${myscheduledto.getDay1() }==2){  
			var iwContent =
		        '          <div> &nbsp ${place3[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==3){  
			var iwContent =
		        '          <div> &nbsp ${place3[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==4){  
			var iwContent =
		        '          <div> &nbsp ${place3[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==5){  
			var iwContent =
		        '          <div> &nbsp ${place3[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==6){  
			var iwContent =
		        '          <div> &nbsp ${place3[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place3[status.index] },${y_list3[status.index]}, ${x_list3[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		}
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		     
		    content : iwContent, 
		    removable : iwRemoveable
		});
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

		// 일정 추가 버튼 메서드
		function add1(id,n) {		
				var id = id.split(',');
			document.getElementById("p_place"+n).value = id[0];
			document.getElementById("p_y"+n).value = id[1];
			document.getElementById("p_x"+n).value = id[2];				
		}
		</c:forEach>
//3333333333333333333333333333333333333333333333333
<c:forEach var="mylist"  items="${place4}" varStatus="status">
			// 마커 생성 표시
			var marker =  new kakao.maps.Marker({
				position:new kakao.maps.LatLng(${y_list4.get(status.index)}, ${x_list4.get(status.index)}),
				map:map
				});
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			if(${myscheduledto.getDay1() }==1){  
		var iwContent =
        '          <div> &nbsp ${place4[status.index]}</div>' + 
        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
		'				<div>&nbsp	 </div>' +	
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>&nbsp&nbsp<br>';
		}else if(${myscheduledto.getDay1() }==2){  
			var iwContent =
		        '          <div> &nbsp ${place4[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==3){  
			var iwContent =
		        '          <div> &nbsp ${place4[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==4){  
			var iwContent =
		        '          <div> &nbsp ${place4[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==5){  
			var iwContent =
		        '          <div> &nbsp ${place4[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==6){  
			var iwContent =
		        '          <div> &nbsp ${place4[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place4[status.index] },${y_list4[status.index]}, ${x_list4[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		}
		    
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		     
		    content : iwContent, 
		    removable : iwRemoveable
		});
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

		// 일정 추가 버튼 메서드
		function add1(id,n) {		
				var id = id.split(',');
			document.getElementById("p_place"+n).value = id[0];
			document.getElementById("p_y"+n).value = id[1];
			document.getElementById("p_x"+n).value = id[2];				
		}
		</c:forEach>
//444444444444444444444444444444444444444444444444444
<c:forEach var="mylist"  items="${place5}" varStatus="status">
			// 마커 생성 표시
			var marker =  new kakao.maps.Marker({
				position:new kakao.maps.LatLng(${y_list5.get(status.index)}, ${x_list5.get(status.index)}),
				map:map
				});
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	if(${myscheduledto.getDay1() }==1){  
		var iwContent =
        '          <div> &nbsp ${place5[status.index]}</div>' + 
        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
		'				<div>&nbsp	 </div>' +	
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>&nbsp&nbsp<br>';
		}else if(${myscheduledto.getDay1() }==2){  
			var iwContent =
		        '          <div> &nbsp ${place5[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==3){  
			var iwContent =
		        '          <div> &nbsp ${place5[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==4){  
			var iwContent =
		        '          <div> &nbsp ${place5[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==5){  
			var iwContent =
		        '          <div> &nbsp ${place5[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==6){  
			var iwContent =
		        '          <div> &nbsp ${place5[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place5[status.index] },${y_list5[status.index]}, ${x_list5[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		}
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		     
		    content : iwContent, 
		    removable : iwRemoveable
		});
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

		// 일정 추가 버튼 메서드
		function add1(id,n) {		
				var id = id.split(',');
			document.getElementById("p_place"+n).value = id[0];
			document.getElementById("p_y"+n).value = id[1];
			document.getElementById("p_x"+n).value = id[2];				
		}
		</c:forEach>
//55555555555555555555555555555555555555555555555555
<c:forEach var="mylist"  items="${place6}" varStatus="status">
			// 마커 생성 표시
			var marker =  new kakao.maps.Marker({
				position:new kakao.maps.LatLng(${y_list6.get(status.index)}, ${x_list6.get(status.index)}),
				map:map
				});
			
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	if(${myscheduledto.getDay1() }==1){  
		var iwContent =
        '          <div> &nbsp ${place6[status.index]}</div>' + 
        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
		'				<div>&nbsp	 </div>' +	
        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>&nbsp&nbsp<br>';
		}else if(${myscheduledto.getDay1() }==2){  
			var iwContent =
		        '          <div> &nbsp ${place6[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==3){  
			var iwContent =
		        '          <div> &nbsp ${place6[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==4){  
			var iwContent =
		        '          <div> &nbsp ${place6[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==5){  
			var iwContent =
		        '          <div> &nbsp ${place6[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button><br><br>';
		}else if(${myscheduledto.getDay1() }==6){  
			var iwContent =
		        '          <div> &nbsp ${place6[status.index]}</div>' + 
		        '               <div> &nbsp <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" width="73" height="70"></div>' +
				'				<div>&nbsp	 </div>' +	
		        '         <div>&nbsp <a href="https://www.kakaocorp.com/main" target="_blank" class="link">클릭</a></div> ' + 
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-primary" onclick="add1(this.id,1)" title="1일차 일정추가">1일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn btn-danger" onclick="add1(this.id,2)" title="2일차 일정추가">2일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}" class="btn btn-success" onclick="add1(this.id,3)" title="3일차 일정추가">3일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}" class="btn btn-warning"onclick="add1(this.id,4)" title="4일차 일정추가">4일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"   class="btn btn-info" onclick="add1(this.id,5)" title="5일차 일정추가">5일차</button>'+
		        ' 				<button type="button" style="width:2% padding:0.5px" id="${place6[status.index] },${y_list6[status.index]}, ${x_list6[status.index]}"  class="btn  btn-dark" onclick="add1(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
		}
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		     
		    content : iwContent, 
		    removable : iwRemoveable
		});
		kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));

		// 일정 추가 버튼 메서드
		function add1(id,n) {		
				var id = id.split(',');
			document.getElementById("p_place"+n).value = id[0];
			document.getElementById("p_y"+n).value = id[1];
			document.getElementById("p_x"+n).value = id[2];				
		}
		</c:forEach>
//66666666666666666666666666666666666666666666666666666666666666666666666666666666
// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 		
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
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
<input type="text" name="subject" id="subject" value="${myscheduledto.getSubject()}" size="45"><br>
 <input type="text" name="date" id="date" value="${myscheduledto.getDate1()}" size="8">
<input type="text" name="day"  id="day" value="${myscheduledto.getDay1() }일" size="2">
<input type="text" name="with"  id="with" value="${myscheduledto.getWith1() }"size="3">
<input type="text" name="travel"  id="travel" value="${myscheduledto.getTravel() }"size="45">
</div>
<br><br>
<button type="button" class="btn btn-danger" name="upload" id="upload" style="width:40%" onclick="upload()"> 장소 더 추가하기 </button>
<button type="button" class="btn btn-primary" name="reload" id="reload" style="width:40%" onclick="location.reload();" style="float: right" > 내 일정 보기</button>
<br><br>
 <c:forEach var="dayCnt" begin="1" end="${myscheduledto.getDay1()}" step="1">
 
 <button type="button" class="btn btn-success" name="day_btn${dayCnt}" id="day_btn${dayCnt}" data-toggle="collapse" data-target="#col${dayCnt}">  ${ dayCnt}일차  </button>

<div id="col${dayCnt}" class="collapse in">
<br/>
<button type="button" class="btn btn-dark" name="add_btn${dayCnt}" id="add_btn${dayCnt}" data-toggle="collapse" data-target="#col1${dayCnt}">  ${ dayCnt}일차 추가  </button>
<div id="col1${dayCnt}" class="collapse in">
 <form name="sccedule_card${dayCnt}" action="" method="post">
  <div class="form-group">
  <label for="exampleFormControlText1">장소</label>
  <input class="form-control form-control-lg" type="text" name="p_place${ dayCnt}" id="p_place${ dayCnt}" readonly style="background-color:#FFFFF0" placeholder='지도에서 "${ dayCnt}일차" 버튼 누르기'>
  </div>
  <div class="form-group">
  <input class="form-control form-control-lg" type="text" name="p_y${ dayCnt}" id="p_y${ dayCnt}"style="display:none"  >
  </div>
  <div class="form-group">
  <input class="form-control form-control-lg" type="text" name="p_x${ dayCnt}" id="p_x${ dayCnt}"  style="display:none"  >
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
  </div>
  
  <form name="day_card${dayCnt}" id="day_card${dayCnt}"  method="post" action="sccedule_card.do">	 
	 <div id="field${dayCnt}">
	 <c:if test="${dayCnt == 1}">	 
	 <c:forEach var="myinfo"  items="${place1}" varStatus="status">
	 	<div id="card${dayCnt}_${ status.index}" name="card" class="card"> 	
        <textarea class="form-control" name="c_place1" id="c_place1" rows="1">${place1[status.index] }</textarea>
        <textarea class="form-control" name="c_time1" id="c_time1" rows="1">${time1[status.index] }</textarea>
        <textarea class="form-control" name="c_y1" id="c_y1" rows="1" style="display:none">${ y_list1[status.index] }</textarea>
        <textarea class="form-control" name="c_x1" id="c_x1" rows="1" style="display:none">${ x_list1[status.index] }</textarea>
        <textarea class="form-control" name="c_context1" id="c_context1" rows="6">${context1[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2('${dayCnt}_${ status.index}')" />
        </div>    
        </c:forEach>
        </c:if>
        <c:if test="${dayCnt == 2}">	 
	 <c:forEach var="myinfo"  items="${place2}" varStatus="status">
	 	<div id="card${ status.index}" name="card" class="card"> 	
        <textarea class="form-control" name="c_place2" id="c_place2" rows="1">${place2[status.index] }</textarea>
        <textarea class="form-control" name="c_time2" id="c_time2" rows="1">${time2[status.index] }</textarea>
        <textarea class="form-control" name="c_y2" id="c_y2" rows="1" style="display:none">${ y_list2[status.index] }</textarea>
        <textarea class="form-control" name="c_x2" id="c_x2" rows="1" style="display:none">${ x_list2[status.index] }</textarea>
        <textarea class="form-control" name="c_context2" id="c_context2" rows="6">${context2[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2('${dayCnt}_${ status.index}')" />
        </div>    
        </c:forEach>
        </c:if>
        <c:if test="${dayCnt == 3}">	 
	 <c:forEach var="myinfo"  items="${place2}" varStatus="status">
	 	<div id="card${ status.index}" name="card" class="card"> 	
        <textarea class="form-control" name="c_place3" id="c_place3" rows="1">${place3[status.index] }</textarea>
        <textarea class="form-control" name="c_time3" id="c_time3" rows="1">${time3[status.index] }</textarea>
        <textarea class="form-control" name="c_y3" id="c_y3" rows="1" style="display:none">${ y_list3[status.index] }</textarea>
        <textarea class="form-control" name="c_x3" id="c_x3" rows="1" style="display:none">${ x_list3[status.index] }</textarea>
        <textarea class="form-control" name="c_context3" id="c_context3" rows="6">${context3[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2('${dayCnt}_${ status.index}')" />
        </div>    
        </c:forEach>
        </c:if>
        <c:if test="${dayCnt == 4}">	 
	 <c:forEach var="myinfo"  items="${place2}" varStatus="status">
	 	<div id="card${ status.index}" name="card" class="card"> 	
        <textarea class="form-control" name="c_place4" id="c_place4" rows="1">${place4[status.index] }</textarea>
        <textarea class="form-control" name="c_time4" id="c_time4" rows="1">${time4[status.index] }</textarea>
        <textarea class="form-control" name="c_y4" id="c_y4" rows="1" style="display:none">${ y_list4[status.index] }</textarea>
        <textarea class="form-control" name="c_x4" id="c_x4" rows="1" style="display:none">${ x_list4[status.index] }</textarea>
        <textarea class="form-control" name="c_context4" id="c_context4" rows="6">${context4[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2('${dayCnt}_${ status.index}')" />
        </div>    
        </c:forEach>
        </c:if>
        <c:if test="${dayCnt == 5}">	 
	 <c:forEach var="myinfo"  items="${place5}" varStatus="status">
	 	<div id="card${ status.index}" name="card" class="card"> 	
        <textarea class="form-control" name="c_place5" id="c_place5" rows="1">${place5[status.index] }</textarea>
        <textarea class="form-control" name="c_time5" id="c_time5" rows="1">${time5[status.index] }</textarea>
        <textarea class="form-control" name="c_y5" id="c_y5" rows="1" style="display:none">${ y_list5[status.index] }</textarea>
        <textarea class="form-control" name="c_x5" id="c_x5" rows="1" style="display:none">${ x_list5[status.index] }</textarea>
        <textarea class="form-control" name="c_context5" id="c_context2" rows="6">${context5[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2('${dayCnt}_${ status.index}')" />
        </div>    
        </c:forEach>
        </c:if>
        <c:if test="${dayCnt == 6}">	 
	 <c:forEach var="myinfo"  items="${place6}" varStatus="status">
	 	<div id="card${ status.index}" name="card" class="card"> 	
        <textarea class="form-control" name="c_place6" id="c_place6" rows="1">${place6[status.index] }</textarea>
        <textarea class="form-control" name="c_time6" id="c_time6" rows="1">${time6[status.index] }</textarea>
        <textarea class="form-control" name="c_y6" id="c_y6" rows="1" style="display:none">${ y_list6[status.index] }</textarea>
        <textarea class="form-control" name="c_x6" id="c_x6" rows="1" style="display:none">${ x_list6[status.index] }</textarea>
        <textarea class="form-control" name="c_context6" id="c_context2" rows="6">${context6[status.index] }</textarea>
         <input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div2('${dayCnt}_${ status.index}')" />
        </div>    
        </c:forEach>
        </c:if>
       
	 </div><br>
	 <input type="text" name="subject" id="subject" value="${myscheduledto.getSubject()}" size="45"style="display:none" answp ><br>
	 <button type="button" class="btn btn-info" id="send_bt${dayCnt}" name="send_bt${dayCnt}"   onclick="clkBtn(${dayCnt})" style="float: right; width:40%" >  ${dayCnt}일차 수정 </button>
	 <br><br>
	    </form>
	  </div>	  
	  </c:forEach>
<button type="button" class="btn btn-warning"  style="width:40%" onclick="table()"> 내 여행 일정표 보기 </button>
	

  </div>
   
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script> 
  <script type="text/javascript">
 

  </script>
    
  <script>
  function table(){
	  window.location.href='schedule_table.do';
  }
  function upload(){
	  var day1=${myscheduledto.getDay1() };
		 $(".left").load("map1.do?day="+day1);
	 }
  function clkBtn(num){

	  	 if(document.getElementById("field1")){

	  		 var form = $('#day_card'+num)[0];  
	  		  var data = new FormData(form);	  
	  		  $.ajax({
	  			 type:"POST",
	  			 url:'sccedule_fix.do',
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
    function remove_div2(string){  	
  
    	$('div').remove('#card'+string);
    	//  var de = document.getElementById( 'card'+num );    
    	 // alert('card'+num );
    	//  var parent = de.parentNode;
    	//	parent.removeChild(de);
    	}
    
</script>

</div>		

</body>
</html>
