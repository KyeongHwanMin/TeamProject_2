<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<center>
  <h1>사이트맵</h1>
  <table width="1000">
    <tr height="50">
      <td width="250" align="center"> <h3>상품</h3> </td>
      <td width="250" align="center"> <h3>이벤트</h3> </td>
      <td width="250" align="center"> <h3>마이페이지</h3> </td>
      <td width="250" align="center"> <h3>고객센터</h3> </td>
    </tr> 
    <tr height="30">
      <td width="250" align="center"><a href="">전체카테고리</a></td>

      <td width="250" align="center"><a href="">이벤트</a></td>
      <td width="250" align="center"><a href="/userpage/mypage/myOrder.jsp">주문내역</a></td>
      <td width="250" align="center"><a href="/userpage/notice(user)/list.jsp">공지사항</a></td>
    </tr>
    <tr height="30">
      <td width="250" align="center"><a href="/userpage/product/productNewList.jsp">신상품</a></td>
      <td width="250" align="center"></td>
      <td width="250" align="center"><a href="/userpage/mypage/myCouPoint.jsp">쿠폰/적립금</a></td>
      <td width="250" align="center"><a href="/userpage/faq(user)/list.jsp">자주 묻는 질문</a></td>
    </tr>
    <tr height="30">
      <td width="250" align="center"><a href="/userpage/product/productBestList.jsp">베스트</a></td>
      <td width="250" align="center">  </td>
      <td width="250" align="center"><a href="/userpage/mypage/myInquire.jsp">1:1문의내역</a></td>
      <td width="250" align="center"><a href="/userpage/privatequestion(user)/list1.jsp">1:1문의</a></td>
    </tr>
    <tr height="30">
      <td width="250" align="center"><a href="/userpage/product/list_basket.jsp">장바구니</a></td>
      <td width="250" align="center">  </td>
      <td width="250" align="center"><a href="/userpage/user/updateForm.jsp">개인정보수정</a></td>
      <td width="250" align="center">  </td>
    </tr>
    <tr height="30">
      <td width="250" align="center">  </td> 
      <td width="250" align="center">  </td>
      <td width="250" align="center"><a href="/userpage/user/deleteForm.jsp">회원탈퇴</a></td>
      <td width="250" align="center">  </td>
    </tr>
    </br>
    </br>
    
      
  </table>
</center>