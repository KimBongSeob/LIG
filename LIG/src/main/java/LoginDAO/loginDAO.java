package LoginDAO;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import LoginDTO.loginDTO;


public class loginDAO extends SqlSessionDaoSupport {

	public loginDTO Login(String string,loginDTO loginDTO) {

		loginDTO login = getSqlSession().selectOne(string, loginDTO);
		return login;

	}
	
	public int count_nomal(String string) {
		int count = getSqlSession().update(string);
		return count;
	}
	
	public int count_sns(String string) {
		int count = getSqlSession().update(string);
		return count;
	}
	
}
