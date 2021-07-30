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
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>
</br>


<center>
	<b>문의글삭제</b> <br>
	<form method="POST" name="delForm"
		action="/jejuguseok/adminpage/deletePro.do?num=${num}&otonum=${otonum}&pageNum=${pageNum}&level=${level}"
		onsubmit="return deleteSave()">
		<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
			<tr height="30">
				<td align=center><b>문의글을 정말로 삭제하시겠습니까?</b></td>
			</tr>
			<tr height="30">
				<td align=center><input type="submit" value="글삭제"> <input
					type="button" value="글목록"
					onclick="document.location.href='/jejuguseok/adminpage/list.do?pageNum=${pageNum}'">
				</td>
			</tr>
		</table>
	</form>
	</body>
	</html>
</main>
</div>