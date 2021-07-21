package jejuguseok.map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//http://localhost:8080/jejuguseok/main.do
import org.springframework.web.bind.annotation.ResponseBody;



// 컨트롤러에서 보낸걸 받아줌
@Controller
public class map {

	// 컨트롤에서 생성한 객체 받기
	@Autowired
	private mapDTO mapdto = null;
	@Autowired
	private mapDAO mapdao = null;
	@Autowired
	private scheduleDTO scheduleDTO = null;
	@Autowired
	private SqlSessionTemplate dao = null;



	@RequestMapping("map.do")
	public String map(Model model , HttpSession session) {
		
		List maplist = dao.selectList("map.location");
		List maptourlist = dao.selectList("map.tour");
		model.addAttribute("maplist", maplist);
		model.addAttribute("maptourlist", maptourlist);
		String id = (String) session.getAttribute("user_id");
		System.out.println("id0 "+id);
		return "/map/map.jsp";
	}
	@RequestMapping("schedule.do")
	public String schedule(Model model) {
			
		return "/map/schedule.jsp";
	}
	@RequestMapping("schedule_pro.do")
	public String schedule_pro(HttpSession session, String date, String day, String with, String travel, Model model) {
		List maplist = dao.selectList("map.location");
		List maptourlist = dao.selectList("map.tour");
		model.addAttribute("maplist", maplist);
		model.addAttribute("maptourlist", maptourlist);
		
		String id = (String) session.getAttribute("user_id");
		System.out.println("id1 "+id);
		session.setAttribute("id", id);
		
		model.addAttribute("date",date);
		model.addAttribute("day",day);
		model.addAttribute("with",with);
		model.addAttribute("travel",travel);
		
		scheduleDTO scheduledto = new scheduleDTO();
		scheduledto.setDate1(date);
		scheduledto.setDay1(day);
		scheduledto.setId(id);
		scheduledto.setWith1(with);
		scheduledto.setTravel(travel);
		System.out.println(date);
		System.out.println(day);
		System.out.println("id "+id);
		System.out.println(with);
		System.out.println(travel);
		dao.insert("schedule.insertsc" ,scheduledto);
		return "/map/schedule_pro.jsp";
	}
	@RequestMapping("sccedule_card.do")
	public String schedule_card(String c_place1,String c_place2,String c_place3,String c_place4,String h_place1,String h_context1,String h_place2,String h_context2,String h_place3,String h_context3,
			String h_place4,String h_context4,String h_place5,String h_context5,String h_place6,String h_context6,HttpServletRequest request , Model model) {
		System.out.println("c_place1=="+c_place1);
		System.out.println("c_place2=="+c_place2);
		System.out.println("c_place4=="+c_place3);
		System.out.println("c_place3=="+c_place4);
		
		/*
		System.out.println("h_place1"+h_place1);
		System.out.println("h_context1"+h_context1);
		System.out.println("h_place2"+h_place2);
		System.out.println("h_context2"+h_context2);
		System.out.println("h_place3"+h_place3);
		System.out.println("h_context3"+h_context3);
		System.out.println("h_place4"+h_place4);
		System.out.println("h_context4"+h_context4);
		System.out.println("h_place5"+h_place5);
		System.out.println("h_context5"+h_context5);
		System.out.println("h_place6"+h_place6);
		System.out.println("h_context6"+h_context6);*/
		
		return "/map/schedule2.jsp";
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
	




}
