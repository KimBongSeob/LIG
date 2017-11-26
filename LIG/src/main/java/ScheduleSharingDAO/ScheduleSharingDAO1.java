package ScheduleSharingDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import ScheduleSharingDTO.ScheduleSharingDTO;

public class ScheduleSharingDAO1 extends SqlSessionDaoSupport {
	// 시도
	public List<String> getListData(String string) {
		List<String> sido = getSqlSession().selectList(string);
		return sido;
	}

	public List<Map<String, Object>> getListData(String string, String city) {
		List<Map<String, Object>> selectcity = getSqlSession().selectList(string, city);
		return selectcity;
	}

	// 그룹아이디 숫자 불러오기
	public List<Integer> allList(String string) {
		List<Integer> count = getSqlSession().selectList(string);
		return count;
	}

	// 그룹아이디 리스트 불러오기
	public ScheduleSharingDTO select_item(String string, HashMap<String, Object> mem_gp) {
		ScheduleSharingDTO item = getSqlSession().selectOne(string, mem_gp);
		return item;
	}

	// 키워드 검색 결과 갯수
	public List<Integer> getTotalRecord(String string, String searchWord) {
		List<Integer> count = getSqlSession().selectList(string, searchWord);
		return count;

	}

	// 키워드 검색 결과 리스트불러오기
	public ScheduleSharingDTO getArticleList(String string, HashMap<String, Object> mem_gp) {
		ScheduleSharingDTO item = getSqlSession().selectOne(string, mem_gp);
		return item;
	}

	// 전체 검색 결과 갯수
	public List<Integer> getTotalRecord_all(String string, HashMap<String, Object> mem_gp_c) {
		List<Integer> count_c = getSqlSession().selectList(string, mem_gp_c);
		return count_c;

	}

	// 전체 검색 결과 리스트불러오기
	public ScheduleSharingDTO getArticleList_all(String string, HashMap<String, Object> mem_gp_a) {
		ScheduleSharingDTO item_a = getSqlSession().selectOne(string, mem_gp_a);
		return item_a;
	}

	// 상세페이지 보기
	public List<ScheduleSharingDTO> getDetail(String string, int group_id) {
		List<ScheduleSharingDTO> item_con = getSqlSession().selectList(string,group_id);
		return item_con;
	}
	// 상세페이지 일정등록 
	public List<ScheduleSharingDTO> moveDetail(String string, int group_id) {
		List<ScheduleSharingDTO> item_con = getSqlSession().selectList(string,group_id);
		return item_con;
	}
	//mypage로 일정공유 내용 가져오기
		public int addData(String string,ScheduleSharingDTO dto) {
			int count = getSqlSession().insert(string,dto);
			return count;
		}
		public int selectMaxGp_Id(String string) {
			int count = getSqlSession().selectOne(string);
			return count;
		}
		
		//관리자 일정공유삭제하기
		public int del_item(String string,int group_id){
			int count = getSqlSession().delete(string,group_id);
			return count;
		}
		public List<Integer> selectMaxGp_Id_List(String string) {
			List<Integer> count = getSqlSession().selectList(string);
			return count;
		}
		
}
