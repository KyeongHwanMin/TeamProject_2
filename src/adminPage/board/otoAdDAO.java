package adminPage.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import userpage.board.otoDTO;

@Controller
public class otoAdDAO {
	
	@Autowired
	private otoDTO dtoDTO = null;
	@Autowired
	private otoAdDAO dtoAdDAO = null;
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@RequestMapping("/adminpage/list.do")
	public String Adlist(String pageNum, Model model, otoDTO dto, HttpSession session) {
		
		String id = (String) session.getAttribute("user_id");

		int pageSize = 10;  // 한페이지에 보여질 게시물수
 
		    if (pageNum == null) {
		        pageNum = "1";
		    }

		    int currentPage = Integer.parseInt(pageNum);  // 1
		    int startRow = (currentPage - 1) * pageSize + 1;  // (1-1) * 10 + 1 = 11
		    int endRow = currentPage * pageSize;  // 1 * 10 = 10
		    int count = 0;  // 전체 게시물수.. 
		    int number=0;  // 화면 글번호 

		    List articleList = null;
			HashMap Row = new HashMap();
			Row.put("admin", id);
			Row.put("startRow", startRow);
			Row.put("endRow", endRow);
		    
		    
		    count = dao.selectOne("boardAd.adminGetArticleCount");
		    
		    if (count > 0) {
		        articleList = dao.selectList("boardAd.adminGetArticles", Row);
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
			
			return "/adminpage/oto/otoAdminList.jsp";
	}
	
	@RequestMapping("/adminpage/content.do")
	public String content(int num, int pageNum, Model model, HttpSession session, otoDTO dto) {
		

		
		String id = (String)session.getAttribute("user_id");
		
			
			
		otoDTO article =null ;
		//dao.update("updateNum", num);
		article =  dao.selectOne("getArticlesNum",num);


		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("article", article);



		return "/adminpage/oto/otoAdminContent.jsp";
	}

	@RequestMapping("/adminpage/deleteForm.do")
	public String delete(int num, int pageNum, Model model) {


		return "/adminpage/oto/otoAdminDeleteForm.jsp";
	}

	@RequestMapping("/adminpage/updateForm.do")
	public String update(int num, int pageNum, Model model) {


		return "/adminpage/oto/otoAdminUpdateForm.jsp";
	}

	@RequestMapping("/adminpage/write.do")
	public String write(int num, int pageNum, Model model) {


		return "/adminpage/oto/otoAdminWrite.jsp";
	}

	@RequestMapping("/adminpage/deletePro.do")
	public String deletePro(int num, int pageNum, Model model) {


		return "/adminpage/oto/otoAdminDeletePro.jsp";
	}

	@RequestMapping("/adminpage/updatePro.do")
	public String updatePro(int num, int pageNum, Model model) {


		return "/adminpage/oto/otoAdminUpdatePro.jsp";
	}

	@RequestMapping("/adminpage/writePro.do")
	public String writePro(int num, int pageNum, Model model) {


		return "/adminpage/oto/otoAdminWritePro.jsp";
	}


}
