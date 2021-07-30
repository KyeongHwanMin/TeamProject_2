package jejuguseok_map;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import jejuguseok_map.locationDTO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
������ Bean: ���繮ȭ, �ڿ���ġ, ����ü���н�, �޽�����
list1: ������ ����(form) ������
list2: ������ pro ������ 

 * ����¡ ��� 
- ���� ������(current page = Ŭ���� ������) 
- String pageNum ~ : ù ������ 1(1~10 �ش� ������ �ޱ�) 
- if (pageNum == null) ~:  ������ �Է� x >  1������, �Է� �� null=if�� ���� ���� 
- int startRow ~:  (1-1) * 10 + 1 = 1
- int endRow ~: 1 * 10 = 10
- int count = 0; ��ü ������ ��
- int number= 0; ȭ�鿡 ���̴� �Խù� ��ȣ. 
  �Էµ� ��ȣ�� �ƴϸ� �����Ǹ� �������� emty ��ȣ�� üũ���� �ʴ´� ��, �Էµ� ��ȣ�� �ƴ� �Խù� ����� ���� ���̴� ��ȣ	
- HashMap Row = new HashMap(); : sql�� HashMap ����ؼ� startRow / endRow �̸����� ���� ������. 
 */
@Controller
public class attractionBean {

	
	@Autowired
	private SqlSessionTemplate dao =null;	
	
	
//	������ �ϸ�ũ: attform���� ���ϱ� Ŭ�� �� �ش� ������ �̵� �� ����(�˷����) 
	@RequestMapping("attbook.do") 
	public String attbook(Model model, locationDTO dto, int no,  String name, String category,
			HttpSession session)  throws Exception{
		
		String id =(String)session.getAttribute("user_id");
		System.out.println("������ ��ȣ: "+no);
		System.out.println("������ ����: "+category);
		System.out.println("������ �̸�: "+name);
		
		locationDTO att = new locationDTO();
		attBkDTO attBkDTO = new attBkDTO();
		att = dao.selectOne("att.selectAtt", no);
		
		attBkDTO.setUSER_ID(id);
		attBkDTO.setPLACE_NO(no);
		
		attBkDTO.setPLACE_NAME(att.getName());
		attBkDTO.setPLACE_ADDRESS(att.getAddress());
		attBkDTO.setPLACE_CATEGORY(att.getCategory());
		attBkDTO.setPLACE_CONTENT(att.getContent());
		attBkDTO.setPLACE_LOCAL(att.getLocation());
	
		dao.insert("att.insertAttmk", attBkDTO);
		
		return "/userpage/attraction/attBookMark.jsp";
	}
	
//	�ϸ�ŷ�� ������ ����Ʈ mypage���� ���� 
	@RequestMapping("myAtt.do")
	public String myAccom(String user_id, Model model, HttpSession session) {
		
		String id =(String) session.getAttribute("user_id");
		System.out.println("���̵� Ȯ��: "+id);
		
		int count = 0;
		attBkDTO attBkDTO = new attBkDTO();
		model.addAttribute("count", count);
		count = dao.selectOne("att.attCount", id);
		List myAttList = dao.selectList("att.myAtt", id);
		model.addAttribute("myAttList",myAttList);
		
		return "/userpage/attraction/myAttraction.jsp";
	}
	
	//�ϸ�ŷ ����(mypage����)  
	@RequestMapping("myAttDelete.do")
	public String myAccomDeletePro( String no, String name, HttpSession session,HttpServletRequest request)  throws Exception{
		
		dao.delete("att.deleteMyAtt", no);
		System.out.println("�ϸ�ŷ ����: "+ no +name);
		
		return "/userpage/mypage/myAttDelete.jsp"; 
	}
	
//	������ �˻� (����, ī�װ��� �˻�) + ����¡ 
	@RequestMapping("attForm.do")
	public String SearchForm(Model model, HttpServletRequest request) {
		
		int pageSize = 10;	
		
		String pageNum = request.getParameter("pageNum");	
		if (pageNum == null) { 
		    pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);		
		int startRow = (currentPage - 1) * pageSize + 1;	
		int endRow = currentPage * pageSize;				
		int count = 0;	
		int number= 0;

		List attList = null;
		count = dao.selectOne("att.attcount");
		
		System.out.println("����¡ üũ: "+count);
		
		HashMap Row = new HashMap();  
		Row.put("startRow", startRow);
		Row.put("endRow", endRow);

		if (count > 0) {
			attList = dao.selectList("att.attList", Row);
		}
		
		System.out.println("������ ����Ʈ: "+ attList);
		number=count-(currentPage-1)*pageSize;			
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("number", number);
		model.addAttribute("attList", attList); 
		model.addAttribute("pageNum", pageNum);

		List list1 = dao.selectList("item.searchAttraction"); 
		model.addAttribute("list1",list1);	

		return "/userpage/attraction/attractionSearchForm.jsp"; 
	}
	
//  ������ DB �ҷ����� 
	@RequestMapping("attPro.do")								  		
	public String attractionSearch_local(Model model, 
			HttpServletRequest request) throws IOException {
	
		int sea1 = Integer.parseInt(request.getParameter("search1"));
		String search1="���ֽ�";
		
		if(sea1 == 2){
			search1="��������";
			List list2 = dao.selectList("att.seoquiposi"); 
			 model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
		
		}else if(sea1==3){
			search1="�߹�";
			List list2 = dao.selectList("att.jungmun"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==4){
			search1="���ֱ�������";
			List list2 = dao.selectList("att.jejuairport"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==5){
			search1="�ֿ�/�Ѹ�/����";
			List list2 = dao.selectList("att.aweol"); 
			model.addAttribute("list2",list2);
			
			 return "/userpage/attraction/attractionSearchPro.jsp";
			
		}else if(sea1==6){
			search1="ǥ��/���";
			List list2 = dao.selectList("att.pyoseon"); 
			model.addAttribute("list2",list2);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
			 
		}else if(sea1==7){ 
			search1="�Դ�/���/��ȭ";
			List list2 = dao.selectList("att.hamduk"); 
			model.addAttribute("list2",list2);
			
			return "/userpage/attraction/attractionSearchPro.jsp";
		}
		List list2 = dao.selectList("att.jejusi"); 
		model.addAttribute("list2",list2);
		 
		return "/userpage/attraction/attractionSearchPro.jsp";
	}
	
//	������ �̹������� ���� �� Db ���ε� 
	
	@RequestMapping("attractionForm.do")
	public String uploadForm() {
		
		return "/adminpage/upload/attractionForm.jsp"; 
	}
	@RequestMapping("attractionPro.do")
	public String pro(String name, String address, String x, String y, String content, 
			String location, String category, String type, MultipartHttpServletRequest ms) {
		MultipartFile mf = ms.getFile("img"); // ���� ����
		String fileName = mf.getOriginalFilename(); // ���� ���� �̸�
		File f = new File("/WEB-INF/userpage/save"+fileName); // ���� ��ġ
		
		try {
			mf.transferTo(f); // ����
		}catch(Exception e) {
			e.printStackTrace();
		}
		ms.setAttribute("filename",fileName);
		
		Object img1 = (Object)f;
		String img = String.valueOf(img1);
		
		locationDTO lo = new locationDTO();
		lo.setAddress(address);
		lo.setCategory(category);
		lo.setContent(content);
		lo.setImg(img);
		lo.setLocation(location);
		lo.setName(name);
		lo.setType(type);
		lo.setX(x);
		lo.setY(y);
		dao.insert("item.insertAtt",lo);
		System.out.println(f);
		return "/adminpage/upload/attractionPro.jsp";
	}

//	6. ���� ������ ���� (mypage����) 	
	@RequestMapping("myAttraction.do")
	public String myAttraction(String name, String address, String category) {
		
		return "/userpage/attraction/myAttraction.jsp";
	}
	
// 	������ ���� (������ID) 
	@RequestMapping("attUpdate.do")
	public String attUpdate(String name, String address, String category) {
		
		homeDTO dto = new homeDTO();
	//	dto = dao.selectOne("home.homeInfo", home_no);
	//	model.addAttribute("dto", dto);
		
		return "/adminpage/upload/attUpdate.jsp";
	}
}
	

