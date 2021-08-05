package adminPage.main;

import java.util.ArrayList;
import java.util.List;

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
		// 카테고리별 순위
		List history_list = daosql.selectList("admin.category_history");
		List nature_list = daosql.selectList("admin.category_nature");
		List leisurel_list = daosql.selectList("admin.category_leisure");
		List healing_list = daosql.selectList("admin.category_healing");
		// 연령대별 카테고리 순위
		List list_20 = daosql.selectList("admin.travel_20");
		List list_30 = daosql.selectList("admin.travel_30");
		List list_40 = daosql.selectList("admin.travel_40");
		List list_50 = daosql.selectList("admin.travel_50");
		

	   model.addAttribute("history_list",history_list);
	   model.addAttribute("nature_list",nature_list);
	   model.addAttribute("leisurel_list",leisurel_list);
	   model.addAttribute("healing_list",healing_list);
	   model.addAttribute("list_20",list_20);
	   model.addAttribute("list_30",list_30);
	   model.addAttribute("list_40",list_40);
	   model.addAttribute("list_50",list_50);
		return "/adminpage/Homechart.jsp";
	}


}
