package adminPage.main;

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
	
	//어드민 메인 페이지 
	//간단한 차트 
	// 유저 리스트
	@RequestMapping("adminpage/index.do") 
	public String adminIndex(Model model){
		
		//파이차트 - 동행 유형 
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
		
		// 1:1문의 확인하지 않은 문의 수 카운트
		int count = daosql.selectOne("admin.boardcount");
		model.addAttribute("count",count);
		
		// 회원 연령별 var 그래프에 넣을 데이터
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
	
	
}
