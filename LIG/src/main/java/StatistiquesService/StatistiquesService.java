package StatistiquesService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import LoginDTO.LoginCountDTO;
import MyPageDTO.TopShareDTO;
import StatistiquesDAO.StatistiquesDao;

@Component
public class StatistiquesService {
	@Autowired
	private StatistiquesDao StatistiquesDao;

	public void setStatistiquesDao(StatistiquesDao StatistiquesDao) {
		this.StatistiquesDao = StatistiquesDao;
	}

	public int getCount_M() {
		int count_m = 0;
		
		try {
			count_m = StatistiquesDao.getCountM("statistic.Count_M");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return count_m;
	}

	public int getCount_W() {
		int count_w = 0;

		try {
			count_w = StatistiquesDao.getCountW("statistic.Count_W");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return count_w;
	}

	public List<TopShareDTO> getCount_v5() {
		List<TopShareDTO> top_list = new ArrayList<TopShareDTO>();

		try {
			top_list = StatistiquesDao.getCountv5("statistic.Count_v5");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		System.out.println(top_list);
		return top_list;
	}
	
	public LoginCountDTO getLoginCount() {
		LoginCountDTO loginCount = StatistiquesDao.getLoginCount("statistic.Count_Login");
		return loginCount ;
	}
	
	
}

