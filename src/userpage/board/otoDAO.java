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
import org.springframework.web.bind.annotation.SessionAttributes;

import userpage.main.userDTO;

	@Controller
	public class otoDAO {
	
		@Autowired
		private otoDTO otoDTO = null;
		@Autowired
		private otoDAO otoDAO = null;
		@Autowired
		private SqlSessionTemplate dao = null;
		
		
		// 리스트 페이지 비교및 파라미터 가져오기 dao 에 있는 getArticles 가져오기
		@RequestMapping("list.do")
		public String list(String pageNum, Model model, HttpServletRequest request, otoDTO dto, userDTO userdto,  HttpSession session) {	
	
			String id = (String) session.getAttribute("user_id");
	        
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
			Row.put("user_id", id);
			Row.put("startRow", startRow);
			Row.put("endRow", endRow);
			
			System.out.println("id=" + id);
	
			count = dao.selectOne("board.userGetArticleCount" , id);
			if(count > 0) {                         
				articleList = dao.selectList("board.userGetArticles", Row);
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
		
		
		// 리스트에서 페이지 누를시 보여지는 화면 DTO 를 아티클에 null 값으로 입력 
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
		
		@RequestMapping("write.do")
		public String write(String num, String ref , String re_step , String re_level , Model model, HttpSession session) {
			
			String id = (String) session.getAttribute("user_id");
			
			if( num != null ){
				model.addAttribute("num", num);
				model.addAttribute("ref", ref);
				model.addAttribute("re_step", re_step);
				model.addAttribute("re_level", re_level);
			}
			
			return "/userpage/oto/otoWrite.jsp";
		}
		
		@RequestMapping("writePro.do")
		public String insert(int num, int ref , int re_step , int re_level ,Model model, otoDTO dto) {
		    
			
		    
		    
			return "/userpage/oto/otoWritePro.jsp";
		}
}
