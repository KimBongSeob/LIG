package DestinationService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import DestinationDAO.ContentDAO;
import DestinationDAO.catDAO;
import DestinationDTO.catDTO;
import DestinationDTO.contentDTO;

@Component
public class CatService{
	
	@Autowired
	private catDAO dao;

	public void setDao(catDAO dao) {
		this.dao = dao;
	}

	public catDTO getItem(String code) {
		catDTO list =new catDTO();

		try {
			list = dao.getItemData("cat.cat1_List",code);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}
}