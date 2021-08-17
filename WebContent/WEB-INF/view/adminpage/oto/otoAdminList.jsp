<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>


<%@ include file="../adminHeader.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Tables</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="adminpage/index.do">Dashboard</a></li>
				<li class="breadcrumb-item active">Tables</li>
			</ol>




			<center>
				<main>

					<h2>CONTACT</h2>
					<p>궁금하신 점은 1:1 문의를 남겨주세요.</p>
					<p>(1:1 문의는 로그인 후 문의 가능합니다.)</p>
					<!-- <p>문의 남겨주시면 고객님의 이메일 또는 휴대폰 번호로 빠르게 답변 드리겠습니다. </p> -->
					<p>간단한 문의라면 문의주시기 전에 자주 묻는 질문을 먼저 체크해보세요.</p>


					<body>

						<center>
							<b>CONTACT(전체 글:${count})</b>

							<c:if test="${count == 0}">
								<table width="700" border="1" cellpadding="0" cellspacing="0">
									<tr>
										<td align="center">게시판에 작성된 문의가 없습니다.</td>
									</tr>
								</table>
							</c:if>

							<c:if test="${couunt != 0}">
								<table class="table  table-white  table-hover" width="700">
									<tr height="30">
										<td align="center" width="50">번 호</td>
										<td align="center" width="250">제 목</td>
										<td align="center" width="100">작성자</td>
										<td align="center" width="150">작성일</td>
										<td align="center" width="70">문의 상태</td>
									</tr>

									<c:forEach var="article" items="${articleList}">
										<tr height="30">
											<td align="center" width="50">${number}<c:set
													var="number" value="${number-1}" />
											</td>
											<td width="250" style="color:red;"><c:if test="${article.re_level > 0 }">
												<img src="/jejuguseok/images/re.gif">
												</c:if> <c:if test="${article.re_level == 0 }">
												</c:if> <a href="/jejuguseok/adminpage/content.do?num=${article.num}&pageNum=${currentPage}">
													${article.subject} </a></td>
											<td align="center" width="100">${article.writer}</a>
											</td>
											<td align="center" width="150">${article.reg_date}</td>
											<td align="center" width="50"><c:if
													test="${article.readcount >= 0 && article.re_level > 0}">
													<b style="color:blue;">문의답변</b>
												</c:if> <c:if
													test="${article.readcount > 0 && article.re_level == 0}">
													<b>문의확인</b>
												</c:if> <c:if
													test="${article.readcount == 0 && article.re_level == 0}">
													<b style="color:red;">문의대기</b></td>
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
										href="/jejuguseok/adminpage/list.do?pageNum=${startPage - 10 }">[이전]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<a href="/jejuguseok/adminpage/list.do?pageNum=${i}">[${i}]</a>
								</c:forEach>

								<c:if test="${endPage < pageCount}">
									<a
										href="/jejuguseok/adminpage/list.do?pageNum=${startPage + 10}">[다음]</a>
								</c:if>
							</c:if>

						</center>
					</body>
				</main>
			</center>
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