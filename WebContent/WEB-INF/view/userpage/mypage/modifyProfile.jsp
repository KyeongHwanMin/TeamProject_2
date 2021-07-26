<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Jeju Guseok Guseok</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap4/bootstrap.min.css">
<link href="/jejuguseok/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/jejuguseok/styles/responsive.css">
<!-- 추가 css --> <link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap.min.css">


 <!-- JS, Popper.js, and jQuery 년도 부트스트랩 추가 -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
    integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
    crossorigin="anonymous"></script>
</head>

 
<!-- 회원 가입 폼! -->

<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        
        
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.pw.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.pw.value != userinput.pwc.value)
        {
            alert("비밀번호를 동일하게 입력하세요");
            return false;
        }
       
        if(!userinput.name.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
      
    }

    // 아이디 중복 여부를 판단
    function openConfirmid(userinput) {
        // 아이디를 입력했는지 검사
        if (userinput.id.value == "") {
            alert("아이디를 입력하세요");
            return;
        }
        // url과 사용자 입력 id를 조합
        url = "/jejuguseok/confirmId.do?user_id="+userinput.id.value ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
    
 

    // 년도 select 
    $(document).ready(function () {
        setDateBox();
      });

      // select box 연도 
      function setDateBox() {
        var dt = new Date();
        var year_birth = "";
        var com_year = dt.getFullYear();

        // 발행 뿌려주기
        //$("#year_birth").append("<option value=''>년도</option>");
        $("#year_birth").append("<option value='${dto.year_birth}'>${dto.year_birth} </option>");
        
        // 올해 기준으로 -50년부터 +1년을 보여준다.
        for (var y = (com_year - 80); y <= (com_year + 1); y++) {
          $("#year_birth").append("<option value='" + y + "'>" + y + " 년" + "</option>");
        }
      }
    
</script>

<body>

<!-- Header -->
<%@ include file ="../header.jsp" %>



<!-- 회원 정보 수정  -->


<div align="center">
<div style=" width:40%;" >
		
		<br /> <br />  
		
	 <br /> <br /> <br /> <br /> <br /> <br /> <h2> 정보 수정  </h2>

<form  name="userinput"  action="modifyProfilePro.do" onSubmit="return checkIt()">
 <fieldset> 
    
     <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">이름</label>
      <input type="text" name="name" class="form-control" id="name" value="${dto.name}">
    </div>
    
    <!-- 아이디는 수정 불가 -->
    <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">아이디</label>
      <input type="text" name="user_id" class="form-control" id="id" value="${user_id}" readonly="readonly"/> 
    </div>
    
    <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">비밀번호 </label>
      <input type="password" name="pw" class="form-control" id="exampleInputPassword1" value="${dto.pw}">
    </div>
    
   <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">비밀번호 확인</label>
      <input type="password" name="pwc" class="form-control" id="exampleInputPassword1" value="${dto.pw}">
    </div>
    
    
    
    <div class="form-group">
      <label for="exampleInputEmail1" class="form-label mt-4">이메일</label>
      <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="${dto.email}">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
 
    <div class="form-group">
      <label for="exampleSelect1" class="form-label mt-4">태어난 년도</label>
      <select name="year_birth" id="year_birth" title="년도" class="custom-select" > </select>
    </div>

    
    
      <fieldset class="form-group">
      <legend class="mt-4"> 성별 </legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" id="male" value="male" checked="">
          남성
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="gender" id="female" value="female">
          여성
        </label>
      </div>
    </fieldset>
    
    <div class="form-group">
      <label for="exampleSelect1" class="form-label mt-4">거주 지역</label>
      <select class="form-select" name="address" id="exampleSelect1">
        <option>${dto.address}</option><option>서울</option><option>경기</option>
        <option>인천</option><option>광주</option><option>전라</option><option>강원</option>
        <option>대전</option><option>충청/세종</option>
        <option>경상</option> <option>대구</option> <option>부산</option><option>제주</option>
        <option>해외</option>
      </select>
    </div>
    
   
     <input type="submit" class="btn btn-primary" value="등록" />
    
  </fieldset>
</form> <br /> <br /> 	
	

	</div>
</div>






<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/custom.js"></script>

</body>

</html>

