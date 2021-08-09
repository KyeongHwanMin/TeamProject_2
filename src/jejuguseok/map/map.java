package jejuguseok.map;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
//http://localhost:8080/jejuguseok/main.do
import org.springframework.web.bind.annotation.ResponseBody;
/*
 *  http://localhost:8080/jejuguseok/map.do
 *  맵 DAO
 *  	- map() : 일정만들기 _기본 정보 입력, 카테고리 별로 지도 출력 
 * 		- schedule_pro() : 일정만들기_자세한 정보 입력/저장, 찜목록, 지도 출력 
 * 		- schedule_card() : 해당 일정내용 저장
 *		- schedule() : 스케쥴 표 출력
 *		- delete() : 스케쥴 삭제
 *		- content() : 해당 내용의 여행 정보 지도로 출력
 *		- schedule_fix() : 여행일정 수정
 */

@Controller
public class map {


	@Autowired
	private scheduleDTO myscheduledto = null;
	@Autowired
	private scheduleDTO scheduledto = null;
	@Autowired
	private SqlSessionTemplate dao = null;


	@RequestMapping("mtest.do")
	public String mapt(Model model , HttpSession session) {		
	
		return "/map/mtest.jsp";
	}
	@RequestMapping("map.do")
	public String map(Model model , HttpSession session) {		
		List maplist = dao.selectList("map.location");
		List maptourlist = dao.selectList("map.tour");
		List maphomelist = dao.selectList("map.home");
		model.addAttribute("maplist", maplist);
		model.addAttribute("maptourlist", maptourlist);
		model.addAttribute("maphomelist", maphomelist);
		String id = (String) session.getAttribute("user_id");
		System.out.println("id0 "+id);
		return "/map/map.jsp";
	}
	@RequestMapping("map1.do")
	public String map1(Model model , HttpSession session) {		
		List maplist = dao.selectList("map.location");
		List maptourlist = dao.selectList("map.tour");
		List maphomelist = dao.selectList("map.home");
		model.addAttribute("maplist", maplist);
		model.addAttribute("maptourlist", maptourlist);
		model.addAttribute("maphomelist", maphomelist);
		String id = (String) session.getAttribute("user_id");
		List mylist = dao.selectList("recommend.mine_home",id);
		List mylist_t = dao.selectList("recommend.mine_travel",id);	


	
		model.addAttribute("mylist",mylist);
		model.addAttribute("mylist_t",mylist_t);
		System.out.println("id0 "+id);
		return "/map/map1.jsp";
	}
	@RequestMapping("schedule_pro.do")
	public String schedule_pro(HttpSession session,String subject, String date, String day, String with, String travel, Model model) {
		String id = (String) session.getAttribute("user_id");
		
		List maplist = dao.selectList("map.location");
		List maptourlist = dao.selectList("map.tour");
		List maphomelist = dao.selectList("map.home");		
		List mylist = dao.selectList("recommend.mine_home",id);
		List mylist_t = dao.selectList("recommend.mine_travel",id);
		
		model.addAttribute("mylist",mylist);
		model.addAttribute("mylist_t",mylist_t);
		model.addAttribute("maplist", maplist);
		model.addAttribute("maptourlist", maptourlist);
		model.addAttribute("maphomelist", maphomelist);
		
		
		
		
		model.addAttribute("subject",subject);
		model.addAttribute("date",date);
		model.addAttribute("day",day);
		model.addAttribute("with",with);
		model.addAttribute("travel",travel);
		
		scheduledto.setSubject(subject);
		scheduledto.setDate1(date);
		scheduledto.setDay1(day);
		scheduledto.setUser_id(id);
		scheduledto.setWith1(with);
		scheduledto.setTravel(travel);
		
		
		
		//dao.insert("schedule.insertsc" ,scheduledto);
		return "/map/schedule_pro.jsp";
	}
	
	@RequestMapping("schedule_table.do")
	public String schedule(String pageNum,Model model, HttpSession session) {
			int pageSize = 30;
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
	public String content(int num1, int pageNum,Model model,HttpSession session) {
		  
		String id = (String) session.getAttribute("user_id");
		
		scheduledto=dao.selectOne("schedule.mylocation",num1);		
		model.addAttribute("scheduledto", scheduledto);		
		myscheduledto = dao.selectOne("schedule.mylocation",num1);
		model.addAttribute("myscheduledto",myscheduledto);
		List mylist = dao.selectList("recommend.mine_home",id);
		List mylist_t = dao.selectList("recommend.mine_travel",id);			

		model.addAttribute("mylist",mylist);
		model.addAttribute("mylist_t",mylist_t);
	
		//나의 일정 항목들 리스트로 저장
		if(myscheduledto.getC_place1() != null){List<String> place1 = Arrays.asList(myscheduledto.getC_place1().split(","));
		model.addAttribute("place1",place1);}
		if(myscheduledto.getC_time1() != null){List<String> time1 = Arrays.asList(myscheduledto.getC_time1().split(","));
		model.addAttribute("time1",time1);}	
		if(myscheduledto.getC_context1() != null){List<String> context1 = Arrays.asList(myscheduledto.getC_context1().split(","));
		model.addAttribute("context1",context1);}
		if(myscheduledto.getC_y1() !=null) {List<String> y_list1 = Arrays.asList(myscheduledto.getC_y1().split(","));
		model.addAttribute("y_list1",y_list1);}
		if(myscheduledto.getC_x1() !=null) {List<String> x_list1 = Arrays.asList(myscheduledto.getC_x1().split(","));
		model.addAttribute("x_list1",x_list1);}
		if(myscheduledto.getC_place2() != null){List<String> place2 = Arrays.asList(myscheduledto.getC_place2().split(","));
		model.addAttribute("place2",place2);}
		if(myscheduledto.getC_time2() != null){List<String> time2 = Arrays.asList(myscheduledto.getC_time2().split(","));
		model.addAttribute("time2",time2);}	
		if(myscheduledto.getC_context2() != null){List<String> context2 = Arrays.asList(myscheduledto.getC_context2().split(","));
		model.addAttribute("context2",context2);}
		if(myscheduledto.getC_y2() !=null) {List<String> y_list2 = Arrays.asList(myscheduledto.getC_y2().split(","));
		model.addAttribute("y_list2",y_list2);}
		if(myscheduledto.getC_x2() !=null) {List<String> x_list2 = Arrays.asList(myscheduledto.getC_x2().split(","));
		model.addAttribute("x_list2",x_list2);}
		if(myscheduledto.getC_place3() != null){List<String> place3 = Arrays.asList(myscheduledto.getC_place3().split(","));
		model.addAttribute("place3",place3);}	
		if(myscheduledto.getC_time3() != null){List<String> time3 = Arrays.asList(myscheduledto.getC_time3().split(","));
		model.addAttribute("time3",time3);}	
		if(myscheduledto.getC_context3() != null){List<String> context3 = Arrays.asList(myscheduledto.getC_context3().split(","));
		model.addAttribute("context3",context3);}
		if(myscheduledto.getC_y3() !=null) {List<String> y_list3 = Arrays.asList(myscheduledto.getC_y3().split(","));
		model.addAttribute("y_list3",y_list3);}
		if(myscheduledto.getC_x3() !=null) {List<String> x_list3 = Arrays.asList(myscheduledto.getC_x3().split(","));
		model.addAttribute("x_list3",x_list3);}
		if(myscheduledto.getC_place4() != null){List<String> place4 = Arrays.asList(myscheduledto.getC_place4().split(","));
		model.addAttribute("place4",place4);}	
		if(myscheduledto.getC_time4() != null){List<String> time4 = Arrays.asList(myscheduledto.getC_time4().split(","));
		model.addAttribute("time4",time4);}	
		if(myscheduledto.getC_context4() != null){List<String> context4 = Arrays.asList(myscheduledto.getC_context4().split(","));
		model.addAttribute("context4",context4);}
		if(myscheduledto.getC_y4() !=null) {List<String> y_list4 = Arrays.asList(myscheduledto.getC_y4().split(","));
		model.addAttribute("y_list4",y_list4);}
		if(myscheduledto.getC_x4() !=null) {List<String> x_list4 = Arrays.asList(myscheduledto.getC_x4().split(","));
		model.addAttribute("x_list4",x_list4);}
		if(myscheduledto.getC_place5() != null){List<String> place5 = Arrays.asList(myscheduledto.getC_place5().split(","));
		model.addAttribute("place5",place5);}	
		if(myscheduledto.getC_time5() != null){List<String> time5 = Arrays.asList(myscheduledto.getC_time5().split(","));
		model.addAttribute("time5",time5);}	
		if(myscheduledto.getC_context5() != null){List<String> context5 = Arrays.asList(myscheduledto.getC_context5().split(","));
		model.addAttribute("context5",context5);}
		if(myscheduledto.getC_y5() !=null) {List<String> y_list5 = Arrays.asList(myscheduledto.getC_y5().split(","));
		model.addAttribute("y_list5",y_list5);}
		if(myscheduledto.getC_x5() !=null) {List<String> x_list5 = Arrays.asList(myscheduledto.getC_x5().split(","));
		model.addAttribute("x_list5",x_list5);}
		if(myscheduledto.getC_place6() != null){List<String> place6 = Arrays.asList(myscheduledto.getC_place6().split(","));
		model.addAttribute("place6",place6);}	
		if(myscheduledto.getC_time6() != null){List<String> time6 = Arrays.asList(myscheduledto.getC_time6().split(","));
		model.addAttribute("time6",time6);}	
		if(myscheduledto.getC_context6() != null){List<String> context6 = Arrays.asList(myscheduledto.getC_context6().split(","));
		model.addAttribute("context6",context6);}
		if(myscheduledto.getC_y6() !=null) {List<String> y_list6 = Arrays.asList(myscheduledto.getC_y6().split(","));
		model.addAttribute("y_list6",y_list6);}
		if(myscheduledto.getC_x6() !=null) {List<String> x_list6 = Arrays.asList(myscheduledto.getC_x6().split(","));
		model.addAttribute("x_list6",x_list6);}
		
		return "/map/schedule_table_content.jsp";
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
		@RequestMapping("sccedule_fix.do")
		public String schedule_fix(String c_place1,String c_place2,String c_place3,String c_place4,String c_place5,String c_place6,String c_context1,String c_context2,String c_context3,
				String c_context4,String c_context5,String c_context6,String c_time1,String c_time2,String c_time3,String c_time4,String c_time5,String c_time6,
				String c_y1,String c_x1,String c_y2,String c_x2,String c_y3,String c_x3,String c_y4,String c_x4,String c_y5,String c_x5,String c_y6,String c_x6,
				Model model,HttpSession session) {		

			if(c_place1 != null) {
			scheduledto.setC_place1(c_place1);
			scheduledto.setC_context1(c_context1);
			scheduledto.setC_time1(c_time1);	
			scheduledto.setC_y1(c_y1);
			scheduledto.setC_x1(c_x1);		
			System.out.println("subject"+scheduledto.getSubject());
			dao.update("schedule.updatesc",scheduledto);
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
	@RequestMapping("sccedule_card_delete.do")
	public String delete(String number, String date, String day,String subject,  String user_id,HttpServletRequest request) {
		
		
		System.out.println("subject="+subject);

		return "";
	}
	 //정현서의 스케줄 삭제  -----------
	   @RequestMapping("schedule_card_delete.do")
	   public String delete(int num1, int pageNum,Model model) {
	      
	      
	      System.out.println("넘 111="+num1);
	      System.out.println("pageNum11="+pageNum);
	      
	      //delete from schedule where num1 ='40';
	      dao.selectOne("schedule.deleteSche", num1);
	      
	      return "/map/schedule_card_delete.jsp";
	   }
	
		
}
