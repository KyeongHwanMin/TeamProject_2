<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%--��mainBean �� --%>

<c:if test="${result != '0'}">


	�α��� ����! ${member.user_id}��, �ݰ����ϴ�
   
	<c:redirect url="index.do" /> 

	
</c:if>
		
<c:if test="${result == '0'}"> 
	<script> 
	  alert("���� ���̵�/��й�ȣ �Դϴ�. ȸ�����Ժ��� ���ּ���!");
      history.go(-1);
	</script>
	</c:if>
	