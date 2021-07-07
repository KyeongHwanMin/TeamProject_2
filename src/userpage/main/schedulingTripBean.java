package userpage.main;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
public class schedulingTripBean {

	@Autowired
	private Date day= null;
	
	
	@RequestMapping("startTrip.do") 
	public String startTrip(){
		
		return "/WEB-INF/view/userpage/schedulingTrip/startTrip.jsp";
	}
	
}
