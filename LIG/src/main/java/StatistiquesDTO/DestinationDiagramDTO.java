package StatistiquesDTO;

public class DestinationDiagramDTO {
	private int totalCount;
	private int code;
	private String name;
	
	
	public DestinationDiagramDTO() {}
	public DestinationDiagramDTO(int totalCount, int code, String name) {
		this.totalCount = totalCount;
		this.code = code;
		this.name = name;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
