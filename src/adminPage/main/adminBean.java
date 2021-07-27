package adminPage.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller  
public class adminBean {
	
	

	@Autowired
	private SqlSessionTemplate daosql =null;
	
	
	
	@RequestMapping("adminpage/index.do") 
	public String adminIndex(){
		
		return "/adminpage/index.jsp";
	}
	
	
	
	@RequestMapping("adminpage/userManage.do") 
	public String userManage(Model model){
		
		 List list2 = daosql.selectList("admin.all");
		
		 model.addAttribute("list2",list2);
		
		return "/adminpage/userManage.jsp";
	}
	
	@RequestMapping("chartPage.do") 
	public String chartPage(){
		
		return "/adminpage/chartPage.jsp";
	}
	
	
}
