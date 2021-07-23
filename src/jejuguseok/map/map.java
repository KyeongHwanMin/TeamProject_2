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
	private scheduleDTO scheduledto = null;
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
	public String schedule_pro(HttpSession session,String subject, String date, String day, String with, String travel, Model model) {
		List maplist = dao.selectList("map.location");
		List maptourlist = dao.selectList("map.tour");
		model.addAttribute("maplist", maplist);
		model.addAttribute("maptourlist", maptourlist);
		
		String id = (String) session.getAttribute("user_id");
		System.out.println("id1 "+id);
		
		model.addAttribute("subject",subject);
		model.addAttribute("date",date);
		model.addAttribute("day",day);
		model.addAttribute("with",with);
		model.addAttribute("travel",travel);
		
		scheduledto.setSubject(subject);
		scheduledto.setDate1(date);
		scheduledto.setDay1(day);
		scheduledto.setId(id);
		scheduledto.setWith1(with);
		scheduledto.setTravel(travel);
		
		//dao.insert("schedule.insertsc" ,scheduledto);
		return "/map/schedule_pro.jsp";
	}
	@RequestMapping("sccedule_card.do")
	public String schedule_card(String c_place1,String c_place2,String c_place3,String c_place4,String c_place5,String c_place6,String c_context1,String c_context2,String c_context3,
			String c_context4,String c_context5,String c_context6,String c_time1,String c_time2,String c_time3,String c_time4,String c_time5,String c_time6,Model model,HttpSession session) {		
		
		//String id = (String) session.getAttribute("user_id");
		
		if(c_place1 != null) {
		scheduledto.setC_place1(c_place1);
		scheduledto.setC_context1(c_context1);
		scheduledto.setC_time1(c_time1);		
		dao.insert("schedule.insertsc" ,scheduledto);
		}if(c_place2 != null) {	
		scheduledto.setC_place2(c_place2);
		scheduledto.setC_context2(c_context2);
		scheduledto.setC_time2(c_time2);
		dao.update("schedule.updatesc2",scheduledto);
		}if(c_place3 != null) {
		scheduledto.setC_place3(c_place3);
		scheduledto.setC_context3(c_context3);
		scheduledto.setC_time3(c_time3);
		dao.update("schedule.updatesc3",scheduledto);
		}if(c_place4 != null) {
		scheduledto.setC_place4(c_place4);
		scheduledto.setC_context4(c_context4);
		scheduledto.setC_time4(c_time4);
		dao.update("schedule.updatesc4",scheduledto);
		}if(c_place5 != null) {
		scheduledto.setC_place5(c_place5);
		scheduledto.setC_context5(c_context5);
		scheduledto.setC_time5(c_time5);
		dao.update("schedule.updatesc5",scheduledto);
		}if(c_place6 != null) {
			scheduledto.setC_place6(c_place6);
			scheduledto.setC_context6(c_context6);
			scheduledto.setC_time6(c_time6);
			dao.update("schedule.updatesc6",scheduledto);
		}
	
		return "";
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
