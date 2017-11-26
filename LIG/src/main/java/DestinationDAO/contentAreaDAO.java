package DestinationDAO;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import DestinationDTO.contentAreaDTO;


public class contentAreaDAO extends SqlSessionDaoSupport{

	public int addData(String string,contentAreaDTO dto) {
		int count = getSqlSession().insert(string,dto);
		return count;
	}
	public int delData(String string,contentAreaDTO dto) {
		int count = getSqlSession().delete(string,dto);
		return count;
	}
	public List<contentAreaDTO> getList(String string,String contentid) {
		List<contentAreaDTO> list = getSqlSession().selectList(string,contentid);
		return list;
	}
	public List<contentAreaDTO> getList(String string) {
		List<contentAreaDTO> list = getSqlSession().selectList(string);
		return list;
	}
	
	

}