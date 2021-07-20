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

		<div id="map" style="width: 1485; height: 87vh;"></div>

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
	
	document.getElementById("p_place").value = id;
	
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 


<div class="container mt-3">
<input type="text" name="title" id="title" placeholder="계획 제목을 입력하세요."  size="45"><br>
 <input type="text" name="date" id="date" value="${date }" size="8">
<input type="text" name="day"  id="day" value="${day }일" size="2">
<input type="text" name="with"  id="with" value="${with }"size="3">
<input type="text" name="travel"  id="travel" value="${travel }"size="45">
 
 
<br><br>
 <c:forEach var="dayCnt" begin="1" end="${day}" step="1" varStatus="status">
 <button type="button" class="btn btn btn-danger" onclick="location.reload()">  ${status.count}일차  </button>
  </c:forEach>

 
 <form name="sccedule_card" action="" method="post">
  <div class="form-group">
  <label for="exampleFormControlText">장소</label>
  <input class="form-control form-control-lg" type="text" name="p_place" id="p_place" readonly style="background-color:#FFFFF0" placeholder="지도에서 일정 추가 버튼 누르기">
  </div>
 
  <div class="form-group">
    <label for="exampleFormControlTextarea1">메모</label>
    <textarea class="form-control" name="p_context" id="p_context" rows="3"></textarea>
  </div>

  <button type="button" class="btn btn-warning"  value="create" onclick="create()" >  일정 넣기 </button> 
  

 

   
  </form>
  <form action="sccedule_card.do" name="sccedule_card2" method="post">
 <div  id="field"></div><br><br>
 <input type="submit" class="btn btn-info" value="저장"   style="float: right;"> 
   </form>
   <h1>테스트</h1>
   <h1>${sessionScope.id}</h1>
 </div>


<script type='text/javascript'>
    //  버튼 클릭시 실행 되는 함수 입니다.
    function create() {
    	var sccedule_card = document.sccedule_card;
    	var c_place = sccedule_card.p_place.value;
    	var c_context = sccedule_card.p_context.value;
    	
        var addDiv = document.createElement('div');
        
        addDiv.innerHTML =  '<div id="card" class="card">'+
        ' <textarea class="form-control" name="c_place" id="c_place" rows="1">'+c_place+'</textarea>'+
        ' <textarea class="form-control" name="c_context" id="c_context" rows="6">'+c_context+'</textarea></div>'+
        '<input type="button" style="width:223pt" value="삭제" class="btn btn-success"  onclick="remove_div(this)" />';   
        
        document.getElementById('field').appendChild(addDiv);
      
   } 
    function remove_div(obj){
    	document.getElementById('field').removeChild(obj.parentNode);
    	}
    
</script>




</div>		
</div>
</body>
</html>
