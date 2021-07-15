<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script language="javascript">

	function setid(){
	opener.document.userinput.id.value="";
	opener.document.userinput.id.focus();
		self.close();
		}

	
	function setid1(){		
		self.close();
		}
	
</script>


<html>
<head><title>ID 중복확인</title>
<link href="style.css" rel="stylesheet" type="text/css">



<c:if test="${result == 1}">  
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td height="39" >${param.user_id}는 이미 사용중인 아이디입니다.</td>
  </tr>
</table>


<form name="checkForm" method="post" action="confirmId.do">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td  align="center"> 
       다른 아이디를 선택하세요.<p>
        <input type="button" value="닫기" onclick="setid()">
    </td>
  </tr>
</table>
</form>
</c:if>

<c:if test="${result != 1}">  
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td align="center"> 
      <p>입력하신 ${param.user_id}는 사용하실 수 있는 ID입니다. </p>
      <input type="button" value="닫기" onclick="setid1()">
    </td>
  </tr>
</table>
</c:if>
</body>
</html>

