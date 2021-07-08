package jejuguseok_map;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*http:/localhost:8080/jejuguseok/history.do
 * 관광지 Bean: 역사문화, 자연경치, 레저체험학습, 휴식힐링
 */
@Controller
public class attrctionBean {

	@Autowired
//	1. 관광지: 역사문화
	@RequestMapping("history.do")
	public String history() {

		return "/WEB-INF/view/userpage/attraction/history.jsp";
	}

//	2. 관광지: 자연경치
	@RequestMapping("nature.do")
	public String nature() {

		return "userpage/attraction/nature.jsp";
	}

//	3. 관광지: 레저체험학습
	@RequestMapping("leisure.do")
	public String leisure() {

		return "/userpage/attraction/leisure.jsp";
	}

//	4. 관광지: 휴식힐링
	@RequestMapping("healing.do")
	public String healing() {

		return "/WEB-INF/view/userpage/attraction/healing.jsp";
	}

}
