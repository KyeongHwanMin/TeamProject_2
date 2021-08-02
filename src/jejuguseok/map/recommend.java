package jejuguseok.map;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import userpage.main.userDTO;


@Controller
public class recommend {
	@Autowired
	private SqlSessionTemplate dao =null;
	

	
		@RequestMapping("recommend.do")
		public String accom(Model model, HttpServletRequest request){
			
			int pageSize = 5;	
			
			
			String pageNum = request.getParameter("pageNum");	
			String category = request.getParameter("category");	
			
			if(category==null) {
				category="all";
			}
			if (pageNum == null) {	
			    pageNum = "1";
			}
			
			
			int currentPage = Integer.parseInt(pageNum);		

			int startRow = (currentPage - 1) * pageSize + 1;	
			int endRow = currentPage * pageSize;				
			int count = 0;	
			int number= 0;
			
			List recommendCount = null;
			List recommendList = null;
			count = dao.selectOne("home.homecount");
			
			
			
			HashMap Row = new HashMap();   
			Row.put("startRow", startRow);
			Row.put("endRow", endRow);
			
			if (count > 0) {
				recommendCount = dao.selectList("recommend.top10");
				recommendList = dao.selectList("recommend.mybook_2030");
			}
			
			number=count-(currentPage-1)*pageSize;	 
				
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startRow", startRow);
			model.addAttribute("endRow", endRow);
			model.addAttribute("count", count);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("number", number);
			model.addAttribute("recommendCount", recommendCount);
			model.addAttribute("recommendList", recommendList); 
			model.addAttribute("pageNum", pageNum);


			 //List list3 = dao.selectList("item.myHome"); 
			
			//List list3 = dao.selectList("item.articleList");
			// model.addAttribute("list3",list3);
			
			return "/map/recommend.jsp"; 
		}
	
}
