package jejuguseok_map;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 숙소 Bean: 유형/지역별 분류 
 * 1 유형: 모텔, 게스트하우스, 펜션, 호텔
 * 2 지역: 제주시, 서귀포시, 중문, 제주국제공항, 애월/한림/협재, 표선/상산, 함덕/김녕/세화
 */
@Controller
public class homeBean {

	@Autowired
	
//	숙소 검색 
	@RequestMapping("search.do")
	public String search() {

		return "/WEB-INF/view//userpage/home/search.jsp";
	}	


}
