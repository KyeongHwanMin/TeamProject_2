package jejuguseok.map;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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
	private scheduleDTO myscheduledto = null;
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
	@RequestMapping("schedule_table.do")
	public String schedule(String pageNum,Model model) {
			int pageSize = 10;
			if(pageNum == null) {
				pageNum ="1";
			}
			
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage - 1) * pageSize +1;
			int endRow = currentPage * pageSize;
			int count = 0;
			int number = 0;
			
			List articleList = null;
			HashMap Row = new HashMap();
			Row.put("startRow", startRow);
			Row.put("endRow", endRow);
			System.out.println("Row"+Row);
			count = dao.selectOne("schedule.getArticleCount"); 
			if(count > 0) {
				articleList = dao.selectList("schedule.getArticles",Row);
			}
			number=count-(currentPage-1)*pageSize;
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startRow", startRow);
			model.addAttribute("endRow", endRow);
			model.addAttribute("count", count);
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("number", number);
			model.addAttribute("articleList", articleList);
			model.addAttribute("pageNum", pageNum);
			
		return "/map/schedule_table.jsp";
	}
	@RequestMapping("schedule_table_content.do")
	public String content(int num1, int pageNum,Model model) {
		  
		//String id = (String) session.getAttribute("user_id");
		
		scheduledto=dao.selectOne("schedule.mylocation",num1);		
		model.addAttribute("scheduledto", scheduledto);		
		
		myscheduledto = dao.selectOne("schedule.mylocation",num1);
		
		if(myscheduledto.getC_y1() !=null) {List<String> y_list1 = Arrays.asList(myscheduledto.getC_y1().split(","));
		model.addAttribute("y_list1",y_list1);}
		if(myscheduledto.getC_x1() !=null) {List<String> x_list1 = Arrays.asList(myscheduledto.getC_x1().split(","));
		model.addAttribute("x_list1",x_list1);}
		if(myscheduledto.getC_y2() !=null) {List<String> y_list2 = Arrays.asList(myscheduledto.getC_y2().split(","));
		model.addAttribute("y_list2",y_list2);}
		if(myscheduledto.getC_x2() !=null) {List<String> x_list2 = Arrays.asList(myscheduledto.getC_x2().split(","));
		model.addAttribute("x_list2",x_list2);}
		if(myscheduledto.getC_y3() !=null) {List<String> y_list3 = Arrays.asList(myscheduledto.getC_y3().split(","));
		model.addAttribute("y_list3",y_list3);}
		if(myscheduledto.getC_x3() !=null) {List<String> x_list3 = Arrays.asList(myscheduledto.getC_x3().split(","));
		model.addAttribute("x_list3",x_list3);}
		if(myscheduledto.getC_y4() !=null) {List<String> y_list4 = Arrays.asList(myscheduledto.getC_y4().split(","));
		model.addAttribute("y_list4",y_list4);}
		if(myscheduledto.getC_x4() !=null) {List<String> x_list4 = Arrays.asList(myscheduledto.getC_x4().split(","));
		model.addAttribute("x_list4",x_list4);}
		if(myscheduledto.getC_y5() !=null) {List<String> y_list5 = Arrays.asList(myscheduledto.getC_y5().split(","));
		model.addAttribute("y_list5",y_list5);}
		if(myscheduledto.getC_x5() !=null) {List<String> x_list5 = Arrays.asList(myscheduledto.getC_x5().split(","));
		model.addAttribute("x_list5",x_list5);}
		if(myscheduledto.getC_y6() !=null) {List<String> y_list6 = Arrays.asList(myscheduledto.getC_y6().split(","));
		model.addAttribute("y_list6",y_list6);}
		if(myscheduledto.getC_x6() !=null) {List<String> x_list6 = Arrays.asList(myscheduledto.getC_x6().split(","));
		model.addAttribute("x_list6",x_list6);}
		
		
		
		
			model.addAttribute("myscheduledto",myscheduledto);
		  
		  
		
	
		return "/map/schedule_table_content.jsp";
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
			String c_context4,String c_context5,String c_context6,String c_time1,String c_time2,String c_time3,String c_time4,String c_time5,String c_time6,
			String c_y1,String c_x1,String c_y2,String c_x2,String c_y3,String c_x3,String c_y4,String c_x4,String c_y5,String c_x5,String c_y6,String c_x6,
			Model model,HttpSession session) {		
		
		
		if(c_place1 != null) {
		scheduledto.setC_place1(c_place1);
		scheduledto.setC_context1(c_context1);
		scheduledto.setC_time1(c_time1);	
		scheduledto.setC_y1(c_y1);
		scheduledto.setC_x1(c_x1);
		dao.insert("schedule.insertsc" ,scheduledto);
		}if(c_place2 != null) {	
		scheduledto.setC_place2(c_place2);
		scheduledto.setC_context2(c_context2);
		scheduledto.setC_time2(c_time2);	
		scheduledto.setC_y2(c_y2);
		scheduledto.setC_x2(c_x2);		
		dao.update("schedule.updatesc2",scheduledto);
		}if(c_place3 != null) {
		scheduledto.setC_place3(c_place3);
		scheduledto.setC_context3(c_context3);
		scheduledto.setC_time3(c_time3);
		scheduledto.setC_y3(c_y3);
		scheduledto.setC_x3(c_x3);	
		dao.update("schedule.updatesc3",scheduledto);
		}if(c_place4 != null) {
		scheduledto.setC_place4(c_place4);
		scheduledto.setC_context4(c_context4);
		scheduledto.setC_time4(c_time4);
		scheduledto.setC_y4(c_y4);
		scheduledto.setC_x4(c_x4);
		dao.update("schedule.updatesc4",scheduledto);
		}if(c_place5 != null) {
		scheduledto.setC_place5(c_place5);
		scheduledto.setC_context5(c_context5);
		scheduledto.setC_time5(c_time5);
		scheduledto.setC_y5(c_y5);
		scheduledto.setC_x5(c_x5);
		dao.update("schedule.updatesc5",scheduledto);
		}if(c_place6 != null) {
			scheduledto.setC_place6(c_place6);
			scheduledto.setC_context6(c_context6);
			scheduledto.setC_time6(c_time6);
			scheduledto.setC_y6(c_y6);
			scheduledto.setC_x6(c_x6);
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
