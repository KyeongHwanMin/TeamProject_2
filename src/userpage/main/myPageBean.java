package userpage.main;

import java.util.List;

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
		
		//int count = (Integer)mypageDAO.getMyTripCount(id); 		 
	//model.addAttribute("count", count);
	
		 userDTO dto = new userDTO();		 
		 System.out.println("아이디"+id);
		 dto = mypageDAO.getMyInfo(id);
		 System.out.println("문제없음");
		 model.addAttribute("dto", dto);
		 System.out.println("출력" + dto);
 
		return "/userpage/mypage/mypage.jsp";
	}
	
	
	
	@RequestMapping("modifyProfile.do") 
	public String modifyProfile(){
		
		return "/userpage/mypage/modifyProfile.jsp";
	}

	
	@RequestMapping("modifyProfilePro.do") 
	public String modifyProfile(userDTO dto, Model model, HttpSession session) throws Exception{
		mypageDAO.memberUpdate(dto);
		return "/userpage/mypage/modifyProfilePro.jsp";
	}
	
	
	
}
