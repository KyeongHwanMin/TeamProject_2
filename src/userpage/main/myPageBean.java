package userpage.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller  
public class myPageBean {    //" 나의 여행 " 페이지 
	
	@Autowired
	private mypageDAOInter mypageDAO = null;
	
	
	@RequestMapping("mypage.do") 
	public String mypage(String user_id, HttpSession session, Model model) throws Exception{	
	
		String id = (String) session.getAttribute("user_id");
	
		 userDTO dto = new userDTO();		 
		 dto = mypageDAO.getMyInfo(id);
		 model.addAttribute("dto", dto);
 
		return "/userpage/mypage/mypage.jsp";
	}
	
	
	
	@RequestMapping("modifyProfile.do") 
	public String modifyProfile(String user_id, HttpSession session, Model model) throws Exception{	
		String id = (String) session.getAttribute("user_id");
		userDTO dto = new userDTO();	
		System.out.println("업-아이디" + id);
		dto = mypageDAO.getMyInfo(id);
		model.addAttribute("dto", dto);
		
		System.out.println("프로필변경페이지출력" + dto);
		
		return "/userpage/mypage/modifyProfile.jsp";
	}

	
	@RequestMapping("modifyProfilePro.do") 
	public String modifyProfilePro(userDTO dto ,HttpSession session, Model model) throws Exception{
		String id = (String) session.getAttribute("user_id");
		System.out.println("업데이트Pro출력-아이디" + id);
		 
		 System.out.println("업데이트출력" + dto);
		 // modify Profile 페이지에 있는 name 들을 받아오기! 
		 dto.setName(dto.getName());
		 dto.setPw(dto.getPw());
		 dto.setAddress(dto.getAddress());
		 dto.setGender(dto.getGender());
		  dto.setYear_birth(dto.getYear_birth());
		  System.out.println("생일 출력 ~~==========" + dto.getYear_birth());
		 dto.setEmail(dto.getEmail());
		 

		 
		  mypageDAO.memberUpdate(dto);  
		return "/userpage/mypage/modifyProfilePro.jsp";
	}
	
	
	
	
	
	
}
