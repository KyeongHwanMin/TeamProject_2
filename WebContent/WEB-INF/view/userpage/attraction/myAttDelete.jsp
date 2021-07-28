<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"   uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜한 관광지 삭제</title>

<script> 
var re = confirm("${place_no}:${place_name} 장소를 삭제하시겠습니까?");

     if(re){
    	 window.location= "myAttDeletePro.do?place_no=${place_no}" ;
     }else{
    	 history.go(-1); 
     }    
</script>
</body>
</html>