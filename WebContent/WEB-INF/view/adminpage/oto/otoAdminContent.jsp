<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>


<!--  어드민쪽 헤더 태그(*) -->
<%@ include file="../adminHeader.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Tables</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="adminpage/index.do">Dashboard</a></li>
				<li class="breadcrumb-item active">Tables</li>
			</ol>

			</br> </br> </br> </br> </br>

			<main>
				<html>
<head>
<title>1:1문의</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
	<center>
			<c:if test="${article.re_level > 0}">
			<b>답변내용</b> <br>
			</c:if>
			<c:if test="${article.re_level == 0}">
			<b>문의내용</b> <br>
			</c:if>
		<table class="table-bordered table-white table-hover" width="700">
			<tr height="30">
				<td align="center" width="1000">문의번호</td>
				<td align="center" width="125" align="center">${article.num}<input
					type="hidden" name="otonum" value="${article.num}" /></td>
				<td align="center" width="1000">문의상태</td>
				<td align="center" width="125" align="center"><c:if
						test="${article.readcount >= 0 && article.re_level > 0}">
						<b>문의답변</b>
					</c:if> <c:if test="${article.readcount > 0 && article.re_level == 0}">
						<b>문의확인</b>
					</c:if> <c:if test="${article.readcount == 0 && article.re_level == 0}">
						<b style="color:red;">문의대기</b></td>
				</c:if>
				</td>
			</tr>
			<tr height="30">
				<td align="center" width="1000">작성자</td>
				<td align="center" width="1000" align="center">${article.writer}</td>
				<td align="center" width="1000">작성일</td>
				<td align="center" width="1000" align="center">${article.reg_date}</td>
			</tr>

			<tr height="30">
				<td align="center" width="1000">문의제목</td>
				<td align="center" width="1000" align="center">${article.subject}</td>
				<td align="center" width="1000">휴대폰번호</td>
				<td align="center" width="1000" align="center">${article.ph}</td>
			</tr>
			<tr>
				<td align="center" width="1000">문의내용</td>
				<td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right"><input type="button" value="문의삭제"
					onclick="document.location.href='/jejuguseok/adminpage/deleteForm.do?num=${num}&otonum=${article.otonum}&pageNum=${pageNum}&re_level=${article.re_level}'">
					<input type="button" value="답변쓰기"
					onclick="document.location.href='/jejuguseok/adminpage/write.do?num=${num}&ref=${ref}&re_step=${re_step}&re_level=${re_level}'">
					<input type="button" value="문의목록"
					onclick="document.location.href='/jejuguseok/adminpage/list.do?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
</body>
		</div>
	</main>
</div>
</div>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="/jejuguseok/adminStyle/js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="/jejuguseok/adminStyle/assets/demo/chart-area-demo.js"></script>
<script src="/jejuguseok/adminStyle/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<script src="/jejuguseok/adminStyle/js/datatables-simple-demo.js"></script>
</body>
</html>
</div>
