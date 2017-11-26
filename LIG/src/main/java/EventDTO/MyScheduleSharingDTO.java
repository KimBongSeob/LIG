package EventDTO;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class MyScheduleSharingDTO {
	private int share_id;//--공유 ID
	private int  group_id;//--그룹 ID
	private String mem_id;//--회원ID
	private String nickname;//회원 이름
	private int  day_no;//--일차 NO
	private Date start_date;//--시작 날짜
	private Date end_date;//--종료 날짜
	private String subject; // 글 제목
	private String share_content;//글 내용
	private int dest_id_1;//--여행지 ID 1
	private int dest_id_2;//--여행지 ID 2
	private int dest_id_3;//--여행지 ID 3
	private int dest_id_4;//--여행지 ID 4
	private int dest_id_5;//--여행지 ID 5
	private String dest_name_1;// 여행지 이름 1
	private String dest_name_2;// 여행지 이름 2
	private String dest_name_3;// 여행지 이름 3
	private String dest_name_4;// 여행지 이름 4
	private String dest_name_5;// 여행지 이름 5
	private String basic_addr_1;//--주소 1
	private String basic_addr_2;//--주소 2
	private String basic_addr_3;//--주소 3
	private String basic_addr_4;//--주소 4
	private String basic_addr_5;//--주소 5
	private String detail_addr_1;//--상세 주소 1
	private String detail_addr_2;//--상세 주소 2
	private String detail_addr_3;//--상세 주소 3
	private String detail_addr_4;//--상세 주소 4
	private String detail_addr_5;//--상세 주소 5
	private int code_content_1;//--관광지 ID 1
	private int code_content_2;//--관광지 ID 2
	private int code_content_3;//--관광지 ID 3
	private int code_content_4;//--관광지 ID 4
	private int code_content_5;//--관광지 ID 5
	private int code_area1;//--지역 ID 1
	private int code_area2;//--지역 ID 2
	private int code_area3;//--지역 ID 3
	private int code_area4;//--지역 ID 4
	private int code_area5;//--지역 ID 5
	private int code_sigungu_1;//--시군구 ID 1
	private int code_sigungu_2;//--시군구 ID 2
	private int code_sigungu_3;//--시군구 ID 3
	private int code_sigungu_4;//--시군구 ID 4
	private int code_sigungu_5;//--시군구 ID 5
	
	/////////////////////
	private String firstimage;// 이미지 1
	
	public MyScheduleSharingDTO() {}
	public MyScheduleSharingDTO(int share_id, int group_id, String mem_id, String nickname, int day_no, Date start_date, Date end_date,
			String subject, String share_content, int dest_id_1, int dest_id_2, int dest_id_3, int dest_id_4,
			int dest_id_5, String dest_name_1, String dest_name_2, String dest_name_3, String dest_name_4,
			String dest_name_5, String basic_addr_1, String basic_addr_2, String basic_addr_3, String basic_addr_4,
			String basic_addr_5, String detail_addr_1, String detail_addr_2, String detail_addr_3, String detail_addr_4,
			String detail_addr_5, int code_content_1, int code_content_2, int code_content_3, int code_content_4,
			int code_content_5, int code_area1, int code_area2, int code_area3, int code_area4, int code_area5,
			int code_sigungu_1, int code_sigungu_2, int code_sigungu_3, int code_sigungu_4, int code_sigungu_5,String firstimage) {
		super();
		this.share_id = share_id;
		this.group_id = group_id;
		this.mem_id = mem_id;
		this.nickname = nickname;
		this.day_no = day_no;
		this.start_date = start_date;
		this.end_date = end_date;
		this.subject = subject;
		this.share_content = share_content;
		this.dest_id_1 = dest_id_1;
		this.dest_id_2 = dest_id_2;
		this.dest_id_3 = dest_id_3;
		this.dest_id_4 = dest_id_4;
		this.dest_id_5 = dest_id_5;
		this.dest_name_1 = dest_name_1;
		this.dest_name_2 = dest_name_2;
		this.dest_name_3 = dest_name_3;
		this.dest_name_4 = dest_name_4;
		this.dest_name_5 = dest_name_5;
		this.basic_addr_1 = basic_addr_1;
		this.basic_addr_2 = basic_addr_2;
		this.basic_addr_3 = basic_addr_3;
		this.basic_addr_4 = basic_addr_4;
		this.basic_addr_5 = basic_addr_5;
		this.detail_addr_1 = detail_addr_1;
		this.detail_addr_2 = detail_addr_2;
		this.detail_addr_3 = detail_addr_3;
		this.detail_addr_4 = detail_addr_4;
		this.detail_addr_5 = detail_addr_5;
		this.code_content_1 = code_content_1;
		this.code_content_2 = code_content_2;
		this.code_content_3 = code_content_3;
		this.code_content_4 = code_content_4;
		this.code_content_5 = code_content_5;
		this.code_area1 = code_area1;
		this.code_area2 = code_area2;
		this.code_area3 = code_area3;
		this.code_area4 = code_area4;
		this.code_area5 = code_area5;
		this.code_sigungu_1 = code_sigungu_1;
		this.code_sigungu_2 = code_sigungu_2;
		this.code_sigungu_3 = code_sigungu_3;
		this.code_sigungu_4 = code_sigungu_4;
		this.code_sigungu_5 = code_sigungu_5;
		this.firstimage = firstimage;
	}
	
	
	public int getShare_id() {
		return share_id;
	}
	public void setShare_id(int share_id) {
		this.share_id = share_id;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
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
	public int getDay_no() {
		return day_no;
	}
	public void setDay_no(int day_no) {
		this.day_no = day_no;
	}
	public String getStart_date() {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		return simple.format(start_date);
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		return simple.format(end_date);
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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
	public int getCode_content_1() {
		return code_content_1;
	}
	public void setCode_content_1(int code_content_1) {
		this.code_content_1 = code_content_1;
	}
	public int getCode_content_2() {
		return code_content_2;
	}
	public void setCode_content_2(int code_content_2) {
		this.code_content_2 = code_content_2;
	}
	public int getCode_content_3() {
		return code_content_3;
	}
	public void setCode_content_3(int code_content_3) {
		this.code_content_3 = code_content_3;
	}
	public int getCode_content_4() {
		return code_content_4;
	}
	public void setCode_content_4(int code_content_4) {
		this.code_content_4 = code_content_4;
	}
	public int getCode_content_5() {
		return code_content_5;
	}
	public void setCode_content_5(int code_content_5) {
		this.code_content_5 = code_content_5;
	}
	public int getCode_area1() {
		return code_area1;
	}
	public void setCode_area1(int code_area1) {
		this.code_area1 = code_area1;
	}
	public int getCode_area2() {
		return code_area2;
	}
	public void setCode_area2(int code_area2) {
		this.code_area2 = code_area2;
	}
	public int getCode_area3() {
		return code_area3;
	}
	public void setCode_area3(int code_area3) {
		this.code_area3 = code_area3;
	}
	public int getCode_area4() {
		return code_area4;
	}
	public void setCode_area4(int code_area4) {
		this.code_area4 = code_area4;
	}
	public int getCode_area5() {
		return code_area5;
	}
	public void setCode_area5(int code_area5) {
		this.code_area5 = code_area5;
	}
	public int getCode_sigungu_1() {
		return code_sigungu_1;
	}
	public void setCode_sigungu_1(int code_sigungu_1) {
		this.code_sigungu_1 = code_sigungu_1;
	}
	public int getCode_sigungu_2() {
		return code_sigungu_2;
	}
	public void setCode_sigungu_2(int code_sigungu_2) {
		this.code_sigungu_2 = code_sigungu_2;
	}
	public int getCode_sigungu_3() {
		return code_sigungu_3;
	}
	public void setCode_sigungu_3(int code_sigungu_3) {
		this.code_sigungu_3 = code_sigungu_3;
	}
	public int getCode_sigungu_4() {
		return code_sigungu_4;
	}
	public void setCode_sigungu_4(int code_sigungu_4) {
		this.code_sigungu_4 = code_sigungu_4;
	}
	public int getCode_sigungu_5() {
		return code_sigungu_5;
	}
	public void setCode_sigungu_5(int code_sigungu_5) {
		this.code_sigungu_5 = code_sigungu_5;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	
}
