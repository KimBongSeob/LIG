package DestinationDAO;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import DestinationDTO.contentDTO;

public class ContentDAO extends SqlSessionDaoSupport{

	public List<contentDTO> getListData(String string) {
		List<contentDTO> list = getSqlSession().selectList(string);
		return list;
	}
}