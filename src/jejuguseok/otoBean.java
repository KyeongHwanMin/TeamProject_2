package jejuguseok;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class otoBean {
	
	@RequestMapping("content.do") 
	public String content(){
		
		return "/WEB-INF/view/userpage/oto/content.jsp";
	}
	
	@RequestMapping("delete.do") 
	public String delete(){
		
		return "/WEB-INF/view/userpage/oto/delete.jsp";
	}
	
	@RequestMapping("passwd.do") 
	public String passwd(){
		
		return "/WEB-INF/view/userpage/oto/passwd.jsp";
	}
	
	@RequestMapping("update.do") 
	public String update(){
		
		return "/WEB-INF/view/userpage/oto/update.jsp";
	}
	
	@RequestMapping("list.do") 
	public String list(){
		
		return "/WEB-INF/view/userpage/oto/list.jsp";
	}
	
	@RequestMapping("write.do") 
	public String write(){
		
		return "/WEB-INF/view/userpage/oto/write.jsp";
	}
}
