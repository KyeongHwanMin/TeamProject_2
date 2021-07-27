<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 관광지 메인/프로 페이지에서 찜하기 클릭 시 해당 알럿 노출  --%>

	<script> 
	  alert("${place_name}을 찜하였습니다");
      history.go(-1);
      
	</script>