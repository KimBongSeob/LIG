package MyPageService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import EventDAO.EventDAO;
import EventDTO.EventDTO;
import EventDTO.MyScheduleSharingDTO;
import MyPageDAO.MyPageDAO;
import MyPageDTO.MyPageDTO;
import ScheduleSharingDTO.ScheduleSharingDTO;

@Component
public class MyPageService {
	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private EventDAO eventDAO;

	public void setDao(MyPageDAO dao) {
		this.dao = dao;
	}

	public MyPageDTO getlist(String mem_id) {
		MyPageDTO dto = new MyPageDTO();

		try {
			dto = dao.getData("member.memberview", mem_id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}

	// confirm password
	public MyPageDTO getinfo(String mem_id) {
		MyPageDTO dto = new MyPageDTO();

		try {
			dto = dao.confirmData("member.memberconfirm", mem_id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}

	// modify
	public void updateMember(MyPageDTO dto) {

		try {
			dao.updateData("member.memberupdate", dto);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

	}

	// delete
	public int deleteMember(MyPageDTO dto) {
		int i = 3;
		try {
			i = dao.deleteMem("member.memberdelete", dto);

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return i;
	}
	
	// 마이페이지-> 일정공유페이지
	public List<ScheduleSharingDTO> MySharing(int group_id) {
		List<ScheduleSharingDTO> item_con = new ArrayList<ScheduleSharingDTO>();
		
		try {
			item_con = eventDAO.Sharing("event.mSharing",group_id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return item_con;
	}
	//일정공유페이지-> 일정공유
	public int selectMaxGroupId() {
		int count = 0;
		try {
			count = eventDAO.selectMaxGp_Id("event.MySharing_group_id");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public int add(MyScheduleSharingDTO dto) {
		int count = 0;
		try {
			count = eventDAO.addData("event.insert_ss",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	

	// 달력이벤트,일정리스트
	public List<EventDTO> getEvents(String mem_id) {
		List<EventDTO> ev = new ArrayList<EventDTO>();
		
		try {
			ev = eventDAO.getEvents1("event.evt", mem_id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return ev;
	}
	
}