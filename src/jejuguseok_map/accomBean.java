package jejuguseok_map;

import java.util.HashMap;
import java.util.List; 

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

 
/* ������ work. 
 *   
 * ���� Bean: ����/������ �з� 
 * 1 ����: ����, �Խ�Ʈ�Ͽ콺, ���, ȣ��
 * 2 ����: ���ֽ�, ��������, �߹�, ���ֱ�������, �ֿ�/�Ѹ�/����, ǥ��/���, �Դ�/���/��ȭ 
 */
@Controller
public class accomBean {
	
	@Autowired
	private SqlSessionTemplate dao =null;
	
	
	
	// ���� ������
	@RequestMapping("accom.do")
	public String accom(Model model, HttpServletRequest request){
		
		int pageSize = 5;	// �� �������� ������ �Խù� �� 
		
		//������ ��ũ�� Ŭ���� ��ȣ �� ���� ������ 
		String pageNum = request.getParameter("pageNum");	// ����Ʈ���� ������ ��ȣ�� Ŭ�� �� ���� �� �ִ�.(�������� ó���� Ŭ������ �ʴ´�.)
		String category = request.getParameter("category");	// ����Ʈ���� ������ ��ȣ�� Ŭ�� �� ���� �� �ִ�.(�������� ó���� Ŭ������ �ʴ´�.)
		
		if(category==null) {
			category="all";
		}
		if (pageNum == null) {	// �������� �Է� ���ϸ� 1������.. �Է��ϸ� null�� �ƴϹǷ� if�� ���������ʴ´�.
		    pageNum = "1";
		}
		
		
		int currentPage = Integer.parseInt(pageNum);		// 1.. ����(string)Ÿ������ ������ ��ȯ

		int startRow = (currentPage - 1) * pageSize + 1;	// (1-1) * 10 + 1 = 1
		int endRow = currentPage * pageSize;				// 1 * 10 = 10
		int count = 0;	// ��ü �Խù� ��
		int number= 0;	// ȭ�鿡 ���̴� �Խù� ��ȣ. �Է��� ��ȣ�� �ٸ��� ���� �� �������� �� ��ȣ�� ä���� �ʴ´� ��, ����� ��ȣ�� �ƴ� ���̴� ��ȣ
		
		List articleList = null;
		count = dao.selectOne("home.homecount");
		
		System.out.println("ī��Ʈ~~~"+count);
		
		HashMap Row = new HashMap();  // sql�� HashMap ����ؼ� startRow / endRow �̸����� ���� ������. 
		Row.put("startRow", startRow);
		Row.put("endRow", endRow);
		
		if (count > 0) {
			articleList = dao.selectList("home.articleList", Row);
		}
		
		number=count-(currentPage-1)*pageSize;	// ��ü �Խù� �� - (������ - 1) * 10  = 
			
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("articleList", articleList); //list3 ���� 
		model.addAttribute("pageNum", pageNum);


		 //List list3 = dao.selectList("item.myHome"); 
		
		//List list3 = dao.selectList("item.articleList");
		// model.addAttribute("list3",list3);
		
		return "/userpage/home/accom.jsp"; 
	}
	
	
	// ���� ������ - ���� �����ϱ� ������ 
	@RequestMapping("accomLocal.do")
	public String accomLocal(Model model, HttpServletRequest request){
		
		int se= Integer.parseInt(request.getParameter("search"));
		System.out.println("���!!"+se);
		
		String search="���ֽ�";
		
		
		if(se == 2){
			search="��������";
			List slist = dao.selectList("home.seoquiposi"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
					 
		}else if(se==3){
			search="�߹�";
			List slist = dao.selectList("home.jungmun"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
		}else if(se==4){
			search="���ֱ�������";
			List slist = dao.selectList("home.jejuairport"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
			
		}else if(se==5){
			search="�ֿ�/�Ѹ�/����";
			List slist = dao.selectList("home.aweol"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
			
		}else if(se==6){
			search="ǥ��/���";
			List slist = dao.selectList("home.pyoseon"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
			 
		}else if(se==7){   //hamduk
			search="�Դ�/���/��ȭ";
			List slist = dao.selectList("home.hamduk"); 
			 model.addAttribute("slist",slist);
			
			 return "/userpage/home/accomLocal.jsp"; 
		}
		
		
		List slist = dao.selectList("home.jejusi"); 
		 model.addAttribute("slist",slist);
		
		return "/userpage/home/accomLocal.jsp"; 
	}
	
	
	//���� ���ϱ� ��ư ������ ���� ������. ������ pro 
	// accom.do���� ���ϱ� ������ ��ũ��Ʈ�� �߰� �� ������(accom.do)�� ���ƿ´� (���ϱⰡ ��ϵǾ����ϴ�! [Ȯ��] ) 
	
	@RequestMapping("accomBookMK.do")  //accomBookMKdto 
	public String accomBookMK(locationDTO dto , int no, HttpSession session,Model model, HttpServletRequest request)  throws Exception{
		System.out.println("no==========="+ no);  
		String id = (String) session.getAttribute("user_id");
		System.out.println("id==========="+ id);  
		
		locationDTO DD = new locationDTO();
		accomBookMKdto mkdto = new accomBookMKdto();  
		
		DD = dao.selectOne("home.selecthome", no); 
  
		mkdto.setUser_id(id);
		mkdto.setHome_no(no);
		System.out.println("DD.getNo()==========="+ DD.getNo());
		mkdto.setHome_name(DD.getName());
		mkdto.setHome_content(DD.getContent());
		mkdto.setHome_type(DD.getCategory());
		mkdto.setHome_local(DD.getLocation());
		mkdto.setHome_img(DD.getImg());
		mkdto.setHome_address(DD.getAddress());
		
		dao.insert("home.insertMK", mkdto);
		
	
		return "/userpage/home/accomBookMK.jsp"; 
	}
	
	
	//���� ���� ���� ����Ʈ
	@RequestMapping("myAccom.do")
	public String myAccom(String user_id, Model model, HttpSession session){
		
		String id = (String) session.getAttribute("user_id");
		System.out.println("���̵� ==="+id);
		
		accomBookMKdto dto = new accomBookMKdto();
		int count = 0;
		count =dao.selectOne("home.count", id);
		System.out.println("ī� ��~~~"+count);
		
		model.addAttribute("count",count);
		List myAccomList = dao.selectList("home.myAccom", id); 
		
		 model.addAttribute("myAccomList",myAccomList);
		
		return "/userpage/mypage/myAccom.jsp"; 
	}
	
	
	//���ϱ� Ǯ�� 
	@RequestMapping("myAccomDeletePro.do")  //myAccomDeletePro
	public String myAccomDeletePro( int no, HttpSession session,HttpServletRequest request)  throws Exception{
		
		dao.delete("home.deleteMK", no);
		
		
		return "/userpage/mypage/myAccomDeletePro.jsp"; 
	}
	
	
}
