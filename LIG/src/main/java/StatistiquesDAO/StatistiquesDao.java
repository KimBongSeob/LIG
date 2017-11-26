package StatistiquesDAO;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import LoginDTO.LoginCountDTO;
import MyPageDTO.TopShareDTO;

public class StatistiquesDao extends SqlSessionDaoSupport{	

	public int getCountM(String string)  {
		int count_m = getSqlSession().selectOne(string);
		return count_m;
	}

	public int getCountW(String string) {
		int count_w = getSqlSession().selectOne(string);
		return count_w;
	}

	public List<TopShareDTO> getCountv5(String string) {
		List<TopShareDTO> count_v5 = getSqlSession().selectList(string);
		return count_v5;
	}
	
	public LoginCountDTO getLoginCount(String string) {
		LoginCountDTO loginCount = getSqlSession().selectOne(string);
		return loginCount ;
	}

}

