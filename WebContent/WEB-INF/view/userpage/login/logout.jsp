<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- 
<c:redirect url="index.do" /> 

--%>
  
    <script>
  	function check(){
  		opener.location.href="index.do";
  		self.close();
  	}
  	</script>
  	
  	<center>
  	로그아웃 되었습니다.
  	<br/><br/>
  	<input type="button" onclick="check();" value="확인"/>
  	</center>