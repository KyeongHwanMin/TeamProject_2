package jejuguseok_map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import userpage.main.userDAOInter;
import userpage.main.userDTO;

/* 정현서 work. 
 * 
 * 숙소 Bean: 유형/지역별 분류 
 * 1 유형: 모텔, 게스트하우스, 펜션, 호텔
 * 2 지역: 제주시, 서귀포시, 중문, 제주국제공항, 애월/한림/협재, 표선/상산, 함덕/김녕/세화
 */
@Controller
public class accomBean {
	
	@Autowired
	private SqlSessionTemplate dao =null;
	
	
	
	// 숙박 페이지
	@RequestMapping("accom.do")
	public String accom(Model model){
		
		List list3 = dao.selectList("item.myHome"); // select * from Home
		 
		 model.addAttribute("list3",list3);
		
		return "/userpage/home/accom.jsp"; 
	}
	
	
	// 숙박 페이지 지역 구분하기 페이지
	@RequestMapping("accomLocal.do")
	public String accomLocal(Model model, HttpServletRequest request){
		
		int se= Integer.parseInt(request.getParameter("search"));
		System.out.println("출력!!"+se);
		
		String search="제주시";
		
		
		if(se == 2){
			search="서귀포시";
			List slist = dao.selectList("home.seoquiposi"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
					 
		}else if(se==3){
			search="중문";
			List slist = dao.selectList("home.jungmun"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
		}else if(se==4){
			search="제주국제공항";
			List slist = dao.selectList("home.jejuairport"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
			
		}else if(se==5){
			search="애월/한림/협재";
			List slist = dao.selectList("home.aweol"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
			
		}else if(se==6){
			search="표선/상산";
			List slist = dao.selectList("home.pyoseon"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
			 
		}else if(se==7){   //hamduk
			search="함덕/김녕/세화";
			List slist = dao.selectList("home.hamduk"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
		}
		
		
		List slist = dao.selectList("home.jejusi"); 
		 model.addAttribute("slist",slist);
		
		return "/userpage/home/accomLocal.jsp"; 
	}
	
	
	//숙박 찜하기 버튼 누를때 가는 페이지. 일종의 pro 
	// accom.do에서 찜하기 누르면 스크립트가 뜨고 본 페이지(accom.do)로 돌아온다 (찜하기가 등록되었습니다! [확인] ) 
	@RequestMapping("accomBookMK.do")  //accomBookMKdto 
	public String accomBookMK(homeDTO dto , String home_no, HttpSession session,Model model, HttpServletRequest request)  throws Exception{
		
		String id = (String) session.getAttribute("user_id");
		
		//String home_no = request.getParameter(home_no);
		
		homeDTO DD = new homeDTO();
		accomBookMKdto mkdto = new accomBookMKdto();
		
		
		DD = dao.selectOne("home.selecthome", home_no); 

		System.out.println("이름~~~======"+DD.getHome_name());
		
		
		mkdto.setUser_id(id);
		mkdto.setHome_no(DD.getHome_no());
		mkdto.setHome_name(DD.getHome_name());
		mkdto.setHome_content(DD.getHome_content());
		mkdto.setHome_type(DD.getHome_type());
		mkdto.setHome_local(DD.getHome_local());
		mkdto.setHome_img(DD.getHome_img());
		mkdto.setHome_address(DD.getHome_address());
		
		dao.insert("home.insertMK", mkdto);
		
	
		return "/userpage/home/accomBookMK.jsp"; 
	}
	
	
	//내가 찜한 숙박 리스트
	@RequestMapping("myAccom.do")
	public String myAccom(String user_id, Model model, HttpSession session){
		
		String id = (String) session.getAttribute("user_id");
		System.out.println("아이디 ==="+id);
		
		//int count = dao.delete(i
		accomBookMKdto dto = new accomBookMKdto();
		//int count = (Integer)dao.selectOne("home.count", dto);
		System.out.println("카운ㅌ ㅡ~~~"+dto);
		
		List myAccomList = dao.selectList("home.myAccom", id); // 
		
		 model.addAttribute("myAccomList",myAccomList);
		 
		 
		
		return "/userpage/mypage/myAccom.jsp"; 
	}
	
	
	
}
