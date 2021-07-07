package userpage.main;

import userpage.main.userDTO;

public interface userDAOInter {
	
	//회원 테이블에 num, writer, content, reg  정보를 추가한다.
	public void insert(userDTO dto) throws Exception;
	
	// 회원  테이블에 maxNum 값을 리턴 받는다. 
	public int maxNum() throws Exception;
	
}
