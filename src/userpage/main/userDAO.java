package userpage.main;

public class userDAO {
	
	public boolean loginCheck(String user_id, String pw) {
		boolean result=false;
		if(user_id.equals("admin")) {
			result = true;
		}
		return result;
	}
	
	
}
