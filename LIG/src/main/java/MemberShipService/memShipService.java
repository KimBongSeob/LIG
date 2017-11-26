package MemberShipService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import MemberShipDAO.memShipDao;
import MemberShipDTO.memShipDto;

@Component
public class memShipService {
	
	@Autowired
	private memShipDao memShipDao;

	public void setMemManageDao(memShipDao memShipDao) {
		this.memShipDao = memShipDao;
	}

	public int insertMember(memShipDto memShipDto) {
		int insertCount = 0;

		try {
			insertCount = memShipDao.insertMember("memShip.memJoin",memShipDto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return insertCount;
	}
	
	public int selectMemidCount(String mem_Id) {
		int Count = 0;

		try {
			Count = memShipDao.selectMemidCount("memShip.select_mem_id",mem_Id);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return Count;
	}
	
	public int selectnickNameCount(String nickName) {
		int Count = 0;

		try {
			Count = memShipDao.selectnickNameCount("memShip.select_nickName",nickName);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return Count;
	}

		
}