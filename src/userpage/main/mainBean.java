package userpage.main;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller  
public class mainBean {
	
	
	@Autowired
	private userDAOInter userDAO = null;

	// 메인페이지 : 첫화면. 
	@RequestMapping("index.do") 
	public String index(){
		
		return "/userpage/index.jsp";
	}
	
	// 회원가입
	@RequestMapping("register.do") 
	public String register(){
		
		return "/userpage/login/register.jsp";
	}
	

	
	
	@RequestMapping("registerPro.do") 
	public String registerPro(userDTO dto, Model model, HttpSession session ) throws Exception{
		userDAO.insert(dto);
		return "/userpage/login/registerPro.jsp";
	}

		

	
	
	//로그인
	@RequestMapping("loginForm.do") 
	public String loginForm(){
		
		return "/userpage/login/loginForm.jsp";
	}
	
	
	                           //아이디를 admin(특정)만 허락하게 하면,params={"id=admin"- 로 수정
	@RequestMapping(value="loginPro.do", method=RequestMethod.POST, params={"user_id" , "pw"}) 
	public String loginPro(String user_id, String pw,  Model model, HttpSession session){
		
		 try {
		      userDTO result = userDAO.loginCheck1(user_id, pw); 
			       if(result != null) {
					session.setAttribute("user_id", user_id);	
					session.setAttribute("pw", pw);	
				}
			    model.addAttribute("user_id",user_id);
				model.addAttribute("result",result);  // result 이름으로 보내니깐... result로 view에서 비교해야.  
		    }catch(Exception e) {
		  e.printStackTrace();
		    }
	     System.out.println(user_id);   
		 
		return "/userpage/login/loginPro.jsp";
	}
	
	
   // 로그아웃 
	@RequestMapping("logout.do")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "/userpage/index.jsp";
	}
	
/**/
	 		//아이디 중복 확인 
	@RequestMapping(value="confirmId.do", method = RequestMethod.GET ) 
	public String confirmId(userDTO dto,  Model model) throws Exception{
		int result = userDAO.idChk(dto);
		model.addAttribute("result",result);
		
		if(result != 0) {
			return "/userpage/login/confirmId.jsp"; 
		}
		return "/userpage/login/confirmId.jsp";
	
	}
	
}
	