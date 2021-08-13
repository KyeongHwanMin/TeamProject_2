<%@ page contentType="text/html; charset=UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<%@ include file="../adminHeader.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Tables</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="adminpage/index.do">Dashboard</a></li>
				<li class="breadcrumb-item active">Tables</li>
			</ol>

			</br> 

			<main>

				<html>
<head>
<title>문의글쓰기</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>


<center>
	<b>문의내용</b> <br>
	<form method="post" name="writeform"
		action="/jejuguseok/adminpage/writePro.do"
		onsubmit="return writeSave()">
		<input type="hidden" name="num" value="${num}"> <input
			type="hidden" name="ref" value="${ref}"> <input type="hidden"
			name="re_step" value="${re_step}"> <input type="hidden"
			name="re_level" value="${re_level}">

		<table class="table-bordered" width="400" border="1" cellspacing="0" cellpadding="0"
			align="center">
			<input type="hidden" name="otonum" value="${num}">
			<tr>
				<td align="right" colspan="2"><a href="list.do"> 문의목록</a></td>
			</tr>
			<tr>
				<td width="70" align="center">이 름</td>
				<td width="330">${user_id}<input type="hidden" name="writer"
					value="${user_id}">
				</td>
			</tr>
			<tr>
				<td width="70" align="center">제 목</td>
				<td width="330"><c:if test="${num == null}">
						<input type="text" size="40" maxlength="50" name="subject"></td>
				</c:if>
				<c:if test="${num != null}">
					<input type="text" size="40" maxlength="50" name="subject"
						value="[답변]">
				</c:if>
			</tr>
			<tr>
				<td width="70" align="center">Email</td>
				<td width="330"><input type="text" size="40" maxlength="30"
					name="email"></td>
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

			<td colspan=2 align="center"><input type="submit" value="문의쓰기">
				<input type="reset" value="다시작성"> <input type="button"
				value="목록보기"
				OnClick="document.location.href='/jejuguseok/adminpage/list.do'">
			</td>
			</tr>
		</table>

	</form>
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
