package MemberManagementDTO;

import java.util.HashMap;
import java.util.Map;

public class pageNumDto {
	private int startNum;
	private int endNum;
	
	private String val;
	private String search_val;
	
	
	
	public String getVal() {
		return val;
	}
	public void setVal(String val) {
		this.val = val;
	}
	public String getSearch_val() {
		return search_val;
	}
	public void setSearch_val(String search_val) {
		this.search_val = search_val;
	}
	public pageNumDto() {}
	public pageNumDto(int startNum, int endNum) {		
		this.startNum = startNum;
		this.endNum = endNum;
	}
	
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	

}
