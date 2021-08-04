<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html lang="en">
<head>
<title>나의 여행 </title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/blog_styles.css">
<link rel="stylesheet" type="text/css" href="styles/blog_responsive.css">
</head>

<body>

<div class="super_container">

<%@ include file ="../header.jsp" %>

	<!-- 본문 : 마이페이지 - 내 정보보기/ 수정 / 내가 찜한 장소 / 나으 여행 리스트  / -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/blog_background.jpg"></div>
		
		
		<div class="home_content">
			<div class="home_title"> ${dto.name}님의 </div>
			 <div class="home_title"> 제주도 여행 </div>
		</div>
	</div>

	<div class="blog">
		<div class="container">
			<div class="row">

				<!-- Blog Content -->

				<div class="col-lg-8">
					
					<div class="blog_post_container">

						<!-- Blog Post -->
						
						<div class="blog_post">
						
						<!-- -->
							<div class="blog_post_image">
								<img src="images/blog_1.jpg"  alt="https://unsplash.com/@anniespratt">
							</div> 
							<div class="blog_post_meta">
								<ul>
									<li class="blog_post_meta_item"><a href="modifyProfile.do"> 나의 정보 수정 </a></li>
									
								</ul>
							</div>
							<div class="blog_post_title"><a href="map.do">지금 나의 제주도 여행 일정을 만드세요! </a></div>
							<div class="blog_post_text">
								
								<p>이름:  ${dto.name}</p>
								<p> 아이디 :  ${user_id} </p>
								<p>출생년도:  ${dto.year_birth}</p>
								<p>거주지:  ${dto.address}</p>
								<p>이메일:  ${dto.email}  </p>
								<p>가입날짜:  ${dto.signupdate}  </p>
							</div>
						</div>
					</div>
				</div>

				<!-- Blog Sidebar -->

				<div class="col-lg-4 sidebar_col">


					
	<!--  내가 찜한 장소!! 예) 관광지 클릭시 내가 저장한 관광지 목록을 볼 수 잇다.     -->
	
					<div class="sidebar_archives">
						<div class="sidebar_title">내가 찜한 장소 </div>
						<div class="sidebar_list">
							<ul>
								<li><a href="myAtt.do">관광지</a></li>
								<li><a href="myAccom.do">숙소</a></li>
								
							</ul>
						</div>
					</div>
					
					
					
	<!--    나의 여행 일정  --!!!    -->
					<div class="sidebar_categories">
						<div class="sidebar_title"><a href="schedule_table.do">  나의 여행 일정 리스트 </a> 개</div>
						<div class="sidebar_list">
							
						</div>
					</div>  <!-- sidebar_categories 끝 -->




			</div>
		</div>
	</div>
</div>

	


</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="styles/bootstrap4/popper.js"></script>
<script src="styles/bootstrap4/bootstrap.min.js"></script>
<script src="plugins/colorbox/jquery.colorbox-min.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/blog_custom.js"></script>

</body>

</html>