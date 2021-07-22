package userpage.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class otoDAOImpl implements otoDAOInter{
	
	@Autowired
	private SqlSessionTemplate otoDAO = null;
	
	@Override
	public void insertArticle(otoDTO dto) throws Exception {
		int num=dto.getNum();
		int ref=dto.getRef();
		int re_step=dto.getRe_step();
		int re_level=dto.getRe_level();
		int number=0;
		
		if (num!=0) 
		{ 
			re_step=re_step+1;
			re_level=re_level+1;
		}else{
			ref=number;
			re_step=0;
			re_level=0;
		}
	}
	
	@Override
	public void adminInsertArticle(otoDTO dto) throws Exception {
		
	}
	
	@Override
	public int getArticleCount() throws Exception {
		int x=0;
		
		return x; 
	}
	
	@Override
	public int userGetArticleCount(String id) throws Exception {
		int x = 0;
		
		return x;
	}
	
	@Override
	public List userGetArticles(String id, int start, int end) throws Exception {
		List articleList=null;
		
		return articleList;
	}
	
	@Override
	public otoDTO getArticle(int num , String id) throws Exception {
		otoDTO article=null;
		
		return article;
	}
	
	@Override
	public otoDTO updateGetArticle(int num) throws Exception {
		otoDTO article=null;
		
		return article;
	}
	
	@Override
	public int updateArticle(otoDTO dto) throws Exception {
		int x = 1;
		
		return x;
	}
	
	@Override
	public int deleteArticle(int num, String passwd) throws Exception {
		int x = 1;
		
		return x;
	}
	
	@Override
	public int deleteArticleOne(int num, String passwd) throws Exception {
		int x=-1;
		
		return x;
	}
	
	@Override
	public int passwdCheck(int num, String passwd) throws Exception {
		int x=-1;
		
		return x;
	}
	
	@Override
	public List getArticles(String id, int start, int end) throws Exception {
		List articleList = null;
			
		return articleList;
	}
	
	@Override
	public int getArticleCount(String col , String search) throws Exception {
		int x=0;
	
		return x;
	}
	
	@Override
	public List getArticles(String col , String search, int start, int end) throws Exception {
		List articleList=null;
		
		return articleList;
	}
	
	
}
