package jejuguseok_map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class attractionDAOImpl implements attractionDAOInter {

	@Autowired
    private SqlSessionTemplate attractionDAO = null;
	
// 	관광지DB 추가 
	@Override
	public void insert(attractionDTO dto) throws Exception {
		
		attractionDAO.insert("item.insertAttraciton",dto);
}
//	찜한 관광지, 숙소 리스트(mypage에서 조회)
	@Override
	public void myAttraction(attractionDTO dto) throws Exception {
	}
}

