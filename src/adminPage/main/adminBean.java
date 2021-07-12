package adminPage.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import userpage.main.userDAOInter;

@Controller  
public class adminBean {
	
	@Autowired
	private userDAOInter userDAO = null;

	
	
	@RequestMapping("adminpage/index.do") 
	public String adminIndex(){
		
		return "/adminpage/index.jsp";
	}
	
	
}
