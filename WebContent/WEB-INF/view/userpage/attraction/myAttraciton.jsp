<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "jejuguseok_map.attractionDTO" %>
<%@ page import = "jejuguseok_map.attractionDAO" %>
<%@ page import = "java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file ="../header.jsp" %>
<%@ //test.mvc.model.BoardDBBeantest.mvc.model.BoardDataBean %>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<center><b>내가 찜한 곳:${count}</b>
<table width="700">
<tr>
    <td align="right">
    <a href="/spring/board/writeForm.nhn">글쓰기</a>
    </td>
</table>


<c:if test="${count == 0}">
	<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
	    <td align="center">
	    찜한 장소가 없습니다.
	    </td>
	</table>
</c:if>

<c:if test="${count > 0}">
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
		<tr height="30"> 
	    	<td align="center"  width="50"  >번 호</td> 
			<td align="center"  width="200" >관광지명</td> 
			<td align="center"  width="250" >주소</td>
			<td align="center"  width="100" >카테고리</td>
			 
	    </tr>
		
		<c:forEach var="article" items="${articleList}">
			<tr height="30">
	    		<td align="center"  width="50" > 
	    			${number}
	    			<c:set var="number" value="${number-1}" /> 
	    		</td>
	    		<td  width="250" >		
					<c:if test="${article.re_level > 0 }" >
			  			<img src="images/level.gif" width="${article.re_level * 5}" height="16">
			  			<img src="images/re.gif">
					</c:if>
					<c:if test="${article.re_level == 0 }" >
			  			<img src="images/level.gif" width="${article.re_level * 5}" height="16">
					</c:if>
		
					<a href="/spring/board/content.nhn?num=${article.num}&pageNum=${currentPage}">
		           		${article.subject}
					</a> 
					
					<c:if test="${article.readcount >= 20}">
		        		<img src="images/hot.gif" border="0"  height="16">
					</c:if>
				</td>
		    	<td align="center"  width="100"> 
		       		<a href="mailto:${article.email}">${article.writer}</a>
		       	</td>
			    <td align="center"  width="150">${article.reg_date}</td>
			    <td align="center"  width="50">${article.readcount}</td>
			    <td align="center" width="100" >${article.ip}</td>
			</tr>
		</c:forEach>
	</table>
</c:if>

<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
        <a href="/spring/board/list.nhn?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/spring/board/list.nhn?pageNum=${i}">[${i}]</a>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/spring/board/list.nhn?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
</center>
</body>
</html>