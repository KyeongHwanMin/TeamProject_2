package jejuguseok_map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class homeDAOImpl implements homeDAOInter{

	@Autowired
    private SqlSessionTemplate homeDAO = null;
	
// 	관광지DB 추가 
	@Override
	public void insert(homeDTO dto) throws Exception {
		
		homeDAO.insert("item.insertHome",dto);
}
//	찜한 관광지, 숙소 리스트(mypage에서 조회)
	@Override
	public void myHome(homeDTO dto) throws Exception {
	}
}


