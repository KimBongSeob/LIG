package MyPageDTO;

import java.text.SimpleDateFormat;
import java.sql.Date;

public class MyPageDTO {

	private String mem_id;
	private String nickName;
	private String email;
	private String passwd;
	private Date jumin;
	private String hphone;
	private String gender;
	
	private Date sub_jumin;
	
	
	
	public String getSub_jumin() {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		return simple.format(sub_jumin);
	}
	public void setSub_jumin(Date sub_jumin) {
		this.sub_jumin = sub_jumin;
	}
	public MyPageDTO() {}
	public MyPageDTO(String mem_id,String passwd) {
		super();
		this.mem_id = mem_id;
		this.passwd = passwd;
	}

	public MyPageDTO(String mem_id, String nickName, String passwd, String hphone) {
		super();
		this.mem_id = mem_id;
		this.nickName = nickName;
		this.passwd = passwd;
		this.hphone = hphone;
	}


	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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
