package DestinationDAO;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import DestinationDTO.catDTO;
import DestinationDTO.contentDTO;

public class catDAO extends SqlSessionDaoSupport{

	public catDTO getItemData(String string,String code) {
		catDTO data = getSqlSession().selectOne(string,code);
		return data;
	}
}