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

		<%@ include file="../header.jsp"%>
		
</br>
</br>
</br>
</br>
</br>
</br>

<c:if test="${user_id == null}">
	<script>
			alert("로그인후 문의 가능합니다.!!");
			window.location='/jejuguseok/loginForm.do'; // 비회원 로그인 페이지 이동경로
	</script>
</c:if>

	<center>
		<b>CONTACT</b> <br>
		<form method="post" name="writeform"
			action="/jejuguseok/writePro.do"
			onsubmit="return writeSave()">
				<input type="hidden" name="num" value="${num}"> 
				<input type="hidden" name="ref" value="${ref}">
				<input type="hidden" name="re_step" value="${re_step}">
				<input type="hidden" name="re_level" value="${re_level}">
				
			<table width="400" border="1" cellspacing="0" cellpadding="0"
				align="center">
				<tr>
					<td align="right" colspan="2"><a href="/jejuguseok/list.do">문의목록</a></td>
				</tr>
				<tr>
					<td width="70" align="center">아이디</td>
					<td width="330">${user_id} <input type="hidden" name="writer"
						value="${user_id}">
					</td>
				</tr>
				<tr>
					<td width="70" align="center">Email</td>
					<td width="330">${email}<input type="hidden" name="email"
					value="${email}">
					</td>
				</tr>
				<tr>
					<td width="70" align="center">제 목</td>
					<td width="330">
					<c:if test="${num == 0}">
							<input type="text" size="40" maxlength="50" name="subject"></td>
					</c:if>
					<c:if test="${num != 0}">
						<input type="text" size="40" maxlength="50" name="subject"
							value="[답변]">
					</c:if>
				</tr>
				<tr>
					<td width="70" align="center">휴대폰번호</td>
					<td width="330"><input type="text" size="40" maxlength="30"
						name="ph"></td>
				</tr>
				<tr>
					<td width="70" align="center">내 용</td>
					<td width="330"><textarea name="content" rows="13" cols="40"></textarea>
					</td>
				</tr>
					<td colspan=2 align="center"><input type="submit" value="문의글쓰기">
						<input type="reset" value="다시작성"> <input type="button"
						value="목록보기"
						OnClick="document.location.href='/jejuguseok/list.do'">
					</td>
				</tr>
			</table>
	
		</form>
		</body>
	</center>
		</html>
	</main>
	</div>
