<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%--ㅡmainBean 의 --%>

<c:if test="${result != null}">


	로그인 성공! ${member.user_id}님, 반갑습니다
   
	<c:redirect url="index.do" /> 

	
</c:if>
		
<c:if test="${result == null}"> 
	<script> 
	  alert("id/비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
	</c:if>
	