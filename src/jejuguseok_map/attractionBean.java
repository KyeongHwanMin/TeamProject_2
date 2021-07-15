package jejuguseok_map;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*http:/localhost:8080/jejuguseok/history.do
 * 관광지 Bean: 역사문화, 자연경치, 레저체험학습, 휴식힐링
 */
@Controller
public class attractionBean {

	@Autowired
	private SqlSessionTemplate dao =null;
	
	
	@Autowired
//	1. 관광지: 역사문화
	@RequestMapping("history.do")
	public String history() {

		return "/userpage/attraction/history.jsp";
	}

//	2. 관광지: 자연경치
	@RequestMapping("nature.do")
	public String nature() {

		return "/userpage/attraction/nature.jsp";

	}

//	3. 관광지: 레저체험학습
	@RequestMapping("leisure.do")
	public String leisure() {

		return "/userpage/attraction/leisure.jsp";
	}

//	4. 관광지: 휴식힐링
	@RequestMapping("healing.do")
	public String healing() {

		return "/userpage/attraction/healing.jsp";
	}
	
//	관광지 이미지파일 저장 및 DB 업로드
	
	@RequestMapping("attractionForm.do")
	public String uploadForm() {

		return "/userpage/attraction/attractionForm.jsp"; 
	}
	@RequestMapping("attractionPro.do")
	public String pro(String place_no, String place_name, String place_address, String place_content, String place_category,
			MultipartHttpServletRequest ms) {
		MultipartFile mf = ms.getFile("place_img"); // 파일 원본
		String fileName = mf.getOriginalFilename(); // 파일 원본 이름
		File f = new File("D://"+fileName); // 복사 위치
		
		try {
			mf.transferTo(f); // 복사
		}catch(Exception e) {
			e.printStackTrace();
		}
		ms.setAttribute("filename",fileName);
		
		Object place_img1 = (Object)f;
		String place_img = String.valueOf(place_img1);
		
		attractionDTO itemdto = new attractionDTO();
		itemdto.setPlace_no(place_no);
		itemdto.setPlace_name(place_name);
		itemdto.setPlace_address(place_address);
		itemdto.setPlace_content(place_content);
		itemdto.setPlace_category(place_category);		
		itemdto.setPlace_img(place_img);
		
		dao.insert("item.insertAttraction",itemdto);

		return "/userpage/attraction/attractionPro.jsp";
	}
//	찜한 관광지 노출 (mypage에서) 	
	@RequestMapping("myAttraction.do")
	public String myAttraction(String place_name, String place_address, String place_category) {
		
		return "/userpage/attraction/myAttraction.jsp";
	}
}
	

