package userpage.main;

import java.sql.Timestamp;

public class userDTO {
	
	private String user_id;
	private String name;
	private String pw;
	private String address;
	private String gender;
	private int year_birth;
	private String email;
	private Timestamp signupdate;
	private int num;         // 유저 상태 표시.
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getYear_birth() {
		return year_birth;
	}
	public void setYear_birth(int year_birth) {
		this.year_birth = year_birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
	
	public Timestamp getSignupdate() {
		return signupdate;
	}
	public void setSignupdate(Timestamp signupdate) {
		this.signupdate = signupdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

	
	
	
	
	
}
