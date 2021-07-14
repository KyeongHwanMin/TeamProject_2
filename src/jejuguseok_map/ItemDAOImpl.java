package jejuguseok_map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import jejuguseok_map.ItemDAOInter;

public class ItemDAOImpl implements ItemDAOInter{

	@Autowired
    private SqlSessionTemplate ItemDAO = null;
	
// 	관광지, 숙소 DB 추가 
	@Override
	public void insert(ItemDTO dto) throws Exception {
		
		ItemDAO.insert("Item.insert",dto);
		
	}
	
//	관광지, 숙소 DB 삭제 
	
}
