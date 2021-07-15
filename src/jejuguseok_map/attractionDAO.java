package jejuguseok_map;

public class attractionDAO {

	public boolean loginCheck(String id, String pw) {
		boolean result = false;
		if(id.equals("admin")) {
			result = true;
		}
		return result;
	}
}
