package HomePageManagementService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import HomePageManagementDAO.HomePageManagementDAO;
import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;


@Component
public class HomePageManagementService {

	@Autowired
	private HomePageManagementDAO HomePageManagementDAO;

	public void setHomePageManagementDAO(HomePageManagementDAO HomePageManagementDAO) {
		this.HomePageManagementDAO = HomePageManagementDAO;
	}

	/* 메인페이지 1번 롤링 */
	public int updateFile1(PageImgDTO dto) {
		int count = 0;

		try {
			count = HomePageManagementDAO.updateFile1("File.updateFile1", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}

	/* 메인페이지 2번 롤링 */
	public int updateFile2(PageImgDTO dto) {
		int count = 0;

		try {
			count = HomePageManagementDAO.updateFile2("File.updateFile2", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}

	/* 메인페이지 3번 롤링 */
	public int updateFile3(PageImgDTO dto) {
		int count = 0;

		try {
			count = HomePageManagementDAO.updateFile3("File.updateFile3", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}

	/* 이미지 리스트 부르기 */
	public List<PageImgDTO> getlist() {
		List<PageImgDTO> list = new ArrayList<PageImgDTO>();
		try {
			list = HomePageManagementDAO.getListData("File.fileList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}

	/* 로고 바꾸기 */
	public int updateLogo1(LogoImgDTO dto) {
		int count = 0;
		try {
			count = HomePageManagementDAO.updateLogo1("File.updateLogo1", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return count;
	}

	public int updateLogo2(LogoImgDTO dto) {
		int count = 0;
		try {
			count = HomePageManagementDAO.updateLogo2("File.updateLogo2", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return count;
	}

	public List<LogoImgDTO> getlogo() {
		List<LogoImgDTO> logo = new ArrayList<LogoImgDTO>();
		try {
			logo = HomePageManagementDAO.getlogoData("File.logoList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return logo;
	}

}
