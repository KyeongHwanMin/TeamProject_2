package userpage.main;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//http://localhost:8080/jejuguseok/userpage/index.do
//http://localhost:8080/jejuguseok/index.do

	//Date day= null;
	//private SqlSessionTemplate userDAO = null;
	//private SnsDAOInter snsDao = null;


@Controller  
public class mainBean {
	
	
	@Autowired
	private userDAOInter userDAO = null;


	
	
	@RequestMapping("index.do") 
	public String index(){
		
		return "/userpage/index.jsp";
	}
	
	
	@RequestMapping("register.do") 
	public String register(){
		
		return "/userpage/login/register.jsp";
	}
	
	
	@RequestMapping("registerPro.do") 
	public String registerPro(userDTO dto, Model model, HttpSession session ) throws Exception{
		
		userDAO.insert(dto);
		
		
		
		return "/userpage/login/registerPro.jsp";
	}

	
	@RequestMapping("loginForm.do") 
	public String loginForm(){
		
		return "/userpage/login/loginForm.jsp";
	}
	
	
	                           //아이디를 admin(특정)만 허락하게 하면,params={"id=admin"- 로 수정
	@RequestMapping(value="loginPro.do", method=RequestMethod.POST, params={"user_id" , "pw"}) 
	public String loginPro(String user_id, String pw,  Model model, HttpSession session){
		
		
		 try {
		      boolean result = userDAO.loginCheck(user_id, pw);
			       if(result) {
					session.setAttribute("user_id", user_id);	// 세션  HttpSession session
				}
				model.addAttribute("result", result);
		 
		 }catch(Exception e) {
		  e.printStackTrace();
	  }
		 
		 
		 
		return "/userpage/login/loginPro.jsp";
	}
	

	
	

	
}
	