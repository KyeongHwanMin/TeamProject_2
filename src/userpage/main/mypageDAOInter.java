package userpage.main;

import java.util.List;

public interface mypageDAOInter { // "나의 여행"(마이페이지) 페이지 
	
	// 회원정보 수정
	public void memberUpdate(userDTO dto)throws Exception;

	// 내가 만든 여행일정 수 
	public Integer getMyTripCount(String user_id);
	
	public Integer getMycount(String user_id);
	
	//내 정보
	public userDTO getMyInfo(String user_id) throws Exception;

}
