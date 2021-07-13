package jejuguseok.map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//http://localhost:8080/jejuguseok/main.do

// 컨트롤러에서 보낸걸 받아줌
@Controller
public class map {

	// 컨트롤에서 생성한 객체 받기
	@Autowired
	private mapDTO mapdto = null;
	@Autowired
	private mapDAO mapdao = null;
	@Autowired
	private SqlSessionTemplate dao = null;

	// LOTAION db에 있는 place 정보 가져오는 메서드
	@RequestMapping("mybatis/place.do")
	public String place(Model model) {

		List maplist = dao.selectList("map.location");

		model.addAttribute("maplist", maplist);
		System.out.println(maplist);
		return "/map/maptest.jsp";
	}

	@RequestMapping("xy.do")
	public String x(Model model) {

		List maplist = dao.selectList("map.location");

		model.addAttribute("maplist", maplist);
		System.out.print(maplist);
		System.out.println("실행");

		return "/map/maptest.jsp";
	}

	@RequestMapping("map.do")
	public String map(Model model) {
		
		List maplist = dao.selectList("map.location");
		List maptourlist = dao.selectList("map.tour");
		model.addAttribute("maplist", maplist);
		model.addAttribute("maptourlist", maptourlist);
		return "/map/map.jsp";
	}
	@RequestMapping("map/schedule.do")
	public String schedule(Model model) {
			
		return "/map/schedule.jsp";
	}
	@RequestMapping("map/schedule_pro.do")
	public String schedule_pro(Model model) {
			
		return "/map/schedule_pro.jsp";
	}

	@RequestMapping("mapPro.do")
	public String map2(String name, int age, mapDTO mapdto, HttpServletRequest request) {
		System.out.println(name);
		System.out.println(age);
		System.out.println(mapdto.getX());
		System.out.println(request.getParameter("id"));

		String id = request.getParameter("id");
		request.setAttribute("id", id);
		return "/map/map2.jsp";
	}

	@RequestMapping("main.do")
	public String main() {
		System.out.println("main()");
		return "/map/form.jsp";
	}

	@RequestMapping("formPro.do")
	public String pro(String name, int age, Model model) {
		System.out.println(name);
		System.out.println(age);
		model.addAttribute("name", name);
		return "/map/formPro.jsp";
	}

}
