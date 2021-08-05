<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<script> 


	var re = confirm("${user_id} 회원을 정말로 탈퇴 시키겠습니까?");
	// confirm - 확인/ 취소 버튼 있음 
     //alert는 확인 버튼만 나옴 
    
     
     
     if(re){
    	 window.location= "memberDeletePro.do?user_id=${user_id}" ;
     }else{
    	 history.go(-1); 
     }
     
     
     
</script>