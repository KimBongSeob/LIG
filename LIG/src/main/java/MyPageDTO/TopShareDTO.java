package MyPageDTO;

public class TopShareDTO {
	private int dest_id;
	private String dest_name;
	private int c;
	
	
	public TopShareDTO() {}
	public TopShareDTO(int dest_id, String dest_name) {
		this.dest_id = dest_id;
		this.dest_name = dest_name;
	}
	
	public TopShareDTO(int dest_id, String dest_name, int c) {
		this.dest_id = dest_id;
		this.dest_name = dest_name;
		this.c = c;
	}
	public int getC() {
		return c;
	}
	public void setC(int c) {
		this.c = c;
	}
	public int getDest_id() {
		return dest_id;
	}
	public void setDest_id(int dest_id) {
		this.dest_id = dest_id;
	}
	public String getDest_name() {
		return dest_name;
	}
	public void setDest_name(String dest_name) {
		this.dest_name = dest_name;
	}
}
