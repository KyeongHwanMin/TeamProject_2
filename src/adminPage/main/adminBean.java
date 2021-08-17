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
	private SqlSessionTemplate daosql = null;
	@Autowired
	private otoAdDAO otoAdDAO = null;
	@Autowired
	private HomeDTO homedto = null;

	// ���� ���� ������
	// ������ ��Ʈ
	// ���� ����Ʈ
	@RequestMapping("adminpage/index.do")
	public String adminIndex(Model model) {

		 //월별 순위
		 List list_month = daosql.selectList("admin.month");
		 String m,m2 =null;
		int count_1=0;int count_2=0;int count_3=0;int count_4=0;int count_5=0;int count_6=0;
		int count_7=0;int count_8=0;int count_9=0;int count_10=0;int count_11=0;int count_12=0;
		for(int i=0; i<list_month.size(); i++) {
			 m = (String) list_month.get(i);
			 m2+=m;		
		}
		String[] month = m2.split("-");
		for(int i=0; i<month.length; i++) {
				if(i%2==1) {
					if(month[i].equals("01")) {
						count_1++;
						}else if(month[i].equals("02")) {
							count_2++;				
						}else if(month[i].equals("03")) {
							count_3++;						
						}else if(month[i].equals("04")) {
							count_4++;
						}else if(month[i].equals("05")) {
							count_5++;
						}else if(month[i].equals("06")) {
							count_6++;
						}else if(month[i].equals("07")) {
							count_7++;
						}else if(month[i].equals("08")) {
							count_8++;
						}else if(month[i].equals("09")) {
							count_9++;
						}else if(month[i].equals("10")) {
							count_10++;
						}else if(month[i].equals("11")) {
							count_11++;
						}else if(month[i].equals("12")) {
							count_12++;
						}			
					}
				}
		
		model.addAttribute("count_1",count_1);model.addAttribute("count_2",count_2);model.addAttribute("count_3",count_3);
		model.addAttribute("count_4",count_4);model.addAttribute("count_5",count_5);model.addAttribute("count_6",count_6);
		model.addAttribute("count_7",count_7);model.addAttribute("count_8",count_8);model.addAttribute("count_9",count_9);
		model.addAttribute("count_10",count_10);model.addAttribute("count_11",count_11);model.addAttribute("count_12",count_12);
		List list2 = daosql.selectList("admin.all");
		model.addAttribute("list2", list2);

		// 1:1문의 확인 안한 게시글 카운팅
		int count = daosql.selectOne("admin.boardcount");
		model.addAttribute("count", count);

		// 회원 연령별 통계
	
		int to2030 = daosql.selectOne("admin.to2030");
		model.addAttribute("to2030", to2030);
		int to3040 = daosql.selectOne("admin.to3040");
		model.addAttribute("to3040", to3040);
		int to4050 = daosql.selectOne("admin.to4050");
		model.addAttribute("to4050", to4050);
		int to50 = daosql.selectOne("admin.to50");
		model.addAttribute("to50", to50);

		return "/adminpage/index.jsp";
	}

	@RequestMapping("adminpage/userManage.do")
	public String userManage(Model model) {

		List list2 = daosql.selectList("admin.all");

		model.addAttribute("list2", list2);

		return "/adminpage/userManage.jsp";
	}

	@RequestMapping("adminpage/chartPage.do") 
	public String chartPage(Model model){
		
		// 관광지 카테고리별 순위
		List location_category = daosql.selectList("admin.location_category");
		// 관광지 장소별 순위
		List location_location = daosql.selectList("admin.location_location");
		// 숙소 카테고리별 순위
		List home_category = daosql.selectList("admin.home_category");
		// 숙소 장소별 순위
		List home_location = daosql.selectList("admin.home_location");
		
		model.addAttribute("location_category",location_category);
		model.addAttribute("location_location",location_location);
		model.addAttribute("home_category",home_category);
		model.addAttribute("home_location",home_location);
		
		// 관광지 연령별
		List location_20 = daosql.selectList("admin.location_20");
		List location_30 = daosql.selectList("admin.location_30");
		List location_40 = daosql.selectList("admin.location_40");
		List location_50 = daosql.selectList("admin.location_50");
		
		model.addAttribute("location_20",location_20);
		model.addAttribute("location_30",location_30);
		model.addAttribute("location_40",location_40);
		model.addAttribute("location_50",location_50);
		
		// 숙소 연령별
		List home_20 = daosql.selectList("admin.home_20");
		List home_30 = daosql.selectList("admin.home_30");
		List home_40 = daosql.selectList("admin.home_40");
		List home_50 = daosql.selectList("admin.home_50");
		
		model.addAttribute("home_20",home_20);
		model.addAttribute("home_30",home_30);
		model.addAttribute("home_40",home_40);
		model.addAttribute("home_50",home_50);
		
		System.out.println(location_20);
		System.out.println(location_30);
		System.out.println(location_40);
		System.out.println(location_50);
		System.out.println(home_20);
		System.out.println(home_30);
		System.out.println(home_40);
		System.out.println(home_50);
		
		return "/adminpage/chartPage.jsp";
	}

	// 숙소 차트
	@RequestMapping("adminpage/HomeChart.do") 
	public String HomeChart(Model model){
		// 카테고리별 순위
		List category_list = daosql.selectList("admin.category");
			model.addAttribute("category_list",category_list);
		// 연령대별 카테고리 순위
		List list_20 = daosql.selectList("admin.travel_20");
		List list_30 = daosql.selectList("admin.travel_30");
		List list_40 = daosql.selectList("admin.travel_40");
		List list_50 = daosql.selectList("admin.travel_50");
		   model.addAttribute("list_20",list_20);
		   model.addAttribute("list_30",list_30);
		   model.addAttribute("list_40",list_40);
		   model.addAttribute("list_50",list_50);
		//성별 순위
		List list_male = daosql.selectList("admin.male");
		 model.addAttribute("list_male",list_male);
		 List list_female = daosql.selectList("admin.female");
		 model.addAttribute("list_female",list_female);
		
		// 동반유형
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
		// 숙박기간
				List day1=daosql.selectList("admin.day1");
				model.addAttribute("day1",day1);
				
		return "/adminpage/Homechart.jsp";
		}
	
	
	
	//회원 삭제 -------------- 
	@RequestMapping("adminpage/memberDelete.do")
	public String memberDelete(String user_id, Model model) {

		//daosql.selectList("admin.memberDelete",user_id);

		model.addAttribute("user_id", user_id);

		return "/adminpage/memberDelete.jsp";
	}
	
	//회원 삭제 22-------------- 
	@RequestMapping("adminpage/memberDeletePro.do")
	public String memberDeletePro(String user_id) {

		daosql.selectList("admin.memberDelete",user_id);

		//model.addAttribute("list2", list2);

		return "/adminpage/memberDeletePro.jsp";
	}
	
}