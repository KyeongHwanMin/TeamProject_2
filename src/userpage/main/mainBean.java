package userpage.main;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//http://localhost:8080/jejuguseok/userpage/index.do
//http://localhost:8080/jejuguseok/index.do


@Controller  
public class mainBean {
	
	@Autowired
	private Date day= null;
	
	
	@RequestMapping("index.do") 
	public String index(){
		
		return "/WEB-INF/view/userpage/index.jsp";
	}
	
	
	@RequestMapping("register.do") 
	public String register(){
		
		return "/WEB-INF/view/userpage/login/register.jsp";
	}
	

	@RequestMapping("loginForm.do") 
	public String loginForm(){
		
		
		return "/WEB-INF/view/userpage/login/loginForm.jsp";
	}
	
/*
	@RequestMapping("attraction.do") 
	public String attraction(){
		
		return "/WEB-INF/view/userpage/attraction.jsp";

	}*/
	
}
	