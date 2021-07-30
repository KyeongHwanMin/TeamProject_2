<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<title>CONTACT</title>
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
</head>
	<div class="super_container">

		<%@ include file="../adminHeader.jsp"%>
		
</br>
</br>
</br>
</br>
</br>
</br>


<input type="hidden" name="otonum" value=${num } />
<center>
	<b>글수정</b> <br>
	
	<form method="post" name="writeform"
		action="/jejuguseok/WEB-INF/view/adminpage/oto/otoUpdatePro.do?pageNum=${pageNum}"
		onsubmit="return writeSave()">
		<table width="400" border="1" cellspacing="0" cellpadding="0"
			align="center">
 			<tr>
   				<td  width="70"  align="center">아 이 디</td>
    			<td align="left" width="330">${user_id}
       				<input type="hidden" size="10" maxlength="10" name="writer" value="${user_id}">
	   				<input type="hidden" name="num" value="${article.num}"></td>
 			</tr>
			<tr>
				<td width="70" align="center">제 목</td>
				<td align="left" width="330"><input type="text" size="40"
					maxlength="50" name="subject" value="${article.subject}"></td>
			</tr>
			<tr>
				<td width="70" align="center">Email</td>
				<td align="left" width="330"><input type="text" size="40"
					maxlength="30" name="email" value="${article.email}"></td>
			</tr>
			<tr>
				<td width="70" align="center">휴대폰번호</td>
				<td align="left" width="330"><input type="text" size="40"
					maxlength="30" name="ph" value="${article.ph}"></td>
			</tr>
			<tr>
				<td width="70" align="center">내 용</td>
				<td align="left" width="330"><textarea name="content" rows="13"
						cols="40">${article.content}</textarea></td>
			</tr>
			<tr>
				<td width="70" align="center">비밀번호</td>
				<td align="left" width="330"><input type="password" size="8"
					maxlength="4" name="passwd"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="글수정">
					<input type="reset" value="다시작성"> <input type="button"
					value="목록보기"
					onclick="document.location.href='/jejuguseok/adminpage/list.do?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
	</form>


	</body>
</html>
</main>
</div>
