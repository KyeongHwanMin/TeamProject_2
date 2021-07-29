package jejuguseok_map;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String accom(Model model, HttpServletRequest request){
		
		int pageSize = 5;	// 한 페이지에 보여질 게시물 수 
		
		//페이지 링크를 클릭한 번호 즉 현재 페이지 
		String pageNum = request.getParameter("pageNum");	// 리스트에서 페이지 번호를 클릭 시 받을 수 있다.(페이지를 처음에 클릭하지 않는다.)
		if (pageNum == null) {	// 페이지를 입력 안하면 1페이지.. 입력하면 null이 아니므로 if문 동작하지않는다.
		    pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);		// 1.. 문자(string)타입으로 들어오니 변환

		int startRow = (currentPage - 1) * pageSize + 1;	// (1-1) * 10 + 1 = 1
		int endRow = currentPage * pageSize;				// 1 * 10 = 10
		int count = 0;	// 전체 게시물 수
		int number= 0;	// 화면에 보이는 게시물 번호. 입력한 번호와 다르다 삭제 시 시퀀스는 빈 번호를 채우지 않는다 즉, 내장된 번호가 아닌 보이는 번호
		
		List articleList = null;
		count = dao.selectOne("home.homecount");
		
		System.out.println("카운트~~~"+count);
		
		HashMap Row = new HashMap();  // sql에 HashMap 사용해서 startRow / endRow 이름으로 값을 보낸다. 
		Row.put("startRow", startRow);
		Row.put("endRow", endRow);

		
		if (count > 0) {
			articleList = dao.selectList("home.articleList", Row);
			
		}
		
		System.out.println("articleList========="+articleList);
		
		number=count-(currentPage-1)*pageSize;	// 전체 게시물 수 - (페이지 - 1) * 10  = 
			
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("articleList", articleList); //list3 역할 
		model.addAttribute("pageNum", pageNum);

		
		 List list3 = dao.selectList("item.myHome"); // select * from Home
		
		//List list3 = dao.selectList("item.articleList");
		 model.addAttribute("list3",list3);
		
		return "/userpage/home/accom.jsp"; 
	}
	
	
	// 숙박 페이지 - 지역 구분하기 페이지 
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
	public String accomBookMK(locationDTO dto , String home_no, HttpSession session,Model model, HttpServletRequest request)  throws Exception{
		
		String id = (String) session.getAttribute("user_id");
		
		//String home_no = request.getParameter(home_no);
		
		locationDTO DD = new locationDTO();
		accomBookMKdto mkdto = new accomBookMKdto();
		
		DD = dao.selectOne("home.selecthome", home_no); 
		
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
		
		accomBookMKdto dto = new accomBookMKdto();
		int count = 0;
		count =dao.selectOne("home.count", id);
		System.out.println("카운ㅌ ㅡ~~~"+count);
		
		
		model.addAttribute("count",count);
		List myAccomList = dao.selectList("home.myAccom", id); 
		
		 model.addAttribute("myAccomList",myAccomList);
		
		return "/userpage/mypage/myAccom.jsp"; 
	}
	
	
	//찜하기 풀기 
	@RequestMapping("myAccomDeletePro.do")  //myAccomDeletePro
	public String myAccomDeletePro( String home_no, HttpSession session,HttpServletRequest request)  throws Exception{
		
		dao.delete("home.deleteMK", home_no);
		
		
		return "/userpage/mypage/myAccomDeletePro.jsp"; 
	}
	
	
}
