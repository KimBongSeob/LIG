package MemberManagementDTO;

import java.util.Date;
import java.text.SimpleDateFormat;


import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "rank", "mem_Id", "nickName", "email", "jumin", "hphone", "gender" })
public class PageRank {

	private int rank;
	private String mem_Id;	
	private String nickName;
	private String email;
	private Date jumin;
	private String hphone;
	private String gender;
	
	public PageRank() {}
	
	public PageRank(int rank, String mem_Id, String nickName, String email, Date jumin, String hphone,String gender) {	
		this.rank = rank;
		this.mem_Id = mem_Id;
		this.nickName = nickName;
		this.email = email;
		this.jumin = jumin;
		this.hphone = hphone;
		this.gender = gender;
	}
	
	
	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

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