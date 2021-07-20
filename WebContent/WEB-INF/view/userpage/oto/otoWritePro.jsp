<%@ page contentType="text/html;charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="article" scope="page" class="userpage.board.otoDTO" />
<jsp:setProperty name="article" property="*"/>

<c:redirect url="/jejuguseok/list.do" />
