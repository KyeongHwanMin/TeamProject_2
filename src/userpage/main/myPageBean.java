package userpage.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
public class myPageBean {
	
	@Autowired
	private userDAOInter userDAO = null;
	
	
	
	@RequestMapping("mypage.do") 
	public String index(){
		
		return "/userpage/mypage/mypage.jsp";
	}
	
	
	@RequestMapping("modifyProfile.do") 
	public String modifyProfile(){
		
		return "/userpage/mypage/modifyProfile.jsp";
	}
	
	
	
}
