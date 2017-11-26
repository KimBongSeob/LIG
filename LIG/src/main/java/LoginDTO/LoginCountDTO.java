package LoginDTO;

public class LoginCountDTO {

	private int no;
	private int nomal_count;
	private int sns_count;
	public LoginCountDTO() {}
	public LoginCountDTO(int nomal_count, int sns_count) {
		this.nomal_count = nomal_count;
		this.sns_count = sns_count;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getNomal_count() {
		return nomal_count;
	}
	public void setNomal_count(int nomal_count) {
		this.nomal_count = nomal_count;
	}
	public int getSns_count() {
		return sns_count;
	}
	public void setSns_count(int sns_count) {
		this.sns_count = sns_count;
	}
	
	
}
