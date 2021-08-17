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
	private otoDTO otoDTO = null;
	@Autowired
	private otoAdDAO otoAdDAO = null;
	@Autowired
	private SqlSessionTemplate dao = null;
	
	@RequestMapping("/adminpage/list.do")
	public String Adlist(String pageNum, Model model, otoDTO dto, HttpSession session) {
		
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
	public String content(int num, String pageNum, Model model, HttpSession session, otoDTO dto) {
		
		String id = (String)session.getAttribute("user_id");
		
		
		if(id.equals("admin")) {
			dao.update("boardAd.getArticleUp", num);
		}
		otoDTO article = null;

		article =  dao.selectOne("boardAd.getArticle",num);



		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		
		model.addAttribute("ref", ref);
		model.addAttribute("re_step", re_step);
		model.addAttribute("re_level", re_level);
		model.addAttribute("article", article);

			


		return "/adminpage/oto/otoAdminContent.jsp";
	}

	@RequestMapping("/adminpage/deleteForm.do")
	public String delete(otoDTO dto, int num, int otonum, int re_level ,String pageNum, Model model) {
		
		dao.selectOne("board.updateGetArticle", num);
		
		dto.setNum(dto.getNum());
		dto.setWriter(dto.getWriter());
		dto.setPh(dto.getPh());
		dto.setSubject(dto.getSubject());
		dto.setReg_date(dto.getReg_date());
		dto.setReadcount(dto.getReadcount());
		dto.setRef(dto.getRef());
		dto.setRe_step(dto.getRe_step());
		dto.setRe_level(dto.getRe_level());
		dto.setContent(dto.getContent());
		dto.setOtonum(dto.getOtonum());
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("num", num);
		model.addAttribute("level", re_level);
		model.addAttribute("otonum", otonum);

		return "/adminpage/oto/otoAdminDeleteForm.jsp";
	}

	@RequestMapping("adminpage/deletePro.do")
	public String passwd(otoDTO dto, int num , int otonum , int level, String pageNum, Model model) {
		

		  if(level==0){
			dao.delete("board.delete", otonum);
		} else if(level != 0){
			dao.delete("board.deleteOne", num);
		}
		
		model.addAttribute("pageNum", pageNum);
		  
		return "/adminpage/oto/otoDeletePro.jsp";
	}
	
	@RequestMapping("/adminpage/updateForm.do")
	public String update(int num, String pageNum, Model model) {

		otoDTO article = null;
		
		article = dao.selectOne("board.updateGetArticle", num);
		
		article.setNum(article.getNum());
		article.setWriter(article.getWriter());
		article.setPh(article.getPh());
		article.setSubject(article.getSubject());
		article.setReg_date(article.getReg_date());
		article.setReadcount(article.getReadcount());
		article.setRef(article.getRef());
		article.setRe_step(article.getRe_step());
		article.setRe_level(article.getRe_level());
		article.setContent(article.getContent());
		article.setOtonum(article.getOtonum());
		
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("num", num);
		model.addAttribute("article", article);
		
		return "/adminpage/oto/otoAdminUpdateForm.jsp";
	}

	@RequestMapping("/adminpage/updatePro.do")
	public String updatePro(otoDTO dto, String pageNum) {

		dao.update("board.updateArticle", dto);
		
		dto.setWriter(dto.getWriter());
		dto.setPh(dto.getPh());
		dto.setSubject(dto.getSubject());
		dto.setReg_date(dto.getReg_date());
		dto.setContent(dto.getContent());
		dto.setNum(dto.getNum());
		
		return "/adminpage/oto/otoUpdatePro.jsp";
	}
	
	@RequestMapping("/adminpage/write.do")
	public String write(Model model, HttpSession session, int num , int ref, int re_step, int re_level) {
		
		String id = (String) session.getAttribute("user_id");
		
			model.addAttribute("num", num);
			model.addAttribute("ref", ref);
			model.addAttribute("re_step", re_step);
			model.addAttribute("re_level", re_level);
			
		return "/adminpage/oto/otoAdminWrite.jsp";
	}


	@RequestMapping("/adminpage/writePro.do")
	public String writePro(otoDTO dto, int num , int ref, int re_step, int re_level) throws Exception{

		int number=0;
		
		number = (Integer)dao.selectOne("board.maxNum");
		
		number += 1;
		
		System.out.println("num======"+num);
		System.out.println("ref======"+ref);
		System.out.println("re_step======"+re_step);
		
		

		HashMap up = new HashMap();
		up.put("ref", ref);
		up.put("re_step", re_step);
		if(num!=0) {
			dao.update("board.readCountUp", up);
			re_step=re_step+1;
			re_level=re_level+1;
		}else {
			ref=number;
			re_step=0;
			re_level=0;
		}
		 
		int otonum = (Integer)dao.selectOne("boardAd.otoNum", num);
	
		otoDTO.setWriter(dto.getWriter());
		otoDTO.setPh(dto.getPh());
		otoDTO.setSubject(dto.getSubject());
		otoDTO.setReg_date(dto.getReg_date());	
		otoDTO.setRef(ref);
		otoDTO.setRe_step(re_step);
		otoDTO.setRe_level(re_level);
		otoDTO.setContent(dto.getContent());
		otoDTO.setOtonum(otonum);
		
		dao.insert("boardAd.AdInsertArticles", otoDTO);
		
		return "/adminpage/oto/otoWritePro.jsp";
	}
}
