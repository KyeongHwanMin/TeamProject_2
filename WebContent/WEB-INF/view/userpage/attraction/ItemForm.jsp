<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="ItemPro.do" method="post" enctype="multipart/form-data">
	장소명: <input type="text" name ="place_name" /> <br />	
	주소: <input type="text" name ="address" /> <br />	
	장소 정보: <textarea name ="content" rows="5" cols="20"> </textarea> <br />
	장소 구분: <select name="category ">
               <option>관광지</option>
               <option>숙소</option>
 	</select><br/>
	이미지: <input type="file" name="img" /><br />
	<input type="submit" value ="확인" />
	<input type="button" value="취소" onclick="window.location='index.do'">
	 <br />
</form>