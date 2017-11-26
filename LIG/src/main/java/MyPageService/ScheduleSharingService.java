package MyPageService;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ConstantRegistrationDAO.ConstantRegistrationDAO;
import ConstantRegistrationDTO.ConstantRegistrationDTO;
import MyPageDAO.ScheduleSharingDAO;
import MyPageDTO.ScheduleSharingDTO;
import MyPageDTO.TopShareDTO;


@Component
public class ScheduleSharingService{
	
	@Autowired
	private ScheduleSharingDAO dao;

	public void setDao(ScheduleSharingDAO dao) {
		this.dao = dao;
	}
	public int add(ScheduleSharingDTO dto) {
		int count = 0;
		try {
			count = dao.addData("ScheduleSharing.insert_ss",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public int selectMaxGroupId() {
		int count = 0;
		try {
			count = dao.selectMaxGp_Id("ScheduleSharing.select_gp_id");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public List<Integer> selectMaxGroupIdList(String mem_id) {
		List<Integer> count = new ArrayList<Integer>();
		try {
			count = dao.selectMaxGp_Id_List("ScheduleSharing.select_gp_id_list",mem_id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public ScheduleSharingDTO selectitem(HashMap<String, Object> mem_gp) {
		ScheduleSharingDTO item = new ScheduleSharingDTO();
		try {
			item = dao.select_item("ScheduleSharing.select_list",mem_gp);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return item;
	}


	public int delitem(int val){
		int count = 0;
		try {
			count = dao.del_item("ScheduleSharing.del_item",val);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public int addTop(TopShareDTO dto) {
		int count = 0;
		try {
			count = dao.addTop("ScheduleSharing.insert_top",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	
}