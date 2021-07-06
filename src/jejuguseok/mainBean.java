package jejuguseok;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//http://localhost:8080/jejuguseok/index.do

@Controller  
public class mainBean {
	@Autowired
	private Date day= null;
	
	
	@RequestMapping("index.do") 
	public String index(){
		
		return "/WEB-INF/view/index.jsp";
	}
	
}
	