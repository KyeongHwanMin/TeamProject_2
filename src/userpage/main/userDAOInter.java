package userpage.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import userpage.main.userDTO;

public interface userDAOInter {
	
	//회원 테이블에 이름,아이디,비번,이메일, 주소 ,성별 을 입력한다.   
	public void insert(userDTO dto) throws Exception;  // 
	
	// 회원  테이블에 maxNum 값을 리턴 받는다. 
	public int maxNum() throws Exception;
	
	
	// 로그인 관련 메서드 추가  
	// 가입할때 insert 만든것처럼 여기에 메서드 추가하고 .. impl 클래스 에서 구현하고.. 
	public boolean loginCheck(String user_id, String pw) throws Exception;

	
	
	
}
