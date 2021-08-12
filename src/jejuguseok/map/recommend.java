package jejuguseok.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import userpage.main.userDTO;
/*
 *  숙소 추천 DAO
 *  	- recommend() : 숙소 TOP10
 * 		- recommendsearch() : 연령별 숙소 TOP10
 */

@Controller
public class recommend {
	@Autowired
	private recommendDTO recommenddto = null;
	@Autowired
	private SqlSessionTemplate dao =null;

		@RequestMapping("recommend.do")
		public String recommend(Model model, HttpServletRequest request){
			int count =0;
			List recommendCount = null;
			List recommendList = null;
			List homeNo = new ArrayList();
			count = dao.selectOne("home.homecount");
			if (count > 0) {
				recommendCount = dao.selectList("recommend.top10");
			}		
			model.addAttribute("count", count);			
			model.addAttribute("recommendCount", recommendCount);
			return "/map/recommend.jsp"; 
		}
		
		@RequestMapping("recommendsearch.do")
		public String recommendsearch(Model model, HttpServletRequest request){			
			int search = Integer.parseInt(request.getParameter("search"));
			int count = 0;	
			String age = null;
			List recommendCount = null;
			List recommendList = null;
			List homeNo = new ArrayList();
			count = dao.selectOne("home.homecount");
			if (count > 0) {
				recommendCount = dao.selectList("recommend.top10");
				if(search == 1) {	recommendCount = dao.selectList("recommend.mybook_20"); 
				age="20대 ";
				model.addAttribute("age", age);
				}else if(search == 2) { recommendCount = dao.selectList("recommend.mybook_30");  
				age="30대 ";
				model.addAttribute("age", age);
				}else if(search == 3) { recommendCount = dao.selectList("recommend.mybook_40");  
				age="40대 ";
				model.addAttribute("age", age);
				}else if(search == 4) { recommendCount = dao.selectList("recommend.mybook_50");   
				age="50대 ";
				model.addAttribute("age", age);
				} }			
			model.addAttribute("count", count);			
			model.addAttribute("recommendCount", recommendCount);
		return "/map/recommend.jsp"; 
		}
	
}
