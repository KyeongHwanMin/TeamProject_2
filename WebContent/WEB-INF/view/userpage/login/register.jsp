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
</head>


<!-- 회원 가입 폼! -->

<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.id.value) {
            alert("ID를 입력하세요");
            return false;
        }
        
        if(!userinput.passwd.value ) {
            alert("비밀번호를 입력하세요");
            return false;
        }
        if(userinput.passwd.value != userinput.passwd2.value)
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
        url = "confirmId.do?id="+userinput.id.value ;
        
        // 새로운 윈도우를 엽니다.
        open(url, "confirm",  "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
    }
</script>

<body>

<!-- Header -->
<%@ include file ="../header.jsp" %>



<!-- 회원 가입 폼! -->

<div align="center">
<div style=" width:40%;" >
		
	 <br /> <br /> <br /> <br /> <br /> <br /> <h2> 회원가입 </h2>

<form  name="userinput"  action="/jejuguseok/registerPro.do" onSubmit="return checkIt()">
 <fieldset> 
    
     <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">이름</label>
      <input type="text" name="name" class="form-control" id="name" placeholder="이름 입력 ">
    </div>
    
         <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">아이디</label>
      <input type="text" name="user_id" class="form-control" id="id" placeholder="아이디 입력"> 
      <input type="button" name="confirm_id" value="ID 중복확인" 
        							OnClick="openConfirmid(this.form)">
    </div>
         <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">비밀번호</label>
      <input type="password" name="pw" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    
    
    <div class="form-group">
      <label for="exampleInputEmail1" class="form-label mt-4">이메일</label>
      <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
 
    <div class="form-group">
      <label for="exampleSelect1" class="form-label mt-4">태어난 년도</label>
      <select class="form-select" name="year_birth" id="exampleSelect1">
        <option>1990</option><option>1991</option>
        <option>1992</option><option>1993</option><option>1994</option><option>1995</option>
        <option>1996</option><option>1997</option><option>1998</option> <option>1999</option>
        <option>2000</option><option>2001</option><option>2002</option><option>2003</option>

      </select>
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
        <option>서울</option><option>경기</option>
        <option>인천</option><option>광주/전라</option><option>강원</option>
        <option>대전/충청/세종</option><option>부산/대구/경상</option>
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

