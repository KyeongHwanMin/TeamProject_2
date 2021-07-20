package jejuguseok_map;

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
	public void getList(attractionDTO dto) throws Exception{
		attractionDTO dto1 = attractionDAO.selectOne("item.getAttractionList",dto);
	}
	
//	찜한 관광지 리스트(mypage에서 조회)
	@Override
	public void myAttraction(attractionDTO dto) throws Exception {
	}
}

