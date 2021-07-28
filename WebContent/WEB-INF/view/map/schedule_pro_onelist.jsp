<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    </style>
</head>

<body>


<div class="fheader">
<%@ include file="/WEB-INF/view/userpage/header.jsp"%>
</div>
<div class="r">
      <div class="left">
		

		<!-- 아래는 본인들의 내용 작성하기 -->

		<div id="map" style="width:98% ; height: 87vh;"></div>

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
        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.place},${maplist.y},${maplist.x}"  class="btn btn-primary" onclick="add(this.id,1)" title="1일차 일정추가">1일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.place},${maplist.y},${maplist.x}"  class="btn btn-danger" onclick="add(this.id,2)" title="2일차 일정추가">2일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.place},${maplist.y},${maplist.x}"  class="btn btn-success" onclick="add(this.id,3)" title="3일차 일정추가">3일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.place},${maplist.y},${maplist.x}"  class="btn btn-warning" onclick="add(this.id,4)" title="4일차 일정추가">4일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.place},${maplist.y},${maplist.x}"  class="btn btn-info" onclick="add(this.id,5)" title="5일차 일정추가">5일차</button>'+
        ' 				<button type="button" style="width:2% padding:0.5px" id="${maplist.place},${maplist.y},${maplist.x}"  class="btn  btn-dark" onclick="add(this.id,6)" title="6일차 일정추가">6일차</button>&nbsp&nbsp<br>';
	    
	    
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
function add(id,n) {
		var id = id.split(',');
	document.getElementById("p_place"+n).value = id[0];
	document.getElementById("p_y"+n).value = id[1];
	document.getElementById("p_x"+n).value = id[2];
	
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
