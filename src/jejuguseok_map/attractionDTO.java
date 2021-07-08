package jejuguseok_map;

import java.sql.Timestamp;
/*
 *  관광지 테마별 dto 
 */
public class attractionDTO {
	

	private String healing;
	private String history;
	private String leisure;
	private String nautre;
	private Timestamp att_date;
	
	public String getHealing() {
		return healing;
	}
	public void setHealing(String healing) {
		this.healing = healing;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public String getLeisure() {
		return leisure;
	}
	public void setLeisure(String leisure) {
		this.leisure = leisure;
	}
	public String getNautre() {
		return nautre;
	}
	public void setNautre(String nautre) {
		this.nautre = nautre;
	}
	public Timestamp getAtt_date() {
		return att_date;
	}
	public void setAtt_date(Timestamp att_date) {
		this.att_date = att_date;
	}

	
}
