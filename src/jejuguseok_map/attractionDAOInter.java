package jejuguseok_map;

import java.util.List;

public interface attractionDAOInter {

	public void insert(attractionDTO dto) throws Exception; 
	public void myAttraction(attractionDTO dto) throws Exception;
	
	List getAttraction(int start, int end, String place_name, String place_address, String place_category,
			String Place_local, String place_no) throws Exception;

}
