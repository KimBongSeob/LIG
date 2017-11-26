package MemberManagementService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import MemberManagementDTO.memManageDto;
import MemberManagementDTO.pageNumDto;
import MemberManagementDAO.memManageDao;

@Component
public class memManageService {

	@Autowired
	private memManageDao memManageDao;

	public void setMemManageDao(memManageDao memManageDao) {
		this.memManageDao = memManageDao;
	}

	// 전체글목록
	public List<memManageDto> getlist() {
		List<memManageDto> list = new ArrayList<memManageDto>();

		try {
			list = memManageDao.getListData("memManage.mem_List");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}

	public int getCount() {
		int count1 = 0;

		try {
			count1 = memManageDao.getCount("memManage.mem_Count");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count1;
	}

	public int deleteUser(String data) {
		int count = 0;
		try {
			count = memManageDao.deleteUser("memManage.deleteUser", data); // 실행할 메서드의 id값만 보냄
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return count; // area1
	}
	// dto에 담아서 한개씩 뽑고 삭제시키기

	public int getArticleCount(pageNumDto pagenumdto, int searchn, String search) {
		int count = 0;
		
		String[] column_name = { "mem_Id", "nickName", "hphone" };

		pagenumdto.setVal(column_name[searchn]);
		pagenumdto.setSearch_val(search);
		System.out.println(search);

		try {
			count = memManageDao.SearchKeyword("memManage.mem_Search", pagenumdto); 
		System.out.println("검색 개수"+count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count; // area1
	}

	//paging 처리하며 전체글목록 부름
	public List<memManageDto> getlistNum(pageNumDto pageNumDto) {
		List<memManageDto> list = new ArrayList<memManageDto>();

		try {
			list = memManageDao.getlistNum("memManage.mem_ListNum", pageNumDto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}

	public List<memManageDto> getlistNum(pageNumDto pagenumdto, int searchn, String search) {
		List<memManageDto> list = new ArrayList<memManageDto>();
		
		//Map<String, String> map = new HashMap<String, String>();
		String[] column_name = { "mem_Id", "nickName", "hphone" };

		pagenumdto.setVal(column_name[searchn]);
		pagenumdto.setSearch_val(search);	
		System.out.println("pagenumdto"+pagenumdto.getVal()+":"+pagenumdto.getSearch_val());
		
		
		try {
			list = memManageDao.getlistNumSearch("memManage.mem_ListSearch", pagenumdto);
		
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	
		
		return list;
	}

}
