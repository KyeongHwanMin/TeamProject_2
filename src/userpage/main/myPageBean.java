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
		
	
		int count = (Integer)mypageDAO.getMyTripCount(user_id); 
		 session.setAttribute("user_id", user_id);
		 model.addAttribute("count", count);
		 
		
		 //list로 받아준다.
		 List list = mypageDAO.getMyInfo(user_id);
		 model.addAttribute("list", list);
		 System.out.println("출력" + list);
		 				    //userDTO dto = new userDTO();
		 					//model.addAttribute("dto",dto);
		 
		 
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
