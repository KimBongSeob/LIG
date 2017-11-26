package ConstantRegistrationDAO;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import ConstantRegistrationDTO.ConstantRegistrationDTO;



public class ConstantRegistrationDAO extends SqlSessionDaoSupport{

	public int addData(String string,ConstantRegistrationDTO dto) {
		int count = getSqlSession().insert(string,dto);
		return count;
	}
	public int selectMaxGp_Id(String string) {
		int count = getSqlSession().selectOne(string);
		return count;
	}

}