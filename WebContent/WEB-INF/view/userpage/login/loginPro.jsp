<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%--��mainBean �� --%>

<c:if test="${result != null}">


	�α��� ����! ${member.user_id}��, �ݰ����ϴ�
   
	<c:redirect url="index.do" /> 

	
</c:if>
		
<c:if test="${result == null}"> 
	<script> 
	  alert("id/��й�ȣ�� ���� �ʽ��ϴ�.");
      history.go(-1);
	</script>
	</c:if>
	