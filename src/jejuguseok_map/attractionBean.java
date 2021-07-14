package jejuguseok_map;

import java.io.File;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import java.util.Date;

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
	
//	#관광지 DB 업로드
	
	@RequestMapping("uploadForm.do")
	public String uploadForm() {

		return "/userpage/attraction/ItemForm.jsp"; 
	}
	@RequestMapping("ItemPro.do")
	public String pro(ItemDTO dto,String place_name, String place_address, String place_content, String place_category, 
			MultipartHttpServletRequest ms) {
		dao.insert("item.insertAttraction",dto);
	
		MultipartFile mf = ms.getFile("place_img"); // 파일 원본
		String fileName = mf.getOriginalFilename(); // 파일 원본 이름
		File f = new File("D://imgsave//"+fileName); // 복사 위치
		
			
		try {
			mf.transferTo(f); // 복사
		}catch(Exception e) {
			e.printStackTrace();
		}
		ms.setAttribute("filename",fileName);
		
		
		
		return "/userpage/attraction/ItemPro.jsp";
	}
}
