<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%--ㅡmainBean 의 --%>

<c:if test="${result != '0'}">


	로그인 성공! ${member.user_id}님, 반갑습니다
   
	<c:redirect url="index.do" /> 

	
</c:if>
		
<c:if test="${result == '0'}"> 
	<script> 
	  alert("없는 아이디/비밀번호 입니다. 회원가입부터 해주세요!");
      history.go(-1);
	</script>
	</c:if>
	