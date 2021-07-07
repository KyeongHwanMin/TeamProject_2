package jejuguseok_map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//http://localhost:8080/jejuguseok/form.do
@Controller
public class map {
	
	@Autowired //컨트롤에서 생성한 객체 받기
	private mapDTO mapdto = null;
	
	@RequestMapping("map.do")
	public String map() {
		//System.out.println("mapdto--"+mapdto.getX());
		//System.out.println("mapdto--"+mapdto.getPlace());
		
		return "/WEB-INF/view/map/map.jsp";
	}
	
	@RequestMapping("mapPro.do")
	public String map2(String name, int age, mapDTO mapdto, HttpServletRequest request) {
		System.out.println(name);
		System.out.println(age);
		System.out.println(mapdto.getX());
		System.out.println(request.getParameter("id"));
		
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		return "/WEB-INF/view/map/map2.jsp";
	}
	
	@RequestMapping("main.do")
	public String main() {
		System.out.println("main()");
		return "/WEB-INF/view/map/form.jsp";
	}
	@RequestMapping("formPro.do")
	public String pro(String name, int age, HttpServletRequest request) {
		System.out.println(name);
		System.out.println(age);
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		return "/WEB-INF/view/map/formPro.jsp";
	}

}
