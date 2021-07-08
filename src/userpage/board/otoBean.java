package userpage.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

public class otoBean {
	
	@Controller
	public class BoardDAO {

		@Autowired
		private SqlSessionTemplate dao = null;
		
		@RequestMapping("/mybatis/list.do")
		public String form() {
			
			return "/board/list";
		}
	}

}
