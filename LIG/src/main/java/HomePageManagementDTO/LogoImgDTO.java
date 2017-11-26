package HomePageManagementDTO;

import org.springframework.web.multipart.MultipartFile;

public class LogoImgDTO {
    private int no;
    private String filename;
    private String realpath;
    
    public LogoImgDTO() {}
	public LogoImgDTO(String filename, String realpath) {
		this.filename = filename;
		this.realpath = realpath;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRealpath() {
		return realpath;
	}
	public void setRealpath(String realpath) {
		this.realpath = realpath;
	}
    
    
   
}
