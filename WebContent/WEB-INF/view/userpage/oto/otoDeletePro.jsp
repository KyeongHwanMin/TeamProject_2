<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




	<c:if test="${check==1}">
	  <meta http-equiv="Refresh" content="0;url=/jejuguseok/WEB-INF/view/userpage/oto/otoUserList.do?pageNum=${pageNum}" >
	</c:if>
	<c:if test="${check!=1}">
       <script language="JavaScript">         
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
      </script>
</c:if>
