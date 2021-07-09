package userpage.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import userpage.main.userDTO;

	
	// 로그인 관련 메서드 추가  
	// 가입할때 insert 만든것처럼 여기에 메서드 추가하고 .. impl 클래스 에서 구현하고.. 
	//public boolean loginCheck(String user_id, String pw) throws Exception; // 실패 ...

	

public interface userDAOInter {
	
	//회원 테이블에 이름,아이디,비번,이메일, 주소 ,성별 을 입력한다.   
	public void insert(userDTO dto) throws Exception;  // 회원가입 관련 
	

	public userDTO loginCheck1(String user_id, String pw); ////로그인 관련22    
	
	
	public userDTO login(String user_id ,String pw, HttpSession session) throws Exception;    
	
	
	public String find_idCheck(userDTO dto);    //아이디 찾기 관련
	public String find_passCheck(userDTO dto);    //비밀번호 찾기 관련

	



	
	

	


	
	
	
}
