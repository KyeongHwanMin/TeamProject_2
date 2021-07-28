package jejuguseok_map;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import jejuguseok_map.attractionDTO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
관광지 Bean: 역사문화, 자연경치, 레저체험학습, 휴식힐링
list1: 관광지 메인(form) 페이지
list2: 관광지 pro 페이지 

 * 페이징 요약 
- 현재 페이지(current page = 클릭한 페이지) 
- String pageNum ~ : 첫 페이지 1(1~10 해당 페이지 받기) 
- if (pageNum == null) ~:  페이지 입력 x >  1페이지, 입력 시 null=if문 동작 안함 
- int startRow ~:  (1-1) * 10 + 1 = 1
- int endRow ~: 1 * 10 = 10
- int count = 0; 전체 관광지 수
- int number= 0; 화면에 보이는 게시물 번호. 
  입력된 번호가 아니며 삭제되면 시퀀스는 emty 번호를 체크하지 않는다 즉, 입력된 번호가 아닌 게시물 등록할 떄만 보이는 번호	
- HashMap Row = new HashMap(); : sql에 HashMap 사용해서 startRow / endRow 이름으로 값을 보낸다. 
 */
@Controller
public class attractionBean {

	
	@Autowired
	private SqlSessionTemplate dao =null;	
	
	
//	관광지 북마크: attform에서 찜하기 클릭 시 해당 페이지 이동 후 복귀(알럿기능) 
	@RequestMapping("attbook.do") 
	public String attbook(Model model, attractionDTO dto, String place_no,  
			HttpSession session, HttpServletRequest request)  throws Exception{
		
		String id =(String)session.getAttribute("user_id");
		
		attractionDTO att = new attractionDTO();
		attBookMarkDTO bm = new attBookMarkDTO();
		
		att = dao.selectOne("attraction.selectAtt", place_no);
		bm.setUser_id(id);
		bm.setPlace_address(att.getPlace_address());
		bm.setPlace_category(att.getPlace_category());
		bm.setPlace_content(att.getPlace_content());
		bm.setPlace_img(att.getPlace_img());
		bm.setPlace_local(att.getPlace_local());
		bm.setPlace_name(att.getPlace_name());
		bm.setPlace_no(att.getPlace_no());
		
		
		return "/userpage/attraction/attBookMark.jsp";
	}
	
	
	
	
	
	
//	관광지 검색 (지역, 카테고리로 검색) + 페이징 
	@RequestMapping("attForm.do")
	public String SearchForm(Model model, HttpServletRequest request) {
		
		int pageSize = 10;	
		
		String pageNum = request.getParameter("pageNum");	
		if (pageNum == null) { 
		    pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);		
		int startRow = (currentPage - 1) * pageSize + 1;	
		int endRow = currentPage * pageSize;				
		int count = 0;	
		int number= 0;

		List articleList = null;
		count = dao.selectOne("attraction.attcount");
		
		System.out.println("페이징 체크: "+count);
		
		HashMap Row = new HashMap();  
		Row.put("startRow", startRow);
		Row.put("endRow", endRow);

		if (count > 0) {
			articleList = dao.selectList("attraction.attList", Row);
		}
		
		System.out.println("관광지 리스트: "+articleList);
		number=count-(currentPage-1)*pageSize;			
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("articleList", articleList); 
		model.addAttribute("pageNum", pageNum);

		List list1 = dao.selectList("item.searchAttraction"); 
		model.addAttribute("list1",list1);	

		return "/userpage/attraction/attractionSearchForm.jsp"; 
	}
	
//  관광지 DB 불러오기 
	@RequestMapping("attractionSearchPro.do")								  		
	public String attractionSearch_local(Model model, 
			HttpServletRequest request) throws IOException {
	
		int sea1 = Integer.parseInt(request.getParameter("search1"));
		String search1="제주시";
		
		if(sea1 == 2){
			search1="서귀포시";
			List list2 = dao.selectList("attraction.seoquiposi"); 
			 model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
		
		}else if(sea1==3){
			search1="중문";
			List list2 = dao.selectList("attraction.jungmun"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==4){
			search1="제주국제공항";
			List list2 = dao.selectList("attraction.jejuairport"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==5){
			search1="애월/한림/협재";
			List list2 = dao.selectList("attraction.aweol"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==6){
			search1="표선/상산";
			List list2 = dao.selectList("attraction.pyoseon"); 
			model.addAttribute("list2",list2);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==7){ 
			search1="함덕/김녕/세화";
			List list2 = dao.selectList("attraction.hamduk"); 
			model.addAttribute("list2",list2);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
		}
		List list2 = dao.selectList("attraction.jejusi"); 
		model.addAttribute("list2",list2);
		 
		return "/userpage/attraction/attractionSearchPro.jsp";
	}
	
//	관광지 이미지파일 저장 및 Db 업로드 
	
	@RequestMapping("attractionForm.do")
	public String uploadForm() {
		
		return "/adminpage/upload/attractionForm.jsp"; 
	}
	@RequestMapping("attractionPro.do")
	public String pro(String place_name, String place_address, String x, String y, String place_content, String place_local, String place_category,
			MultipartHttpServletRequest ms) {
		MultipartFile mf = ms.getFile("place_img"); // 파일 원본
		String fileName = mf.getOriginalFilename(); // 파일 원본 이름
		File f = new File("/WEB-INF/userpage/save"+fileName); // 복사 위치
		
		try {
			mf.transferTo(f); // 복사
		}catch(Exception e) {
			e.printStackTrace();
		}
		ms.setAttribute("filename",fileName);
		
		Object place_img1 = (Object)f;
		String place_img = String.valueOf(place_img1);
		
		attractionDTO itemdto = new attractionDTO();
		itemdto.setPlace_name(place_name);
		itemdto.setPlace_address(place_address);
		itemdto.setX(x);		
		itemdto.setY(y);
		itemdto.setPlace_content(place_content);
		itemdto.setPlace_category(place_category);	
		itemdto.setPlace_local(place_local);
		itemdto.setPlace_img(place_img);
		
		dao.insert("item.insertAttraction",itemdto);
		System.out.println(f);
		return "/adminpage/upload/attractionPro.jsp";
	}

//	6. 찜한 관광지 노출 (mypage에서) 	
	@RequestMapping("myAttraction.do")
	public String myAttraction(String place_name, String place_address, String place_category) {
		
		return "/userpage/attraction/myAttraction.jsp";
	}
	
	/*	DB 저장된 정보 불러오기 (Form에서 ID값 통일시키기) 
	@RequestMapping("attractionSearchPro1.do")
								  		관광지_지역,			관광지 유형	으로 관광지 DB 	매개변수 설정 	
	public String attractionSearchPro(attractionDTO dto, Model model, 
			HttpServletRequest request) throws IOException {
		
	 	dto에 들어갈 값을 메개변수로 선언하면 이름에 맞춰서 들어감
		System.out.println(dto.getPlace_category());
		System.out.println(dto.getPlace_local());

		set으로 저장한 DTO를 List 저장
 		sql: mapper namespace="item" + id="getAttractionList" + 생성된 dto로 불러오기 
			
		List list = dao.selectList("item.getAttractionList", dto); 
		model.addAttribute("list", list); //출력하기
		System.out.println(list.size());  // 결과 몇개 나오는지 확인
	
		
		return "/userpage/attraction/attractionSearchPro.jsp"; 
		}
*/
}
	

