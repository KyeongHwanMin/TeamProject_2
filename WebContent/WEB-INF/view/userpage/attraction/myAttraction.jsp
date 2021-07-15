<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jejuguseok_map.ItemDAO" %>
<%@ page import="jejuguseok_map.ItemDTO" %>
<%@ page import="java.util.ArrayList" %> 
    <%
      int pageSize = 10; // 한 페이지에 보여질 게시물 수 
      
      String pageNum = request.getParameter("pageNum"); // 리스트에서 페이지번호 누르면 받아올수있다.
      if(pageNum == null){
    	  pageNum="1";
      }
      
      String id = (String)session.getAttribute("user_id");
      
      int currentPage = Integer.parseInt(pageNum); // String형식의 pageNum을 int형식으로 변경 
      int startRow = (currentPage - 1) * pageSize + 1; // 페이지의 게시물 시작번호 
      int endRow = currentPage * pageSize; // 페이지의 게시물 끝번호 
      int count = 0; // 리스트의 총 게시물수 
      int number = 0; // 화면 글번호
      
      ArrayList faqList = null;
      ItemDAO dbPro = new ItemDAO();
		count = dbPro.getFaqCount(); // 전체 게시물수 메서드 
      if(count > 0){
		faqList = dbPro.getFaqes(startRow, endRow); // faqList에 게시물 목록 담는 메서드 
      }
      number=count-(currentPage-1)*pageSize;
    %>
    
    <center>
      <tr>
        <td align="center"><b> 내가 찜한 그 곳 </b></td>
      </tr>  
      <table width="850">
        <tr>
          <td align="right">
            <%-- 관광지/숙소 페이지로 이동(디폴트 관광지) --%>
            <select name="cate" onchange="location.href=this.value">
              <option value="cateMem.jsp">내 관광지</option>
              <option value="catePay.jsp">내 숙소</option>
            </select>
          </td>
        </tr>    
      </table>
      
      <%if(count==0){ %> <%--게시물이 없을때 --%>
         <table width="850" border="1" cellpadding="0" cellspacing="0">
           <tr>
             <td align="center">
               찜한 곳이 없습니다. 
             </td>
           </tr>
          </table> 
         <%}else{%> <%--게시물이 있을때 --%>
           <table width="850" border="1" cellpadding="0" cellspacing="0" align="center">
             <tr height="30">
               <td align="center"  width="200" >관광지 카테고리</td> 
		       <td align="center"  width="200" >관광지명</td> 
	    	   <td align="center"  width="200" >관광지 주소</td>
	    	   <td align="center"  width="50" > </td>
             </tr>
          <%for(int i = 0 ; i < faqList.size() ; i++) { // faqList에 있는 목록들을 반복문 사용하여 꺼내줌 
    	       ItemDTO faq = (ItemDTO)faqList.get(i);
          %>
	     <tr height="30">
    	   <td align="center"  width="100" > <%=number--%></td> <%--번호 --%>
			<td align="center"  width="200"> <%=faq.getCate() %></td> <%--선택된 카테고리 --%>
    	   <td  width="400" >
     		 <a href="content.jsp?num=${count}%>&pageNum=${count}"> <%--제목 누르면 content 페이지로 이동(글번호와 현재페이지 전달) --%>
           		${count}
           	 </a> </td>
           <td align="center" width="100"> <%=//faq.getWriter() %></td>
           <td align="center" width="50">
             <input type="button" value="삭제" onclick="window.location='deleteForm.jsp?num=<%=faq.getNum()%>&pageNum=<%=pageNum%>'"/>
           </td> 
	     </tr>
         <% } %>
          </table> 
         <%} %>
         <table width="850">
           <tr>
             <td align="right">
               <input type="button" value="글쓰기" onclick="window.location='writeForm.jsp'"/>
             </td>
           </tr>    
         </table>
         
          <%
          // 페이지 번호 계산
          if (count > 0) { // 게시물이 있을경우 
             int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
             int startPage = (int)(currentPage/10)*10+1;
		     int pageBlock=10;
             int endPage = startPage + pageBlock-1;
             if (endPage > pageCount) endPage = pageCount;
        
             if (startPage > 10) {    %>
             <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
         <%      }
             for (int i = startPage ; i <= endPage ; i++) {  %>
           	<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
	     <%		}
             if (endPage < pageCount) {  %>
        	<a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
	     <%		}
           }       
            %>
         
    </center>