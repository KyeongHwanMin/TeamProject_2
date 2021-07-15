package userpage.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class otoDAO {
	
		@Autowired
		private otoDTO otoDTO = null;
		@Autowired
		private otoDAO otoDAO = null;
		@Autowired
		private SqlSessionTemplate dao = null;
		
		@RequestMapping("list.do")
		public String list(String pageNum, Model model, HttpServletRequest request) {	
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("memId");
			
			int pageSize = 10;
			
		    if (pageNum == null) {
		        pageNum = "1";
		    }
		    int currentPage = Integer.parseInt(pageNum);
		    int startRow = (currentPage - 1) * pageSize + 1;
		    int endRow = currentPage * pageSize;
		    int count = 0;
		    int number=0;
		    List articleList = null;
		    HashMap Row = new HashMap();
		    Row.put("startTow", startRow);
		    Row.put("endRow", endRow);
		    
		    count = dao.selectOne("getArticleCount");
		    if(count > 0) {
		    	articleList = dao.selectList("getArticles", Row);
		    }
		    
		    number=count-(currentPage-1)*pageSize;
		    
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startRow", startRow);
			model.addAttribute("endRow", endRow);
			model.addAttribute("count", count);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("number", number);
			model.addAttribute("articleList", articleList);
			model.addAttribute("pageNum", pageNum);
			
			return "/userpage/oto/otoUserList.jsp";
		}
		
		@RequestMapping("content.do")
		public String content(int num, int pageNum, Model model) {
			
			     
			      otoDTO article =null ;
			      //dao.update("updateNum", num);
			    	  article =  dao.selectOne("getArticlesNum",num);
			    
			      
			     model.addAttribute("num", num);
			     model.addAttribute("pageNum", pageNum);
			     model.addAttribute("article", article);
			     
			      
			return "/userpage/oto/otoContent.jsp";
	}
}
