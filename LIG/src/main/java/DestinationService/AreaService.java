package DestinationService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import DestinationDAO.areaDAO;
import DestinationDTO.areaDTO;


@Component
public class AreaService{
	
	@Autowired
	private areaDAO dao;

	public void setDao(areaDAO dao) {
		this.dao = dao;
	}

	public List<areaDTO> getlist() {
		List<areaDTO> list = new ArrayList<areaDTO>();

		try {
			list = dao.getListData("area1.area1_List");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}
}