package MemberManagementDAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import HomePageManagementDTO.PageImgDTO;
import MemberManagementDTO.memManageDto;
import MemberManagementDTO.pageNumDto;

public class memManageDao extends SqlSessionDaoSupport {

	public List<memManageDto> getListData(String string) {
		List<memManageDto> list = getSqlSession().selectList(string);
		return list;
	}
	
	public int getCount(String string) {
		int count1 = getSqlSession().selectOne(string);
		return count1;
	}

	public int deleteUser(String string, String data) {
		int count = getSqlSession().update(string, data);
		if (count > 0) {
			System.out.println("delete ok!!");
		} else {
			System.out.println("delete fail!!");
		}
		return count;
	}
	
	public int SearchKeyword(String string, pageNumDto pagenumdto) {
	
		int count = getSqlSession().selectOne(string, pagenumdto);
		return count;
	}
	
	public List<memManageDto> getlistNum(String string, pageNumDto pageNumDto) {
		List<memManageDto> list = getSqlSession().selectList(string, pageNumDto);
		return list;
	}

	public List<memManageDto> getlistNumSearch(String string, pageNumDto pagenumdto) {
		List<memManageDto> list = getSqlSession().selectList(string, pagenumdto);
		return list;
	}

	

}
