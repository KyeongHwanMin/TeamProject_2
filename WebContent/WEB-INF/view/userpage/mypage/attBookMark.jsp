<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 관광지 메인 페이지에서 찜하기 클릭 시 해당 알럿 노출 
count 0 : 해당 id DB에 중복된 관광지 없음
count 1 : 중복돈 관광지 있음  --%>

<c:if test="${count == 0}">
	<script> 
	  alert("해당 관광지를 찜하였습니다.");
      history.go(-1);
	</script>
</c:if>
<c:if test="${count ==1 }">
	<script> 
	  alert("이미 찜한 관광지입니다.");
      history.go(-1);
	</script>
</c:if>