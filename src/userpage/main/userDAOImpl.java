package userpage.main;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import userpage.main.userDAOInter;

@Service  // 서비스 빈 선언 
public class userDAOImpl implements userDAOInter{
	
	@Autowired
    private SqlSessionTemplate userDAO = null;
	
	
	// -- 회원가입 관련 
	@Override
	public void insert(userDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		userDAO.insert("user.insert",dto);
	}


	// //로그인 관련 메소드 (세션에 아이디와 비밀번호를 저장) 222
	@Override
	public userDTO loginCheck1(String user_id, String pw) {
		
						//	여기서 받을때 userDTO로 받아야함 
		//String result = userDAO.selectOne("user.login",user_id);
		userDTO dto = userDAO.selectOne("user.login",user_id);
		return dto;
	}
	


	@Override
	public userDTO login(String user_id,String pw, HttpSession session) throws Exception {
		
		userDTO dto = userDAO.selectOne("user.login",user_id);
		
		return dto;
	}
	
	


	// 회원가입 : 아이디 중복 체크 
	@Override
	public int idChk(userDTO dto) throws Exception {
		int result = userDAO.selectOne("user.idChk", dto);
		return result;
	}











	

}
