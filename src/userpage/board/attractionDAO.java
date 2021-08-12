package userpage.board;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jejuguseok.map.recommendDTO;
import jejuguseok_map.attBkDTO;
import jejuguseok_map.locationDTO;

@Controller
public class attractionDAO {
	@Autowired
	private locationDTO attDTO = null;
	@Autowired
	private attractionDAO attDAO = null;
	@Autowired
	private SqlSessionTemplate dao = null;
	
	// 관광지 연령별 전체 리스트 보기
	@RequestMapping("atttoplist.do")
	public String recommend(Model model, HttpServletRequest request){
		
		
		
		int count = 0;	
		List attCount = null;
		List attList = null;
		List attNo = new ArrayList();
		
		count = dao.selectOne("item.locationcount");
		if (count > 0) {
			attCount = dao.selectList("attlist.top10");
		}		
		
		model.addAttribute("count", count);			
		model.addAttribute("attCount", attCount);


		return "/userpage/attraction/toplist.jsp"; 
	}
	
	// 관광지 연령별 TOP10 나이 비교 보기
	@RequestMapping("atttoplistsearch.do")
	public String recommendsearch(Model model, HttpServletRequest request){
		
		int search = Integer.parseInt(request.getParameter("search"));
		

		int count = 0;	
		List attCount = null;
		List attList = null;
		List attNo = new ArrayList();
		
		count = dao.selectOne("att.attcount");
		
		if (count > 0) {
			attCount = dao.selectList("attlist.top10");
			if(search == 1) {
				attCount = dao.selectList("attlist.to20");
			}else if(search == 2) {
				attCount = dao.selectList("attlist.to30");
			}else if(search == 3) {
				attCount = dao.selectList("attlist.to40");
			}else if(search == 4) {
				attCount = dao.selectList("attlist.to50");
			}
		}
		
		model.addAttribute("count", count);			
		model.addAttribute("attCount", attCount);

		return "/userpage/attraction/toplist.jsp"; 
	}
}
