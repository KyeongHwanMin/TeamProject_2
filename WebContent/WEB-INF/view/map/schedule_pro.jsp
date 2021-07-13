<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container px-5 my-5">
    <form id="contactForm"  action="formPro.do" method="post">>
        <div class="form-floating mb-3">
            <select class="form-select" id="방문일정" aria-label="방문 일정">
                <option value="1박2일">1박2일</option>
                <option value="2박3일">2박3일</option>
                <option value="3박4일">3박4일</option>
                <option value="4박5일">4박5일</option>
                <option value="5박6일">5박6일</option>
                <option value="6박7일">6박7일</option>
            </select>
            <label for="방문일정">방문 일정</label>
        </div>
        <div class="form-floating mb-3">
            <select class="form-select" id="동반유형" aria-label="동반 유형">
                <option value="혼자">혼자</option>
                <option value="가족">가족</option>
                <option value="커플">커플</option>
                <option value="2~4명">2~4명</option>
                <option value="5명이상">5명이상</option>
            </select>
            <label for="동반유형">동반 유형</label>
        </div>
        <div class="d-none" id="submitSuccessMessage">
            <div class="text-center mb-3">
                <div class="fw-bolder">Form submission successful!</div>
                <p>To activate this form, sign up at</p>
                <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
            </div>
        </div>
        <div class="d-none" id="submitErrorMessage">
            <div class="text-center text-danger mb-3">Error sending message!</div>
        </div>
        <div class="d-grid">
            <button class="btn btn-primary btn-lg disabled" id="submitButton" type="submit">일정만들기</button>
        </div>
    </form>
</div>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>