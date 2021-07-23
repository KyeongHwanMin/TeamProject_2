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
 * 관광지 Bean: 역사문화, 자연경치, 레저체험학습, 휴식힐링
 */
@Controller
public class attractionBean {

	
	@Autowired
	private SqlSessionTemplate dao =null;

	
//	1. 관광지 검색 (지역, 카테고리로 검색) 	
	@RequestMapping("attractionSearchForm.do")
	public String SearchForm() {
		
		return "/userpage/attraction/attractionSearchForm.jsp"; 
	}
	
/*	2. DB 저장된 정보 불러오기 (Form에서 ID값 통일시키기) 
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
//	3. 관광지 이미지파일 저장 및 DB 업로드
	
	@RequestMapping("attractionForm.do")
	public String uploadForm() {

		return "/adminpage/upload/attractionForm.jsp"; 
	}
	@RequestMapping("attractionPro.do")
	public String pro(String place_name, String place_address, String place_content, String place_local, String place_category,
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
		itemdto.setPlace_content(place_content);
		itemdto.setPlace_category(place_category);	
		itemdto.setPlace_local(place_local);
		itemdto.setPlace_img(place_img);
		
		dao.insert("item.insertAttraction",itemdto);
		System.out.println(f);
		return "/adminpage/upload/attractionPro.jsp";
	}

//  4. 관광지 DB 
	@RequestMapping("attractionSearchPro.do")								  		
	public String attractionSearch_local(Model model, 
			HttpServletRequest request) throws IOException {
	
		int sea1 = Integer.parseInt(request.getParameter("search1"));
		System.out.println("관광지 지역: "+sea1);
		String search1="제주시";
		
		if(sea1 == 2){
			search1="서귀포시";
			List sea1list = dao.selectList("attraction.seoquiposi"); 
			 model.addAttribute("sea1list",sea1list);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
		
		}else if(sea1==3){
			search1="중문";
			List sea1list = dao.selectList("attraction.jungmun"); 
			 model.addAttribute("sea1list",sea1list);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==4){
			search1="제주국제공항";
			List sea1list = dao.selectList("attraction.jejuairport"); 
			 model.addAttribute("sea1list",sea1list);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==5){
			search1="애월/한림/협재";
			List sea1list = dao.selectList("attraction.aweol"); 
			 model.addAttribute("sea1list",sea1list);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==6){
			search1="표선/상산";
			List sea1list = dao.selectList("attraction.pyoseon"); 
			model.addAttribute("sea1list",sea1list);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==7){ 
			search1="함덕/김녕/세화";
			List sea1list = dao.selectList("attraction.hamduk"); 
			model.addAttribute("sea1list",sea1list);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
		}
		List sea1list = dao.selectList("attraction.jejusi"); 
		model.addAttribute("sea1list",sea1list);
		 
		return "/userpage/attraction/attractionSearchPro.jsp";
	}
	

	
/*	5. 관광지 유형 검색 
	@RequestMapping("attractionSearchPro2.do")  		
	public String attractionSearch_category(Model model, 
			HttpServletRequest request) throws IOException {
	
		int sea2 = Integer.parseInt(request.getParameter("search2"));
		System.out.println("관광지 유형: "+sea2);
		String search2="역사/문화";
		
		if(sea2 == 8){
			search2="자연/경치";
			List sea2list = dao.selectList("attraction.nature"); 
			 model.addAttribute("sea2list",sea2list);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
		
		}else if(sea2==9){
			search2="레저/체험/학습";
			List sea2list = dao.selectList("attraction.leisure"); 
			 model.addAttribute("sea2list",sea2list);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea2==10){
			search2="휴식/힐링";
			List sea2list = dao.selectList("attraction.healing"); 
			 model.addAttribute("sea2list",sea2list);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}
		List sea2list = dao.selectList("attraction.jejusi"); 
		model.addAttribute("sea2list",sea2list);
		
		return "/userpage/attraction/attractionSearchPro.jsp";
	}		
 
*/	
//	6. 찜한 관광지 노출 (mypage에서) 	
	@RequestMapping("myAttraction.do")
	public String myAttraction(String place_name, String place_address, String place_category) {
		
		return "/userpage/attraction/myAttraction.jsp";
	}
}
	

