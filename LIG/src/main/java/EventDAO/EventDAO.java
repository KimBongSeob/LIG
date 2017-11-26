package EventDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import EventDTO.EventDTO;
import EventDTO.MyScheduleSharingDTO;
import EventDTO.ShareDate;
import ScheduleSharingDTO.ScheduleSharingDTO;

public class EventDAO extends SqlSessionDaoSupport {

//달력이벤트,일ㅈㅇ리스트
	public List<EventDTO> getEvents1(String string,String mem_id) {
		List<EventDTO> ev = getSqlSession().selectList(string,mem_id);
		return ev;
	}

	public List<EventDTO> getEvtDetail(String mem_id, String group_id) {
		Map<String, Object> map=new HashedMap<>();
		map.put("mem_id", mem_id);
		map.put("group_id", group_id);
		
		return getSqlSession().selectList("event.evtDetail", map);
	}

/*	//일정공유
   public void shareDateInsert(ShareDate share) {
		System.out.println("  sha Insert  : " + share.toString());
		getSqlSession().insert("event.shareDateInsert",share);
	}*/
	//일정공유
	public int selectMaxGp_Id(String string) {
		int count = getSqlSession().selectOne(string);
		return count;
	}
	public int addData(String string,MyScheduleSharingDTO dto) {
		int count = getSqlSession().insert(string,dto);
		return count;
	}

	//그룹 일정 삭제 하기
	public void evtGroupDelete(Integer group_id, String map_id) {
		Map<String, Object> map =new HashMap<>();
		map.put("group_id", group_id);
		map.put("mem_id", map_id);
		getSqlSession().delete("event.evtGroupDelete", map);
		
	}
	
	//  일정등록 
	public List<ScheduleSharingDTO> Sharing(String string, int group_id) {
		List<ScheduleSharingDTO> item_con = getSqlSession().selectList(string,group_id);
		return item_con;
	}

}
