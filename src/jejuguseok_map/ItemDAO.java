package jejuguseok_map;

/*
 * 1. 관광지 정보 
 * insertAttraction: 관광지 정보 입력 
 * Place_name 관광지명
 * Place_nddress 관광지 주소
 * Place_content 관광지 정보 
 * Place_img 관광지 이미지 
 * 
 * 2. 숙소 정보 
 * 숙소명: home_name
 * 숙소 주소: home_address
 * 숙소 정보: home_content
 * 지역 분류: home_local
 * 숙소 분류: home_type
 * 숙소 분류: home_img
 */
public class ItemDAO {
	
	public boolean loginCheck(String id, String pw) {
		boolean result = false;
		if(id.equals("admin")) {
			result = true;
		}
		return result;
	}

}