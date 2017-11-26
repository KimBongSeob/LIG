package DestinationDAO;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import DestinationDTO.areaDTO;


public class areaDAO extends SqlSessionDaoSupport{

	public List<areaDTO> getListData(String string) {
		List<areaDTO> list = getSqlSession().selectList(string);
		return list;
	}
}