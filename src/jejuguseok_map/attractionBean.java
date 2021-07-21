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

	private Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String user="final05";
		String pass="final";
		String url="jdbc:oracle:thin:@masternull.iptime.org:1521:orcl";
		return DriverManager.getConnection(url,user, pass);
	}	
	
	@Autowired
	private SqlSessionTemplate dao =null;

	
//	1. 관광지 검색 (지역, 카테고리로 검색) 	
	@RequestMapping("attractionSearchForm.do")
	public String SearchForm() {
		
		return "/userpage/attraction/attractionSearchForm.jsp"; 
	}
	
//	DB 저장된 정보 불러오기 (Form에서 ID값 통일시키기) 
	@RequestMapping("attractionSearchPro.do")
//									  		관광지_지역,			관광지 유형	으로 관광지 DB 	매개변수 설정 	
	public String attractionSearchPro(String place_local, String place_category, Model model) throws IOException {
		
//		DTO 객체 생성 후 set으로 저장 
		attractionDTO dto = new attractionDTO();
		dto.setPlace_local(place_local);
		dto.setPlace_category(place_category);
		
		System.out.println(dto.getPlace_category());
		System.out.println(dto.getPlace_local());

/*		set으로 저장한 DTO를 List 저
 * 		sql: mapper namespace="item" + id="getAttractionList" + 생성된 dto로 불러오기 
*/		
		List list = dao.selectList("item.getAttractionList", dto); 
		model.addAttribute("list", list); //출력하기
		
	 return "/userpage/attraction/attractionSearchPro.jsp";
	}
	

//	2. 관광지 이미지파일 저장 및 DB 업로드
	
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

	
//	찜한 관광지 노출 (mypage에서) 	
	@RequestMapping("myAttraction.do")
	public String myAttraction(String place_name, String place_address, String place_category) {
		
		return "/userpage/attraction/myAttraction.jsp";
	}
}
	

