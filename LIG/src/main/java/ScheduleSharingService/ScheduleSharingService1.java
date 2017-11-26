package ScheduleSharingService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ScheduleSharingDAO.ScheduleSharingDAO1;
import ScheduleSharingDTO.PagingHelper;
import ScheduleSharingDTO.ScheduleSharingDTO;

@Component
public class ScheduleSharingService1 {
	@Autowired
	private ScheduleSharingDAO1 dao;
	private PagingHelper pagingHelper;

	public void setScheduleSharingDAO(ScheduleSharingDAO1 dao) {
		this.dao = dao;
	}

	// 그룹아이디 숫자 불러오기
	public List<Integer> allList() {

		List<Integer> count = new ArrayList<Integer>();

		try {
			count = dao.allList("schedulesharing.getshare");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	// 그룹아이디 리스트 불러오기
	public ScheduleSharingDTO selectitem(HashMap<String, Object> mem_gp) {
		ScheduleSharingDTO item = new ScheduleSharingDTO();
		try {
			item = dao.select_item("schedulesharing.select_list",mem_gp);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return item;
	}

	// 키워드 검색 결과 갯수
	public List<Integer> getTotalRecord(String searchWord) {
		List<Integer> count = new ArrayList<Integer>();

		try {

			count = dao.getTotalRecord("schedulesharing.getTotalRecord",searchWord);
			System.out.println("키워드로 불러온 "+count.size());
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return count;

	}

	// 키워드 검색 결과 리스트불러오기
	public ScheduleSharingDTO getArticleList(HashMap<String, Object> mem_gp) {
		ScheduleSharingDTO item= new ScheduleSharingDTO();
		try {

			item = dao.getArticleList("schedulesharing.getList",mem_gp);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return item;
	}
	// 전체 검색 결과 갯수
	public List<Integer>getTotalRecord_all(HashMap<String, Object> mem_gp_c) {
		List<Integer> count_c = new ArrayList<Integer>();
		
		try {
			
			count_c = dao.getTotalRecord_all("schedulesharing.getTotalRecord_all",mem_gp_c);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return count_c;
		
	}
	
	// 전체 검색 결과 리스트불러오기
	public ScheduleSharingDTO getArticleList_all(HashMap<String, Object> mem_gp_a) {
		ScheduleSharingDTO item_a= new ScheduleSharingDTO();
		try {
			
			item_a = dao.getArticleList_all("schedulesharing.getList",mem_gp_a);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return item_a;
	}
	//상세페이지
	public List<ScheduleSharingDTO> getdetail(int group_id) {
		List<ScheduleSharingDTO> item_con = new ArrayList<ScheduleSharingDTO>();

		try {
			item_con = dao.getDetail("schedulesharing.getDetail",group_id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return item_con;
	}
	//상세페이지
	public List<ScheduleSharingDTO> movedetail(int group_id) {
		List<ScheduleSharingDTO> item_con = new ArrayList<ScheduleSharingDTO>();
		
		try {
			item_con = dao.moveDetail("schedulesharing.moveDetail",group_id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return item_con;
	}
	//mypage로 일정공유내용 등록하기
	public int add(ScheduleSharingDTO dto) {
		int count = 0;
		try {
			count = dao.addData("schedulesharing.insert_ss",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public int selectMaxGroupId() {
		int count = 0;
		try {
			count = dao.selectMaxGp_Id("schedulesharing.select_gp_id");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
//관리자 일정공유삭제하기
	
	public int delitem(int group_id){
		int count = 0;
		try {
			count = dao.del_item("schedulesharing.del_item",group_id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public List<Integer> selectMaxGroupIdList() {
		List<Integer> count = new ArrayList<Integer>();
		try {
			count = dao.selectMaxGp_Id_List("schedulesharing.select_gp_id_list");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	
}
