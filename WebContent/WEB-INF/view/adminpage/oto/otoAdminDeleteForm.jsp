<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




		<%@ include file="../adminHeader.jsp"%>
		
			<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid px-4">
			<div class="card mb-4">

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