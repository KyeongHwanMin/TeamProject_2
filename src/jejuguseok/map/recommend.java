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


@Controller
public class recommend {
	@Autowired
	private recommendDTO recommenddto = null;
	@Autowired
	private SqlSessionTemplate dao =null;
	

	
		@RequestMapping("recommend.do")
		public String recommend(Model model, HttpServletRequest request){

			int count = 0;	
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
			
			System.out.println("search = "+search);
			int count = 0;	
			List recommendCount = null;
			List recommendList = null;
			List homeNo = new ArrayList();
			count = dao.selectOne("home.homecount");
			if (count > 0) {
				recommendCount = dao.selectList("recommend.top10");
			
				recommendList = dao.selectList("recommend.mybook_2030");
				
			}
			for(int i = 0; i < recommendList.size(); i ++){
				recommenddto =  (recommendDTO) recommendList.get(i);				
				homeNo.add(recommenddto.getHOME_NO());
				}
			TreeSet<String> homeNo2 = new TreeSet<String>(homeNo);
			System.out.println(homeNo2);

			model.addAttribute("count", count);			
			model.addAttribute("recommendCount", recommendCount);
			model.addAttribute("homeNo2", homeNo2); 

			return "/map/recommend.jsp"; 
		}
	
}
