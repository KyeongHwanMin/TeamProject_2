package userpage.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service  // 서비스 빈 선언 
public class mypageDAOImpl implements mypageDAOInter {
	
	@Autowired
    private SqlSessionTemplate mypageDAO = null;

	@Override
	public Integer getMyTripCount(String user_id) {
		
		int count = (Integer)mypageDAO.selectOne(user_id);
		return count;
	}
	
	@Override
	public void memberUpdate(userDTO dto) throws Exception {
		// dto에 담긴 파라미터들은 memberMapper.xml에 memberMapper라는 namespace에 
		// 아이디가 memberUpdate인 쿼리에 파라미터들을 넣어줍니다.ee
		mypageDAO.update("user.memberUpdate", dto);
	}

	
	 //나의 정보 
	@Override
	public userDTO getMyInfo(String user_id) throws Exception {

		return mypageDAO.selectOne("user.myinfo", user_id); 
		
	}
	
	
	
}
