<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="UTF-8">
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


<center>
<main>
								<p>궁금하신 점은 1:1 문의를 남겨주세요.</p>
								<p>(1:1 문의는 로그인 후 문의 가능합니다.)</p>
								<!-- <p>문의 남겨주시면 고객님의 이메일 또는 휴대폰 번호로 빠르게 답변 드리겠습니다. </p> -->
								<p>간단한 문의라면 문의주시기 전에 자주 묻는 질문을 먼저 체크해보세요.</p>
<body>




		<center>
			<h3>CONTACT(전체 글:${count})</h3>
			<table width="700">
				<tr>
					<td align="right"><c:if test="${user_id != null}">
							<a href="write.do">CONTACT</a>
						</c:if> <c:if test="${user_id == null }">
							<a href="/jejuguseok/loginForm.do">로그인후 글쓰기</a>
							<!--  로그인 폼 경로 바꿀것 --></td>
				</tr>
			</table>
			</c:if>

			<c:if test="${count == 0 }">
				<table width="700" border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td align="center">게시판에 작성된 문의가 없습니다.</td>
					</tr>
				</table>
			</c:if>

			<c:if test="${count > 0 }">
				<table border="1" width="700" cellpadding="0" cellspacing="0"
					align="center">
					<tr height="30">
						<td align="center" width="50">번 호</td>
						<td align="center" width="250">제 목</td>
						<td align="center" width="100">작성자</td>
						<td align="center" width="150">작성일</td>
						<td align="center" width="50">문의 상태</td>
					</tr>

					<c:forEach var="article" items="${articleList}">
						<tr height="30">
							<td align="center" width="50">${number}
							 <c:set var="number" value="${number-1}" />
							</td>
							<td width="250"><c:if test="${article.re_level > 0 }">
									<img src="/images/re.gif">
								</c:if> <c:if test="${article.re_level == 0 }">
								</c:if> <a href="/jejuguseok/content.do?num=${article.num}&pageNum=${currentPage}">
									${article.subject} </a></td>
							<td align="center" width="100">${article.writer}</a>
							</td>
							<td align="center" width="150">${article.reg_date}</td>
							<td align="center" width="50">
								<c:if test="${article.readcount > 0 && article.re_level > 0}">
									<b>문의답변</b>
								</c:if> 
								<c:if test="${article.readcount > 0 && article.re_level == 0}">
									<b>문의확인</b>
								</c:if> 
								<c:if test="${article.readcount == 0 && article.re_level == 0}">
									<b>문의대기</b></td>
								</c:if>
						</tr>
					</c:forEach>
				</table>
			</c:if>

			<c:if test="${count > 0}">
				<c:set var="pageCount"
					value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
				<c:set var="pageBlock" value="${10}" />
				<fmt:parseNumber var="result" value="${currentPage / 10}"
					integerOnly="true" />
				<c:set var="startPage" value="${result * 10 + 1}" />
				<c:set var="endPage" value="${startPage + pageBlock-1}" />
				<c:if test="${endPage > pageCount}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>

				<c:if test="${startPage > 10}">
					<a
						href="/jejuguseok/list.do?pageNum=${startPage - 10 }">[이전]</a>
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a
						href="/jejuguseok/list.do?pageNum=${i}">[${i}]</a>
				</c:forEach>

				<c:if test="${endPage < pageCount}">
					<a
						href="/jejuguseok/list.do?pageNum=${startPage + 10}">[다음]</a>
				</c:if>
			</c:if>
		</center>
</body>
	</html>
</main>
</div>

