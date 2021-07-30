package userpage.board;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import jejuguseok_map.accomBookMKdto;
import jejuguseok_map.homeDTO;
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
		public String content(int num, String pageNum, Model model) {
			
			otoDTO article =null ;
			
			article =  dao.selectOne("getArticlesNum",num);
	
			int ref=article.getRef();
			int re_step=article.getRe_step();
			int re_level=article.getRe_level();
			
			model.addAttribute("num", num);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("article", article);
	
	
			return "/userpage/oto/otoContent.jsp";
		}
		
		@RequestMapping("write.do")
		public String write(Model model, HttpSession session) {
			
			String id = (String) session.getAttribute("user_id");
			
			int num=0,ref=1,re_step=0,re_level=0;
			
				model.addAttribute("num", num);
				model.addAttribute("ref", ref);
				model.addAttribute("re_step", re_step);
				model.addAttribute("re_level", re_level);

			System.out.println("num = " + num);
			System.out.println("ref = " + ref);
			System.out.println("re_step = " + re_step);
			System.out.println("re_level = " + re_level);
			
			return "/userpage/oto/otoWrite.jsp";
		}
		
		@RequestMapping("writePro.do")
		public String insert(otoDTO dto, int num, int ref, int re_step, int re_level) throws Exception{
			

			int number=0;
			
			number = (Integer)dao.selectOne("board.maxNum");
			
			number += 1;
			
			if(num!=0) {
				dao.update("board.readCountUp");
				re_step=re_step+1;
				re_level=re_level+1;
			}else {
				ref=number;
				re_step=0;
				re_level=0;
			}
			
			otoDTO.setWriter(dto.getWriter());
			otoDTO.setPh(dto.getPh());
			otoDTO.setSubject(dto.getSubject());
			otoDTO.setReg_date(dto.getReg_date());
			otoDTO.setRef(ref);
			otoDTO.setRe_step(re_step);
			otoDTO.setRe_level(re_level);
			otoDTO.setContent(dto.getContent());
			otoDTO.setOtonum(dto.getOtonum());
			
			dao.insert("board.insertArticles", dto);
			
			System.out.println(dto.getWriter());
			
			return "/userpage/oto/otoWritePro.jsp";
		}
		
		@RequestMapping("updateForm.do")
		public String update(otoDTO dto, int num, String pageNum, Model model) {
				
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
			
			System.out.println(num);
			
			return "/userpage/oto/otoUpdateForm.jsp";
		}
		
		@RequestMapping("UpdatePro.do")
		public String updatePro(otoDTO dto, String pageNum) {
			
			dao.update("board.updateArticle", dto);
			
			dto.setWriter(dto.getWriter());
			dto.setPh(dto.getPh());
			dto.setSubject(dto.getSubject());
			dto.setReg_date(dto.getReg_date());
			dto.setContent(dto.getContent());
			dto.setNum(dto.getNum());
			
			return "/userpage/oto/otoUpdatePro.jsp";
		}
		
		@RequestMapping("deletePro.do")
		public String passwd(otoDTO dto, int num , int otonum , int level, String pageNum, Model model) {
			

			  if(level==0){
				dao.delete("board.delete", otonum);
			} else if(level != 0){
				dao.delete("board.deleteOne", num);
			}
			
			 model.addAttribute("pageNum", pageNum);
			  
			return "/userpage/oto/otoDeletePro.jsp";
		}
		
		@RequestMapping("deleteForm.do")
		public String delete(otoDTO dto, String pageNum, int num, int re_level, int otonum, Model model) {
			
			
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
			
			System.out.println("num="+num);
			
			return "/userpage/oto/otoDeleteForm.jsp";
		}
		
}
