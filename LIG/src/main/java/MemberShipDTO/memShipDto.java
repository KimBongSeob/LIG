package MemberShipDTO;

import java.text.SimpleDateFormat;
import java.util.Date;

public class memShipDto {
	private String mem_Id;	
	private String nickName;
	private String email;
	private String passwd;
	private Date jumin;
	private String hphone;
	private String gender;
	
	
	public String getMem_Id() {
		return mem_Id;
	}
	public void setMem_Id(String mem_Id) {
		this.mem_Id = mem_Id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getJumin() {
		//고쳐야됨
		SimpleDateFormat simple = new SimpleDateFormat("yyyy/MM/dd");
		return simple.format(jumin);
	}
	public void setJumin(Date jumin) {
		this.jumin = jumin;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
}
