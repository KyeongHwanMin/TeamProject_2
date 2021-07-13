<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Blog</title>
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

	<!-- 아래는 본인들의 내용 작성하기 -->

	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/blog_background.jpg"></div>
		<div class="home_content">
			<div class="home_title"> ${user_id}님의 </div>
			 <div class="home_title"> 제주도 여행 </div>
		</div>
	</div>

	<!-- 나의 여행 : 프로필 관리 , 유저가 저장해 놓은 제주도 루트.장소 를 볼 수 있음  -->

	<div class="blog">
		<div class="container">
			<div class="row">

				<!-- Blog Content -->

				<div class="col-lg-8">
					
					<div class="blog_post_container">

						<!-- Blog Post -->
						
						<div class="blog_post">
							<div class="blog_post_image">
								<img src="images/blog_1.jpg" alt="https://unsplash.com/@anniespratt">
								
							</div>
							<div class="blog_post_meta">
								<ul>
									<li class="blog_post_meta_item"><a href="modifyProfile.do"> 나의 정보 수정 </a></li>
									
								</ul>
							</div>
							<div class="blog_post_title"><a href="#">지금 나의 제주도 여행 일정을 만드세요! </a></div>
							<div class="blog_post_text">
								<p>가고 싶은 장소와 루트를 한꺼번에 정리하실 수 있습니다. </p>
							</div>
							
						</div>

						

					</div>
						
					
				</div>

				<!-- Blog Sidebar -->

				<div class="col-lg-4 sidebar_col">

			
					
					<!-- 북마크  -->
					<div class="sidebar_archives">
						<div class="sidebar_title">내가 찜한 장소 </div>
						<div class="sidebar_list">
							<ul>
								<li><a href="#">관광지</a></li>
								<li><a href="#">숙소</a></li>
								
							</ul>
						</div>
					</div>
					
					<!-- 나의 여행 일정-->
					<div class="sidebar_categories">
						<div class="sidebar_title"> 나의 여행 일정 리스트  </div>
						<div class="sidebar_list">
							<ul>
								<li><a href="#">list1</a></li>
								<li><a href="#">여행 만들기때 이름을 지정해야00</a></li>
								
								<c:if test="${count == 0}">
								   <li><a href="#">나의 일정이 없습니다</a></li>
								</c:if>
								<c:if test="${count > 0}">
								   <li><a href="#">여행 만들기때 이름을 지정해야~ </a></li>
								</c:if>
							</ul>
						</div>
					</div>


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