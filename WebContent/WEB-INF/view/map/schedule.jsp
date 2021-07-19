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

    <legend>일정 조회</legend>

  <input type='date' name='userBirthday'/>
  <fieldset class="form-group">
      <legend class="mt-4">예상일정</legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="1박2일" checked="">
          1박2일
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="2박3일">
          2박3일
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="3박4일">
           3박4일
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="4박5일">
          4박5일
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="5박6일">
          5박6일
        </label>
      </div>
       <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="6박7일">
          6박7일
        </label>
      </div>
      
    </fieldset>
    <fieldset class="form-group">
      <legend class="mt-4">동반유형</legend>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios2" id="optionsRadios2" value="혼자" checked="">
          혼자
        </label>
      </div>
      <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios2" id="optionsRadios2" value="커플">
          커플
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios2" id="optionsRadios2" value="가족">
          가족
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios2" id="optionsRadios2" value="2~4명">
          2~4명
        </label>
      </div>
        <div class="form-check">
        <label class="form-check-label">
          <input type="radio" class="form-check-input" name="optionsRadios2" id="optionsRadios2" value="5명 이상">
          5명 이상
        </label>
      </div>
      
    </fieldset>
    <fieldset class="form-group">
      <legend class="mt-4">여행목적</legend>
      <div class="form-check">
                <input class="form-check-input" id="역사문화" type="checkbox" name="travel" value="역사/문화" />
                <label class="form-check-label" for="역사문화">역사/문화</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" id="자연경치" type="checkbox" name="travel" value="자연/경치" />
                <label class="form-check-label" for="자연경치">자연/경치</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" id="레처체험학습" type="checkbox" name="travel" value="레처/체험/학습" />
                <label class="form-check-label" for="레처체험학습">레처/체험/학습</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" id="휴식힐링" type="checkbox" name="travel" value="휴식/힐링" />
                <label class="form-check-label" for="휴식힐링">휴식/힐링</label>
            </div>
      
      
      
    </fieldset>
 

    <fieldset class="form-group">    
    <input type="submit" value="일정 만들기">
     
  </fieldset>
</form>

</body>
</html>