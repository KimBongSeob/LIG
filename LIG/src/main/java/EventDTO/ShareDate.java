package EventDTO;

import java.sql.Date;

public class ShareDate {
	
	private int group_id ;   //number not null,--그룹 ID
	private Date start_date; // date not null,--시작 날짜
	private Date end_date ; //date not null,--종료 날짜
	private String mem_id;
	
	private String subject; // varchar2(250), -- 글 제목
	private String share_content ;
	
	private String start;
	private String end;
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getShare_content() {
		return share_content;
	}
	public void setShare_content(String share_content) {
		this.share_content = share_content;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "ShareDate [group_id=" + group_id + ", start_date=" + start_date + ", end_date=" + end_date + ", mem_id="
				+ mem_id + ", subject=" + subject + ", share_content=" + share_content + ", start=" + start + ", end="
				+ end + "]";
	}
	
	
	
}	
