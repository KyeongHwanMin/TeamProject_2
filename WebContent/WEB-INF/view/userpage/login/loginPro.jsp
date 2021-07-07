<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:if test="${check == 1}">
	<c:redirect url="/jejuguseok/startTrip.do" />
		</c:if>
		
<c:if test="${check == 0}"> 
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
	</c:if>
	
<c:if test="${check != 1}"> 
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
	</c:if>