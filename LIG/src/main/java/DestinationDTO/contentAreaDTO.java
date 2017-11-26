package DestinationDTO;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class contentAreaDTO {
	private int id; //후기 id
	private String contentid;//여행 id
	private String mem_id;//멤버 id
	private String nickname;// 회원 이름
	private String contentval;// 후기 내용
	private Timestamp sdate;// 작성날짜
	private Timestamp sub_sdate;// 작성날짜
	
	
	

	
	public String getSub_sdate() {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		return simple.format(sub_sdate);
	}
	public void setSub_sdate(Timestamp sub_sdate) {
		this.sub_sdate = sub_sdate;
	}
	public String getSdate() {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return simple.format(sdate);
	}
	public void setSdate(Timestamp sdate) {
		this.sdate = sdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContentval() {
		return contentval;
	}
	public void setContentval(String contentval) {
		this.contentval = contentval;
	}
	
	
}
