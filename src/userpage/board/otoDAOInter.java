package userpage.board;

import java.util.List;

public interface otoDAOInter {
	
	// 글쓰기 관련
	public void insertArticle(otoDTO dto) throws Exception;
	
	// 어드민 글쓰기 관련
	void adminInsertArticle(otoDTO dto) throws Exception;
	
	// board 테이블에 전체 레코드수 리턴
	int getArticleCount() throws Exception;
	
	// 자신의 아이디와 같은 레코드수 리턴
	int userGetArticleCount(String id) throws Exception;
	
	// 자신의 아이디와 같은 게시물 조회
	List userGetArticles(String id, int start, int end) throws Exception;
	
	// 조회수 증가 문의 상태 변경
	otoDTO getArticle(int num, String id) throws Exception;

	// 게시물 수정 view 페이지 관련
	otoDTO updateGetArticle(int num) throws Exception;
	
	// 게시물 수정 비밀번호 확인
	int updateArticle(otoDTO dto) throws Exception;
	
	// 게시물&답글 지우기
	int deleteArticle(int num, String passwd) throws Exception;
	
	// 답글만 지우기
	int deleteArticleOne(int num, String passwd) throws Exception;

	// 게시물 패스워드 확인
	int passwdCheck(int num, String passwd) throws Exception;
	
	// 어드민 전체 게시물 불러오기
	List getArticles(String id, int start, int end) throws Exception;

	// 게시물 검색
	int getArticleCount(String col, String search) throws Exception;
	
	// 검색한 게시물 조회
	List getArticles(String col, String search, int start, int end) throws Exception;
	
	
}
