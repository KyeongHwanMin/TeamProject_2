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
<head><title>ID �ߺ�Ȯ��</title>
<link href="style.css" rel="stylesheet" type="text/css">



<c:if test="${result == 1}">  
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td height="39" >${param.user_id}�� �̹� ������� ���̵��Դϴ�.</td>
  </tr>
</table>


<form name="checkForm" method="post" action="confirmId.do">
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td  align="center"> 
       �ٸ� ���̵� �����ϼ���.<p>
        <input type="button" value="�ݱ�" onclick="setid()">
    </td>
  </tr>
</table>
</form>
</c:if>

<c:if test="${result != 1}">  
<table width="270" border="0" cellspacing="0" cellpadding="5">
  <tr> 
    <td align="center"> 
      <p>�Է��Ͻ� ${param.user_id}�� ����Ͻ� �� �ִ� ID�Դϴ�. </p>
      <input type="button" value="�ݱ�" onclick="setid1()">
    </td>
  </tr>
</table>
</c:if>
</body>
</html>

