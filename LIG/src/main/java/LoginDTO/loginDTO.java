
package LoginDTO;

public class loginDTO {

	private String mem_id;
	private String nickname;
	private String passwd;

	public loginDTO() {

	}

	public loginDTO(String mem_id, String passwd) {
		this.setMem_id(mem_id);
		this.setPasswd(passwd);
	}
	
	

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

}
