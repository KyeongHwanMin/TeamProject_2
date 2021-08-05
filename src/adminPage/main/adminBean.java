package adminPage.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import adminPage.board.otoAdDAO;
import userpage.board.otoDAO;


@Controller  
public class adminBean {

	@Autowired
	private SqlSessionTemplate daosql =null;
	@Autowired
	private otoAdDAO otoAdDAO = null;
	@Autowired
	private HomeDTO homedto = null;
	
	//���� ���� ������ 
	//������ ��Ʈ 
	// ���� ����Ʈ
	@RequestMapping("adminpage/index.do") 
	public String adminIndex(Model model){
		
		//������Ʈ - ���� ���� 
		int alone = daosql.selectOne("admin.alone");
		model.addAttribute("alone", alone);
		int couple = daosql.selectOne("admin.couple");
		model.addAttribute("couple", couple);
		int fam = daosql.selectOne("admin.family");
		model.addAttribute("fam", fam);
		int over2 = daosql.selectOne("admin.over2");
		model.addAttribute("over2", over2);
		int over5 = daosql.selectOne("admin.over5");
		model.addAttribute("over5", over5);
		
		List list2 = daosql.selectList("admin.all");
		 model.addAttribute("list2",list2);
		
		// 1:1문의 확인 안한 게시글 카운팅
		int count = daosql.selectOne("admin.boardcount");
		model.addAttribute("count",count);
		
		// 회원 연령별 통계
		int to1020 = daosql.selectOne("admin.to1020");
		model.addAttribute("to1020",to1020);
		int to2030 = daosql.selectOne("admin.to2030");
		model.addAttribute("to2030",to2030);
		int to3040 = daosql.selectOne("admin.to3040");
		model.addAttribute("to3040",to3040);
		int to4050 = daosql.selectOne("admin.to4050");
		model.addAttribute("to4050",to4050);
		int to50 = daosql.selectOne("admin.to50");
		model.addAttribute("to50",to50);
		
		
		return "/adminpage/index.jsp";
	}
	
	

	@RequestMapping("adminpage/userManage.do") 
	public String userManage(Model model){
		
		 List list2 = daosql.selectList("admin.all");
		
		 model.addAttribute("list2",list2);
		
		return "/adminpage/userManage.jsp";
	}
	
	@RequestMapping("chartPage.do") 
	public String chartPage(){
		
		return "/adminpage/chartPage.jsp";
	}
	// 숙소 차트
	@RequestMapping("adminpage/HomeChart.do") 
	public String HomeChart(Model model){
		List list_1 =new ArrayList();
		List list_2 =new ArrayList();
		List list_3 =new ArrayList();
		List list_4 =new ArrayList();
		List travel_list = daosql.selectList("admin.category");
		//List travel_list_30 = daosql.selectList("admin.travel_30");
		//List travel_list_40 = daosql.selectList("admin.travel_40");
		//List travel_list_50 = daosql.selectList("admin.travel_50");

			list_1.add(travel_list.get(0));
			list_1.add(travel_list.get(1));
			homedto = (HomeDTO) list_1.get(0);
			System.out.println(homedto.getTravel());
			System.out.println(homedto.getCount());
			
			
			
			
	
		
		model.addAttribute("travel_list",travel_list);
		//model.addAttribute("travel_list_30",travel_list_30);
		//model.addAttribute("travel_list_40",travel_list_40);
	  // model.addAttribute("travel_list_50",travel_list_50);
		return "/adminpage/Homechart.jsp";
	}

	

	//-- 회원 삭제 
	@RequestMapping("adminpage/memberDelete.do")
	public String homeDelete(HttpServletRequest request, Model model) {
	        
		String user_id = request.getParameter("user_id");
		model.addAttribute("user_id", user_id);
	      
		return "/adminpage/memberDelete.jsp"; 
	}
	   
	   
	@RequestMapping("adminpage/memberDeletePro.do")
	public String homeDeletePro(HttpServletRequest request, Model model) {
	         
		String user_id = request.getParameter("user_id");
		daosql.delete("admin.memberDelete", user_id);
	      
		return "/adminpage/memberDeletePro.jsp"; 
	}
	

}
