<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body >
    <form action="schedule_pro.do" method="post" id="contactForm"  >
  <fieldset>
    <legend>일정 조회</legend>

  <input type='date' name='userBirthday'/>
  <fieldset class="form-group">
      <legend class="mt-4">예상일정</legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
          1박2일
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
          2박3일
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
           3박4일
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
          4박5일
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
          5박6일
        </label>
      </div>
       <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
          6박7일
        </label>
      </div>
      
    </fieldset>
    <fieldset class="form-group">
      <legend class="mt-4">동반유형</legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
          혼자
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
          커플
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
          가족
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
          2~4명
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2">
          5명 이상
        </label>
      </div>
      
    </fieldset>
    <fieldset class="form-group">
      <legend class="mt-4">여행목적</legend>
      <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">
         역사/문화
        </label>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
        <label class="form-check-label" for="flexCheckChecked">
          자연/경치
        </label>
      </div>
      <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
        <label class="form-check-label" for="flexCheckChecked">
          레처/체험/학습
        </label>
        <div class="form-check">
         <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" >
        <label class="form-check-label" for="flexCheckChecked">
        휴식/힐링
        </label>
      
      </div>
      
      
    </fieldset>
    
    <fieldset class="form-group">    
    <button type="submit" class="btn btn-primary">일정 만들기</button>
  </fieldset>
</form>

</body>
</html>