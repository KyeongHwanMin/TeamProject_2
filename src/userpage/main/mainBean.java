package userpage.main;

import java.util.Date;

import javax.servlet.http.HttpSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


//http://localhost:8080/jejuguseok/userpage/index.do
//http://localhost:8080/jejuguseok/index.do


@Controller  
public class mainBean {
	
	
	@Autowired
	private Date day= null;
	//private SqlSessionTemplate userDAO = null;
	
	
	@RequestMapping("index.do") 
	public String index(){
		
		return "/WEB-INF/view/userpage/index.jsp";
	}
	
	
	@RequestMapping("register.do") 
	public String register(){
		
		return "/WEB-INF/view/userpage/login/register.jsp";
	}
	
	
	@RequestMapping("registerPro.do") 
	public String registerPro(userDTO dto, Model model, HttpSession session ){
		
		//userDAO.insert(dto);
		
		
		
		return "/WEB-INF/view/userpage/login/registerPro.jsp";
	}

	
	@RequestMapping("loginForm.do") 
	public String loginForm(){
		
		return "/WEB-INF/view/userpage/login/loginForm.jsp";
	}
	
	@RequestMapping("loginPro.do") 
	public String loginPro(userDTO dto, HttpSession session , Model model){
		
		/*
		int count = (Integer)userDAO.selectOne("member.loginCheck",dto);
		if(count == 1) {
			 session.setAttribute("memId", dto.getUser_id());
		}
		model.addAttribute("count", count);
		*/
		
		return "/WEB-INF/view/userpage/login/loginPro.jsp";
	}
	
/*
	@RequestMapping("attraction.do") 
	public String attraction(){
		
		return "/WEB-INF/view/userpage/attraction.jsp";

	}*/
	
	
	@RequestMapping("confirmId.do") 
	public String confirmId(){
		
		return "/WEB-INF/view/userpage/login/confirmId.jsp";
	}
	

	
}
	