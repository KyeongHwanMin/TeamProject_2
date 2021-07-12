package jejuguseok_map;

public class DuplicateItemException extends Exception{
	//객체 직렬화를 위한 serial number id
	private static final long serialVersionUID = 1L;
	
	public DuplicateItemException() {
		super("해당 관광지는 중복되어, 찜할 수 없습니다.");
	}

}