package userpage.main;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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

import jejuguseok_map.locationDTO;



@Controller  
public class mainBean {

	@Autowired
	private SqlSessionTemplate sql = null;


	// 메인페이지 : 첫화면. 
	@RequestMapping("index.do") 
	public String index(){
		
		return "/userpage/index.jsp";
	}
	
	
	// 메인페이지 : 검색 기능 
	@RequestMapping("searchItem.do") 
	public String searchItem(Model model, HttpServletRequest request){
		String col = request.getParameter("col");
		String search = request.getParameter("search");
		
		int count = 0; // 검색 장소 수
	
		HashMap<String, String> Row = new HashMap();  
		Row.put("search", search);	
		Row.put("col", col);
			
			
		   System.out.println("결과===="+col+"   /// rufrh===="+search);
			count = sql.selectOne("attlist.SeCount", Row); 
			System.out.println("count===="+count);
		if (count > 0) { 
			List myAccomList = sql.selectList("attlist.itemListSearch", Row); 
			model.addAttribute("myAccomList",myAccomList);
		}
		model.addAttribute("count",count);
	
		return "/userpage/searchItem.jsp";
	}
	
	
	
	// 회원가입
	@RequestMapping("register.do") 
	public String register(){
		
		return "/userpage/login/register.jsp";
	}
	

	
	
	@RequestMapping("registerPro.do") 	//userDAO.insert(dto);
	public String registerPro(userDTO dto, Model model, HttpSession session ) throws Exception{
	
		
		sql.insert("user.insert",dto);
		
		return "/userpage/login/registerPro.jsp";
	}

		

	
	
	//로그인
	@RequestMapping("loginForm.do") 
	public String loginForm(){
		
		return "/userpage/login/loginForm.jsp";
	}
	
	
	                           //아이디를 admin(특정)만 허락하게 하면,params={"id=admin"- 로 수정
	@RequestMapping(value="loginPro.do", method=RequestMethod.POST, params={"user_id" , "pw"}) 
	public String loginPro(userDTO dto,  Model model, HttpSession session){
		
		 
		
		int result = (Integer)sql.selectOne("user.loginCheck",dto);
		if(result == 1) {
			 session.setAttribute("user_id", dto.getUser_id());
		}
		model.addAttribute("result", result);

		 
		 
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
		
		//int result = userDAO.idChk(dto);
		int result = sql.selectOne("user.idChk", dto);
		
		model.addAttribute("result",result);
		
		if(result != 0) {
			return "/userpage/login/confirmId.jsp"; 
		}
		return "/userpage/login/confirmId.jsp";
	
	}
	
	
	
	
}
	