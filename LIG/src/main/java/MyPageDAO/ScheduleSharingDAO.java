package MyPageDAO;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import MyPageDTO.ScheduleSharingDTO;
import MyPageDTO.TopShareDTO;



public class ScheduleSharingDAO extends SqlSessionDaoSupport{

	public int addData(String string,ScheduleSharingDTO dto) {
		int count = getSqlSession().insert(string,dto);
		return count;
	}
	public int selectMaxGp_Id(String string) {
		int count = getSqlSession().selectOne(string);
		return count;
	}
	public List<Integer> selectMaxGp_Id_List(String string,String mem_id) {
		List<Integer> count = getSqlSession().selectList(string,mem_id);
		return count;
	}
	
	public ScheduleSharingDTO select_item(String string,HashMap<String, Object> mem_gp){
		ScheduleSharingDTO item = getSqlSession().selectOne(string,mem_gp);
		return item;
	}
	public int del_item(String string,int val){
		int count = getSqlSession().delete(string,val);
		return count;
	}
	public int addTop(String string,TopShareDTO dto) {
		int count = getSqlSession().insert(string,dto);
		return count;
	}
}