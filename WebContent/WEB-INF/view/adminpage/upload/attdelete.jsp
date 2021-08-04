<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 관광지 삭제 -->
<script> 
	var attdelete = confirm("해당 관광지를 삭제하시겠습니까?");
     if(attdelete){
    	 window.location= "attForm.do" ; // 확인 클릭 시 삭제: 관광지메인 이동
     }else{
    	 history.go(-1); 
     }
</script>