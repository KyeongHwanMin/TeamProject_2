<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<script> 


	var re = confirm("${home_no}번 장소를 삭제하시겠습니까?");
	// confirm - 확인/ 취소 버튼 있음 
     //alert는 확인 버튼만 나옴 
    
     
     
     if(re){
    	 window.location= "homeDeletePro.do?home_no=${home_no}" ;
     }else{
    	 history.go(-1); 
     }
     
     
     
</script>