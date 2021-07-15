package jejuguseok_map;

import java.io.File;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

//	숙소 이미지파일 저장 및 DB 업로드
	
	@RequestMapping("homeForm.do")
	public String uploadForm() {

		return "/userpage/home/homeForm.jsp"; 
	}
	@RequestMapping("homePro.do")
	public String homePro(String home_no, String home_name, String home_address, String home_content, String home_local, 
			String home_type, MultipartHttpServletRequest ms) {
		MultipartFile mf = ms.getFile("home_img"); // 파일 원본
		String fileName = mf.getOriginalFilename(); // 파일 원본 이름
		File f = new File("D://"+fileName); // 복사 위치
		
		try {
			mf.transferTo(f); // 복사
		}catch(Exception e) {
			e.printStackTrace();
		}
		ms.setAttribute("filename",fileName);
		
		Object home_img1 = (Object)f;
		String home_img = String.valueOf(home_img1);

		homeDTO itemdto = new homeDTO();
		itemdto.setHome_no(home_no);
		itemdto.setHome_name(home_name);		
		itemdto.setHome_address(home_address);
		itemdto.setHome_content(home_content);
		itemdto.setHome_local(home_local);
		itemdto.setHome_type(home_type);
		itemdto.setHome_img(home_img);
	
		dao.insert("item.insertHome",itemdto);
		
		return "/userpage/home/homePro.jsp";
	}	
//	찜한 숙소 노출 (mypage에서) 		
	@RequestMapping("myHome.do")
	public String myHome(String home_no, String home_name, String home_address, String home_local, String home_type) {
		
		
		return "/userpage/attraction/myHome.jsp";
	}
}

