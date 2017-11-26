package EventDTO;

import java.sql.Date;

public class EventDTO {
	private String regist_id;
	private String group_id;
	private String mem_id;
	private String subject;
	private int day_no;
	private Date start_date;
	private Date end_date;
	private int dest_id_1;
	private int dest_id_2;
	private int dest_id_3;
	private int dest_id_4;
	private int dest_id_5;
	
	private String dest_name_1 ; //varchar2(500),--여행지 이름
	private String dest_name_2 ; //varchar2(500),--여행지 이름
	private String dest_name_3 ;//varchar2(500),--여행지 이름
	private String dest_name_4 ; //varchar2(500),--여행지 이름
	private String dest_name_5 ; //varchar2(500),--여행지 이름
	private String basic_addr_1; // varchar(500),--주소
	private String basic_addr_2 ; //varchar(500),--주소
	private String basic_addr_3; // varchar(500),--주소
	private String basic_addr_4; // varchar(500),--주소
	private String basic_addr_5; // varchar(500),--주소
	private String detail_addr_1; // varchar(100),--상세 주소
	private String detail_addr_2 ; //varchar(100),--상세 주소
	private String detail_addr_3 ; //varchar(100),--상세 주소
	private String detail_addr_4; // varchar(100),--상세 주소
	private String detail_addr_5 ; //varchar(100),--상세 주소
	private Integer code_content_1 ; //number,--관광지 ID 1
	private Integer code_content_2 ; // number, --관광지 ID 2
	private Integer code_content_3 ; // number,--관광지 ID 3
	private Integer code_content_4  ; //number,--관광지 ID 4
	private Integer code_content_5 ; //number,--관광지 ID 5
	private Integer code_area1 ; //number,--지역 ID 1
	private Integer code_area2; // number,--지역 ID 2
	private Integer code_area3; // number,--지역 ID 3
	private Integer code_area4 ; //number,--지역 ID 4
	private Integer code_area5 ; //number,--지역 ID 5
	private Integer code_sigungu_1; // number, --시군구 ID 1
	private Integer code_sigungu_2 ; //number, --시군구 ID 2
	private Integer code_sigungu_3; // number, --시군구 ID 3
	private Integer code_sigungu_4; // number, --시군구 ID 4
	private Integer code_sigungu_5 ; //number --시군구 ID 5
	
	

	
	public EventDTO() {

	}

	public EventDTO(String regist_id, String group_id, String mem_id, String subject, int day_no, Date start_date,
			Date end_date, int dest_id_1) {
		this.regist_id = regist_id;
		this.group_id = group_id;
		this.mem_id = mem_id;
		this.subject = subject;
		this.day_no = day_no;
		this.start_date = start_date;
		this.end_date = end_date;
		this.dest_id_1 = dest_id_1;
	}

	public String getRegist_id() {
		return regist_id;
	}

	public void setRegist_id(String regist_id) {
		this.regist_id = regist_id;
	}

	public String getGroup_id() {
		return group_id;
	}

	public void setGroup_id(String group_id) {
		this.group_id = group_id;
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

	public int getDay_no() {
		return day_no;
	}

	public void setDay_no(int day_no) {
		this.day_no = day_no;
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

	public int getDest_id_1() {
		return dest_id_1;
	}

	public void setDest_id_1(int dest_id_1) {
		this.dest_id_1 = dest_id_1;
	}

	public int getDest_id_2() {
		return dest_id_2;
	}

	public void setDest_id_2(int dest_id_2) {
		this.dest_id_2 = dest_id_2;
	}

	public int getDest_id_3() {
		return dest_id_3;
	}

	public void setDest_id_3(int dest_id_3) {
		this.dest_id_3 = dest_id_3;
	}

	public int getDest_id_4() {
		return dest_id_4;
	}

	public void setDest_id_4(int dest_id_4) {
		this.dest_id_4 = dest_id_4;
	}

	public int getDest_id_5() {
		return dest_id_5;
	}

	public void setDest_id_5(int dest_id_5) {
		this.dest_id_5 = dest_id_5;
	}

	public String getDest_name_1() {
		return dest_name_1;
	}

	public void setDest_name_1(String dest_name_1) {
		this.dest_name_1 = dest_name_1;
	}

	public String getDest_name_2() {
		return dest_name_2;
	}

	public void setDest_name_2(String dest_name_2) {
		this.dest_name_2 = dest_name_2;
	}

	public String getDest_name_3() {
		return dest_name_3;
	}

	public void setDest_name_3(String dest_name_3) {
		this.dest_name_3 = dest_name_3;
	}

	public String getDest_name_4() {
		return dest_name_4;
	}

	public void setDest_name_4(String dest_name_4) {
		this.dest_name_4 = dest_name_4;
	}

	public String getDest_name_5() {
		return dest_name_5;
	}

	public void setDest_name_5(String dest_name_5) {
		this.dest_name_5 = dest_name_5;
	}

	public String getBasic_addr_1() {
		return basic_addr_1;
	}

	public void setBasic_addr_1(String basic_addr_1) {
		this.basic_addr_1 = basic_addr_1;
	}

	public String getBasic_addr_2() {
		return basic_addr_2;
	}

	public void setBasic_addr_2(String basic_addr_2) {
		this.basic_addr_2 = basic_addr_2;
	}

	public String getBasic_addr_3() {
		return basic_addr_3;
	}

	public void setBasic_addr_3(String basic_addr_3) {
		this.basic_addr_3 = basic_addr_3;
	}

	public String getBasic_addr_4() {
		return basic_addr_4;
	}

	public void setBasic_addr_4(String basic_addr_4) {
		this.basic_addr_4 = basic_addr_4;
	}

	public String getBasic_addr_5() {
		return basic_addr_5;
	}

	public void setBasic_addr_5(String basic_addr_5) {
		this.basic_addr_5 = basic_addr_5;
	}

	public String getDetail_addr_1() {
		return detail_addr_1;
	}

	public void setDetail_addr_1(String detail_addr_1) {
		this.detail_addr_1 = detail_addr_1;
	}

	public String getDetail_addr_2() {
		return detail_addr_2;
	}

	public void setDetail_addr_2(String detail_addr_2) {
		this.detail_addr_2 = detail_addr_2;
	}

	public String getDetail_addr_3() {
		return detail_addr_3;
	}

	public void setDetail_addr_3(String detail_addr_3) {
		this.detail_addr_3 = detail_addr_3;
	}

	public String getDetail_addr_4() {
		return detail_addr_4;
	}

	public void setDetail_addr_4(String detail_addr_4) {
		this.detail_addr_4 = detail_addr_4;
	}

	public String getDetail_addr_5() {
		return detail_addr_5;
	}

	public void setDetail_addr_5(String detail_addr_5) {
		this.detail_addr_5 = detail_addr_5;
	}

	public Integer getCode_content_1() {
		return code_content_1;
	}

	public void setCode_content_1(Integer code_content_1) {
		this.code_content_1 = code_content_1;
	}

	public Integer getCode_content_2() {
		return code_content_2;
	}

	public void setCode_content_2(Integer code_content_2) {
		this.code_content_2 = code_content_2;
	}

	public Integer getCode_content_3() {
		return code_content_3;
	}

	public void setCode_content_3(Integer code_content_3) {
		this.code_content_3 = code_content_3;
	}

	public Integer getCode_content_4() {
		return code_content_4;
	}

	public void setCode_content_4(Integer code_content_4) {
		this.code_content_4 = code_content_4;
	}

	public Integer getCode_content_5() {
		return code_content_5;
	}

	public void setCode_content_5(Integer code_content_5) {
		this.code_content_5 = code_content_5;
	}

	public Integer getCode_area1() {
		return code_area1;
	}

	public void setCode_area1(Integer code_area1) {
		this.code_area1 = code_area1;
	}

	public Integer getCode_area2() {
		return code_area2;
	}

	public void setCode_area2(Integer code_area2) {
		this.code_area2 = code_area2;
	}

	public Integer getCode_area3() {
		return code_area3;
	}

	public void setCode_area3(Integer code_area3) {
		this.code_area3 = code_area3;
	}

	public Integer getCode_area4() {
		return code_area4;
	}

	public void setCode_area4(Integer code_area4) {
		this.code_area4 = code_area4;
	}

	public Integer getCode_area5() {
		return code_area5;
	}

	public void setCode_area5(Integer code_area5) {
		this.code_area5 = code_area5;
	}

	public Integer getCode_sigungu_1() {
		return code_sigungu_1;
	}

	public void setCode_sigungu_1(Integer code_sigungu_1) {
		this.code_sigungu_1 = code_sigungu_1;
	}

	public Integer getCode_sigungu_2() {
		return code_sigungu_2;
	}

	public void setCode_sigungu_2(Integer code_sigungu_2) {
		this.code_sigungu_2 = code_sigungu_2;
	}

	public Integer getCode_sigungu_3() {
		return code_sigungu_3;
	}

	public void setCode_sigungu_3(Integer code_sigungu_3) {
		this.code_sigungu_3 = code_sigungu_3;
	}

	public Integer getCode_sigungu_4() {
		return code_sigungu_4;
	}

	public void setCode_sigungu_4(Integer code_sigungu_4) {
		this.code_sigungu_4 = code_sigungu_4;
	}

	public Integer getCode_sigungu_5() {
		return code_sigungu_5;
	}

	public void setCode_sigungu_5(Integer code_sigungu_5) {
		this.code_sigungu_5 = code_sigungu_5;
	}

	@Override
	public String toString() {
		return "EventDTO [regist_id=" + regist_id + ", group_id=" + group_id + ", mem_id=" + mem_id + ", subject="
				+ subject + ", day_no=" + day_no + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", dest_id_1=" + dest_id_1 + ", dest_id_2=" + dest_id_2 + ", dest_id_3=" + dest_id_3 + ", dest_id_4="
				+ dest_id_4 + ", dest_id_5=" + dest_id_5 + ", dest_name_1=" + dest_name_1 + ", dest_name_2="
				+ dest_name_2 + ", dest_name_3=" + dest_name_3 + ", dest_name_4=" + dest_name_4 + ", dest_name_5="
				+ dest_name_5 + ", basic_addr_1=" + basic_addr_1 + ", basic_addr_2=" + basic_addr_2 + ", basic_addr_3="
				+ basic_addr_3 + ", basic_addr_4=" + basic_addr_4 + ", basic_addr_5=" + basic_addr_5
				+ ", detail_addr_1=" + detail_addr_1 + ", detail_addr_2=" + detail_addr_2 + ", detail_addr_3="
				+ detail_addr_3 + ", detail_addr_4=" + detail_addr_4 + ", detail_addr_5=" + detail_addr_5
				+ ", code_content_1=" + code_content_1 + ", code_content_2=" + code_content_2 + ", code_content_3="
				+ code_content_3 + ", code_content_4=" + code_content_4 + ", code_content_5=" + code_content_5
				+ ", code_area1=" + code_area1 + ", code_area2=" + code_area2 + ", code_area3=" + code_area3
				+ ", code_area4=" + code_area4 + ", code_area5=" + code_area5 + ", code_sigungu_1=" + code_sigungu_1
				+ ", code_sigungu_2=" + code_sigungu_2 + ", code_sigungu_3=" + code_sigungu_3 + ", code_sigungu_4="
				+ code_sigungu_4 + ", code_sigungu_5=" + code_sigungu_5 + "]";
	}

	


	
	

	
	
	
	

}
