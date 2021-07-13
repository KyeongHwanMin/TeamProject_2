<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>map test 페이지.!!</h1>

<c:forEach var="maplist" items="${maplist}">
	<h1>place=${maplist.place}</h1>
	<h1>x좌표=${maplist.x} y좌표=${maplist.y}</h1>
</c:forEach>
