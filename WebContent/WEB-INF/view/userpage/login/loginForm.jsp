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
<!-- 추가 css --><link rel="stylesheet" type="text/css" href="/jejuguseok/styles/bootstrap.min.css">
</head>

<!-- login폼 페이지 -->

<body>

<!-- Header -->
<%@ include file ="../header.jsp" %>




<!-- login 폼  -->
<br /> <br /> <br /> <br /> <br /> 
<div id="loginForm" align="center">

<br /> <br /> 
<main>              
  <form name="loginForm" action="loginPro.do" class="loginForm" method="post">
  <h1>로그인</h1>
    <hr>
    <br />
	<table>
	<tr>
		<td align='center'width='150'> <b>아이디 </b></td>
       	<td colspan='2'>
       		<input type="text" name="user_id" placeholder="아이디" required style="width:300px; height:50px; font-size:15px;">
       	</td>
	</tr>
	<tr>
		<td align='center' width='150' > <b>비밀번호</b> </td>
		<td colspan='2'> 
			<input type="password" name="pw" placeholder="비밀번호" required style="width:300px; height:50px; font-size:15px;">
		</td>
	</tr>
</table>
	 <br />  
	<input type="submit" value="Login" class="btn btn-danger" style="width:250px; height:60px; font-size:18pt; opacity: 0.9">
			 <br /> <br />
	<input align='center' type="button" value="회원가입" onclick="window.location='/jejuguseok/register.do'"
	   class="btn btn-warning" >
			     
			     <%-- 
			<input type="button" value="아이디 찾기" 
			onclick="window.location='/jejuguseok/findId.do'" class="btn btn-warning"> 
			<input type="button" value="비밀번호 찾기" 
			onclick="window.location='/jejuguseok/findPw.do'" class="btn btn-warning">
				 --%>
 </form>
</main>


</div>


<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="plugins/easing/easing.js"></script>
<script src="js/custom.js"></script>

</body>

</html>

