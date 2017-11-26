package HomePageManagementDAO;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;
import MemberManagementDTO.memManageDto;

public class HomePageManagementDAO extends SqlSessionDaoSupport {
	/* 메인페이지 1번 롤링 */
	public int updateFile1(String string, PageImgDTO dto) {
		int count = getSqlSession().update(string, dto);

		if (count > 0) {
			System.out.println("insert ok!!");
		} else {
			System.out.println("insert fail!!");
		}

		return count;
	}

	/* 메인페이지 2번 롤링 */
	public int updateFile2(String string, PageImgDTO dto) {
		int count = getSqlSession().update(string, dto);

		if (count > 0) {
			System.out.println("insert ok!!");
		} else {
			System.out.println("insert fail!!");
		}

		return count;
	}

	/* 메인페이지 3번 롤링 */
	public int updateFile3(String string, PageImgDTO dto) {
		int count = getSqlSession().update(string, dto);

		if (count > 0) {
			System.out.println("insert ok!!");
		} else {
			System.out.println("insert fail!!");
		}

		return count;
	}

	/* 페이지 리스트 */
	public List<PageImgDTO> getListData(String string) {
		List<PageImgDTO> list = getSqlSession().selectList(string);
		return list;
	}

	/* 로고업뎃 1*/
	public int updateLogo1(String string, LogoImgDTO dto) {
		int count = getSqlSession().update(string, dto);
		if (count > 0) {
			System.out.println("insert ok!!");
		} else {
			System.out.println("insert fail!!");
		}
		return count;
	}
	
	/* 로고업뎃2 */
	public int updateLogo2(String string, LogoImgDTO dto) {
		int count = getSqlSession().update(string, dto);
		if (count > 0) {
			System.out.println("insert ok!!");
		} else {
			System.out.println("insert fail!!");
		}
		return count;
	}
	
	/* 로고 리스트 */
	public List<LogoImgDTO> getlogoData(String string) {
		List<LogoImgDTO> logo = getSqlSession().selectList(string);
		return logo;
	}

	

}
