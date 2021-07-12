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
	
	//컨트롤에서 생성한 객체 받기
	@Autowired 
	//private mapDTO mapdto = null;
	@Autowired
	private mapDAO mapdao = null;
	@Autowired
	private SqlSessionTemplate dao = null;
	

	// LOTAION db에 있는 place 정보 가져오는 메서드
	@RequestMapping("mybatis/place.do")
	public String place(Model model) {
		
		List list = dao.selectList("map.place");
		
		model.addAttribute("list",list);
		System.out.println(list);
		return "/map/maptest.jsp";
	}
	@RequestMapping("mybatis/xy.do")
	public String x(Model model) {
		
		List xy_list = dao.selectList("map.xy");
		
		model.addAttribute("xy_list",xy_list);
		System.out.print(xy_list);
		
		return "/map/maptest.jsp";
	}

	
	@RequestMapping("map.do") 
	public String map() {
		//System.out.println("mapdto--"+mapdto.getX());
		//System.out.println("mapdto--"+mapdto.getPlace());
		
		return "/map/map.jsp";
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
		model.addAttribute("name",name);
		return "/map/formPro.jsp";
	}
	


}
