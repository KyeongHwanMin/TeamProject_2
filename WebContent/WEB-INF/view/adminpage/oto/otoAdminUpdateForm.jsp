<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>


 <input type="hidden" name="otonum" value=${num }/>
<center><b>글수정</b>
<br>
<form method="post" name="writeform" action="/jejuguseok/WEB-INF/view/adminpage/oto/otoUpdatePro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td  width="70"  align="center">이 름</td>
    <td align="left" width="330">
       <input type="text" size="10" maxlength="10" name="writer" value="${article.writer}">
	   <input type="hidden" name="num" value="${article.num}"></td>
  </tr>
  <tr>
    <td  width="70"  align="center" >제 목</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="subject" value="${article.subject}"></td>
  </tr>
  <tr>
    <td  width="70" align="center">Email</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="30" name="email" value="${article.email}"></td>
  </tr>
    <tr>
    <td  width="70" align="center">휴대폰번호</td>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="30" name="ph" value="${article.ph}"></td>
  </tr>
  <tr>
    <td  width="70" align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40">${article.content}</textarea></td>
  </tr>
  <tr>
    <td  width="70"  align="center" >비밀번호</td>
    <td align="left" width="330" >
     <input type="password" size="8" maxlength="4" name="passwd">
	 </td>
  </tr>
    <tr>
    <td  width="70"  align="center" >첨부파일</td>
    <td align="left" width="330" >
     <input type="file" name="save" value="${article.save}" /> <br />
	 </td>
  </tr>
  <tr>      
   <td colspan=2 align="center"> 
     <input type="submit" value="글수정" >  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='/jejuguseok/WEB-INF/view/adminpage/oto/otoAdminList.do?pageNum=${pageNum}'">
   </td>
 </tr>
 </table>
</form>
    
      
</body>
</html>      
</main>
</div>