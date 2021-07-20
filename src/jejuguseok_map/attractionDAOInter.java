package jejuguseok_map;

public interface attractionDAOInter {

	public void insert(attractionDTO dto) throws Exception; 
	public void myAttraction(attractionDTO dto) throws Exception;
	public void getList(attractionDTO dto) throws Exception;  
}
