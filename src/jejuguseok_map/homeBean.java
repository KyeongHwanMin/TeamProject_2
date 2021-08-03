package jejuguseok_map;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/*
 * 숙소 Bean: 유형/지역별 분류 
 * 1 유형: 모텔, 게스트하우스, 펜션, 호텔
 * 2 지역: 제주시, 서귀포시, 중문, 제주국제공항, 애월/한림/협재, 표선/상산, 함덕/김녕/세화
 */
@Controller
public class homeBean {

	@Autowired
	private SqlSessionTemplate dao =null;
	
//	숙소 검색 
	@RequestMapping("search.do")
	public String search() {

		return "/userpage/home/search.jsp";
	}	

//	숙소  DB 업로드 ================================
	
	@RequestMapping("homeForm.do")
	public String uploadForm() {

		return "/adminpage/upload/homeForm.jsp"; 
	}
	
	
	@RequestMapping("homePro.do")
	public String homePro(String name, String address, String content, String category, 
			String location, String x, String y, String type, MultipartHttpServletRequest ms) {
		
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
		lo.setName(name);	
		lo.setX(x);
		lo.setY(y);
		lo.setCategory(category);
		System.out.println("category=========="+category);
		lo.setAddress(address);
		lo.setContent(content);
		lo.setLocation(location);
		//lo.setType(type); 
		//System.out.println("type========="+type);
		lo.setImg(img);
		System.out.println("img========="+img);
		
		dao.insert("item.insertHome",lo);
		System.out.println(f);
		return "/adminpage/upload/homePro.jsp";
	}	

	
	
	// -----------정현서 추가----------------------
	
	// 숙소 정보 수정 . 입력 폼이랑 비슷하다. 
	@RequestMapping("homeUpdate.do")
	public String homeUpdate(int no,  Model model) {
		
		
		locationDTO dto = new locationDTO();
		dto = dao.selectOne("home.homeInfo", no);
		model.addAttribute("dto", dto);
		
		return "/adminpage/upload/homeUpdate.jsp"; 
	}
	
	
	// 숙소 정보 수정 pro.
	@RequestMapping("homeUpdatePro.do")
	public String homeUpdatePro(int no,  Model model, HttpServletRequest request) {
		System.out.println("homeno====="+no);	
		
		//int no2 = Integer.parseInt(String.valueOf("no"));
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String content = request.getParameter("content");
		String x = request.getParameter("x");
		String y =  request.getParameter("y");
		String category = request.getParameter("category");
		String location = request.getParameter("location");
		System.out.println("category====="+category);	
		locationDTO dto = new locationDTO();
		System.out.println("UpdatePro  dto====="+dto);
	
		dto.setNo(no);
		dto.setName(name);
		dto.setAddress(address);
		dto.setContent(content);
		dto.setX(x);
		dto.setY(y);
		dto.setCategory(category);
		dto.setLocation(location);
		
		// 여기서 dto로 보내잔아. 
		dao.update("home.homeUpdate", dto);
		dao.update("home.homeMKUpdate", dto);
		
		
		return "/adminpage/upload/homeUpdatePro.jsp"; 
	}
	
	
	
	
	// 관리자 ---- 숙소 삭제 
	@RequestMapping("homeDelete.do")
	public String homeDelete( HttpServletRequest request, Model model) {
			
		String no = request.getParameter("no");
		model.addAttribute("no", no);
		
		return "/adminpage/upload/homeDelete.jsp"; 
	}
	
	
	@RequestMapping("homeDeletePro.do")
	public String homeDeletePro( HttpServletRequest request, Model model) {
			
		String no = request.getParameter("no");
		dao.delete("home.deletehome", no);
		dao.delete("home.deletehome2", no);
		
		return "/adminpage/upload/homeDeletePro.jsp"; 
	}
	
	
	
	
	
}

