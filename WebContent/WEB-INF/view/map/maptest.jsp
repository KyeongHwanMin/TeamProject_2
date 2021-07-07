<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h1>map test 페이지.!!</h1>

<c:forEach var="place" items="${list}">
	<h1>place=${place}</h1>
</c:forEach>