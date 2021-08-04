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
import java.util.UUID;

import jejuguseok_map.locationDTO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
	@RequestMapping("attBookMark.do")  
	public String attBookMark(attBkDTO ab, HttpSession session,Model model )  throws Exception{
//		﻿ 관광지 메인페이지에서 해당 관광지 저장하기(myatt으로 보냄)
		String id = (String) session.getAttribute("user_id"); 

		ab.setUser_id(id); 
//		﻿id를 session을 이용해 getAttribute로 가져옴
// 		﻿attbkDTO(ab)에 저장된 user_id(id)를 가져옴 (ab : num(pk), place_no(관광지 번호), user_id(아이디))
		int count = dao.selectOne("att.checkAtt", ab);	
//		찜한 북마크를 기존 DB에서 place_no와 user_id를 통해 중복 체크(중복일 땐=1 알럿 노출)		
		if(count==0) {
			dao.insert("att.insertAttmk", ab); 
		}
//		 ﻿중복 확인 후(count=0)일 땐 inserattmk로 추가
		model.addAttribute("count", count);
//		﻿model을 통해 해당 count 정보를 view로 이동		
		return "/userpage/mypage/attBookMark.jsp";
	}
	
	//내가 찜한 관광지 불러오기 
		@RequestMapping("myAtt.do")
		public String myAtt(String user_id, Model model, 
				HttpSession session)throws Exception{
//			﻿session을 통해 user_id 확인			
			String id = (String) session.getAttribute("user_id");

			// System.out.println("찜한 관광지: "+place_category+place_name);
			List myAttList = dao.selectList("att.myAttList", id); 
//			﻿sql에서 location과 myattraciton DB에서 user_id와 no을 매칭시켜 불러오기 	
			model.addAttribute("myAttList",myAttList);
//			﻿model을 이용해 해당 리스트를 view 이동		
		return "/userpage/mypage/myAttractionList.jsp";
	}
	
	//북마킹 해제(mypage에서)  
	@RequestMapping("myAttDelete.do")
	public String myAttDelete( int place_no, attBkDTO ab, 
			HttpSession session, HttpServletRequest request)  
			throws Exception{
//		﻿place_no으로 확인하여 해당 관광지 삭제		
		dao.delete("att.deleteMyAtt", place_no);
		System.out.println("북마킹 해제: "+ ab.getPlace_no());
		
		return "/userpage/mypage/myAttDelete.jsp"; 
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

		List attList = null;
		count = dao.selectOne("att.attcount");
		
		System.out.println("페이징 체크: "+count);
		
		HashMap Row = new HashMap();  
		Row.put("startRow", startRow);
		Row.put("endRow", endRow);

		if (count > 0) {
			attList = dao.selectList("att.attList", Row);
		}
		
		System.out.println("관광지 리스트: "+ attList);
		number=count-(currentPage-1)*pageSize;			
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("attList", attList); 
		model.addAttribute("pageNum", pageNum);

		List list1 = dao.selectList("item.searchAttraction"); 
		model.addAttribute("list1",list1);	

		return "/userpage/attraction/attractionSearchForm.jsp"; 
	}
	
//  관광지 DB 불러오기 
	@RequestMapping("attPro.do")								  		
	public String attractionSearch_local(Model model, 
			HttpServletRequest request) throws IOException {
	
		int sea1 = Integer.parseInt(request.getParameter("search1"));
		String search1="제주시";
		
		if(sea1 == 2){
			search1="서귀포시";
			List list2 = dao.selectList("att.seoquiposi"); 
			 model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
		
		}else if(sea1==3){
			search1="중문";
			List list2 = dao.selectList("att.jungmun"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==4){
			search1="제주국제공항";
			List list2 = dao.selectList("att.jejuairport"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==5){
			search1="애월/한림/협재";
			List list2 = dao.selectList("att.aweol"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==6){
			search1="표선/상산";
			List list2 = dao.selectList("att.pyoseon"); 
			model.addAttribute("list2",list2);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==7){ 
			search1="함덕/김녕/세화";
			List list2 = dao.selectList("att.hamduk"); 
			model.addAttribute("list2",list2);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
		}
		List list2 = dao.selectList("att.jejusi"); 
		model.addAttribute("list2",list2);
		 
		return "/userpage/attraction/attractionSearchPro.jsp";
	}
	
//	관광지 이미지파일 저장 및 Db 업로드 
	
	@RequestMapping("attractionForm.do")
	public String uploadForm() {
		
		return "/adminpage/upload/attractionForm.jsp"; 
	}
	@RequestMapping("attractionPro.do")
	public String attractionPro(String name, String address, String x, String y, String content, 
			String location, String category, String type, MultipartHttpServletRequest ms) {
		MultipartFile mf = ms.getFile("img"); // 파일 원본
		String fileName = mf.getOriginalFilename(); // 파일 원본 이름
		File f = new File("/WEB-INF/userpage/save"+fileName); // 복사 위치
		
		try {
			mf.transferTo(f); // 복사
		}catch(Exception e) {
			e.printStackTrace();
		}
		ms.setAttribute("filename",fileName);
		
		Object img1 = (Object)f;
		String img = String.valueOf(img1);
		
		locationDTO lo = new locationDTO();
		lo.setAddress(address);
		lo.setCategory(category);
		lo.setContent(content);
		lo.setImg(img);
		lo.setLocation(location);
		lo.setName(name);
		lo.setType(type);
		lo.setX(x);
		lo.setY(y);
		dao.insert("item.insertAtt",lo);
		System.out.println(f);
		return "/adminpage/upload/attractionPro.jsp";
	}

	
/* admin ID로 관광지 정보 수정 및 삭제 
 * attupdate: 관광지 정보 수정
 * attout: 관광지 삭제 
 */
	
	@RequestMapping("attupdate.do")
	public String attupdate(Model model, int no) {
				
		locationDTO lo = new locationDTO();
		lo = dao.selectOne("att.updatelist", no);
		model.addAttribute("lo", lo);
		
		return "/adminpage/upload/attupdate.jsp"; 
	}

	@RequestMapping("attupdatePro.do")
	public String attupdatePro(Model model, int no, HttpServletRequest request) {
		
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String content = request.getParameter("content");
		String x = request.getParameter("x");
		String y =  request.getParameter("y");
		String category = request.getParameter("category");
		String type = request.getParameter("type");
		String location = request.getParameter("location");
		
		locationDTO lo = new locationDTO();
		System.out.println("관광지수정: "+lo);
		
		lo.setName(name);
		lo.setAddress(address);
		lo.setCategory(category);
		lo.setContent(content);
		lo.setLocation(location);
		lo.setType(type);
		lo.setX(x);
		lo.setY(y);
		lo.setNo(no);

		System.out.println("수정된 관광지: "+no);
		System.out.println("수정된 이름: "+name);
		dao.update("att.updateAtt", lo);
		//dao.update("att.updateAttBk", lo);
		
		return "/adminpage/upload/attupdatePro.jsp"; 
	}
	
	@RequestMapping("attdelete.do")
	public String attdelete(locationDTO dto, HttpServletRequest request, Model model) {
		
		String no = request.getParameter("no");
		dao.delete("att.deleteAtt", no);
		
		return "/adminpage/upload/attdelete.jsp"; 
	}
	
	@RequestMapping("sitemap.do")
	public String sitemap() {
		
	
		return "/userpage/sitemap.jsp"; 
	}
	

	
}