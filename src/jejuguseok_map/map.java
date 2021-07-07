package jejuguseok_map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//http://localhost:8080/jejuguseok/index.do
@Controller
public class map {
	
	@Autowired //컨트롤에서 생성한 객체 받기
	private mapDTO mapdto = null;
	
	@RequestMapping("map.do")
	public String map() {
		System.out.println("mapdto--"+mapdto.getX());
		System.out.println("mapdto--"+mapdto.getPlace());
		
		return "/WEB-INF/view/userpage/map.jsp";
	}

}
