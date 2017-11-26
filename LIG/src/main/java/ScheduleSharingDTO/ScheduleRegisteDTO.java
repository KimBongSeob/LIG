package ScheduleSharingDTO;

import java.util.Date;

public class ScheduleRegisteDTO {
	int regist_id;
	int group_id;
	int day_no;
	String mem_id;
	Date start_date;
	Date end_date;
	int dest_id_1;
	int dest_id_2;
	int dest_id_3;
	int dest_id_4;
	int dest_id_5;

	public ScheduleRegisteDTO(int regist_id, int group_id, int day_no, String mem_id, Date start_date, Date end_date,
			int dest_id_1, int dest_id_2, int dest_id_3, int dest_id_4, int dest_id_5) {
		super();
		this.regist_id = regist_id;
		this.group_id = group_id;
		this.day_no = day_no;
		this.mem_id = mem_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.dest_id_1 = dest_id_1;
		this.dest_id_2 = dest_id_2;
		this.dest_id_3 = dest_id_3;
		this.dest_id_4 = dest_id_4;
		this.dest_id_5 = dest_id_5;
	}

	public int getRegist_id() {
		return regist_id;
	}

	public void setRegist_id(int regist_id) {
		this.regist_id = regist_id;
	}

	public int getGroup_id() {
		return group_id;
	}

	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}

	public int getDay_no() {
		return day_no;
	}

	public void setDay_no(int day_no) {
		this.day_no = day_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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

}
