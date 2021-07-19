package jejuguseok_map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/* 정현서 work. 
 * 
 * 숙소 Bean: 유형/지역별 분류 
 * 1 유형: 모텔, 게스트하우스, 펜션, 호텔
 * 2 지역: 제주시, 서귀포시, 중문, 제주국제공항, 애월/한림/협재, 표선/상산, 함덕/김녕/세화
 */
@Controller
public class accomBean {
	
	@Autowired
	private SqlSessionTemplate dao =null;
	
	
	@RequestMapping("accom.do")
	public String accom(Model model){
		
		List list3 = dao.selectList("item.myHome");
		 
		 model.addAttribute("list3",list3);
		
		return "/userpage/home/accom.jsp"; 
	}
	
	
	@RequestMapping("accomLocal.do")
	public String accomLocal(Model model, HttpServletRequest request){
		
		int se= Integer.parseInt(request.getParameter("search"));
		
		// 1 2 3 4 중 하나의 값을 받아 대입.
		String search="제주시";
		if(se == 2){
			search="서귀포시";
		}else if(se==3){
			search="중문";
		}else if(se==4){
			search="제주국제공항";
		}else if(se==5){
			search="애월/한림/협재";
		}else if(se==6){
			search="표선/상산";
		}else if(se==7){
			search="함덕/김녕/세화";
		}
		
		return "/userpage/home/accomLocal.jsp"; 
	}
	
	
	
	
}
