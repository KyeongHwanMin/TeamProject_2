<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>CONTACT</title>
<link href="style.css" rel="stylesheet" type="text/css">
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
<link href="../csBoard.css" rel="stylesheet" type="text/css">
</head>
	<div class="super_container">

		<%@ include file="../header.jsp"%>

</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>

<main>
	<body>
		<center>
			<b>문의내용 보기</b> <br>
			<table class="table-bordered" width="700" border="1" cellspacing="0" cellpadding="0"
				align="center">
				<tr height="30">
					<td align="center" width="125">문의번호</td>
					<td align="center" width="125" align="center"><input
						type="hidden" name="otonum" value=${article.num } />${article.num}</td>
					<td align="center" width="125">문의상태</td>
					<td align="center" width="125" align="center">
					<c:if test="${article.readcount > 0 && article.re_level > 0}">
						<b>문의답변</b>
					</c:if> 
					<c:if test="${article.readcount > 0 && article.re_level == 0}">
						<b>문의확인</b>
					</c:if> 
					<c:if test="${article.readcount == 0 && article.re_level == 0}">
						<b style="color:red;">문의대기</b></td>
					</c:if>
					</td>
				</tr>
				<tr height="30">
					<td align="center" width="125">작성자</td>
					<td align="center" width="125" align="center">${article.writer}</td>
					<td align="center" width="125">작성일</td>
					<td align="center" width="125" align="center">${article.reg_date}</td>
				</tr>

				<tr height="30">
					<td align="center" width="1000">문의제목</td>
					<td align="center" width="1000" align="center">${article.subject}</td>
					<td align="center" width="1000">휴대폰번호</td>
					<td align="center" width="1000" align="center">${article.ph}</td>
				</tr>
				<tr>
					<td align="center" width="100">문의내용</td>
					<td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
				</tr>
				<tr height="30">
					<td colspan="4" align="right"><input type="button"
						value="문의수정"
						onclick="document.location.href='/jejuguseok/updateForm.do?num=${article.num}&pageNum=${pageNum}'">
						<input type="button" value="문의삭제"
						onclick="document.location.href='/jejuguseok/deleteForm.do?num=${article.num}&otonum=${article.otonum}&pagenum=${pageNum}&re_level=${article.re_level}'">
						<input type="button" value="문의목록"
						onclick="document.location.href='/jejuguseok/list.do?pageNum=${pageNum}'">
					</td>
				</tr>
			</table>
	</body>
</main>
</div>
</html>
