package jejuguseok_map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import userpage.main.userDTO;

public class attractionDAOImpl implements attractionDAOInter {

	@Autowired
    private SqlSessionTemplate attractionDAO = null;
	
// 	관광지DB 추가 
	@Override
	public void insert(attractionDTO dto) throws Exception {
		
		attractionDAO.insert("item.insertAttraciton",dto);
}
	
// 	관광지DB 불러오기
	@Override
	public List getAttraction(int start, int end, String place_name, String place_address, String place_category, String Place_local,
		String place_no) throws Exception {

	return null;
}	


	
//	찜한 관광지 리스트(mypage에서 조회)
	@Override
	public void myAttraction(attractionDTO dto) throws Exception {
	}


}

