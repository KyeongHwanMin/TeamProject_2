package userpage.main;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import userpage.main.userDAOInter;

@Service
public class userDAOImpl implements userDAOInter{
	
	@Autowired
    private SqlSessionTemplate userDAO = null;
	
	@Override
	public void insert(userDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		userDAO.insert("user.insert",dto);
	}

	@Override
	public int maxNum() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
