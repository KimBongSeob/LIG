package DestinationService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import DestinationDAO.ContentDAO;
import DestinationDTO.contentDTO;

@Component
public class ContentService{
	
	@Autowired
	private ContentDAO dao;

	public void setDao(ContentDAO dao) {
		this.dao = dao;
	}

	public List<contentDTO> getlist() {
		List<contentDTO> list = new ArrayList<contentDTO>();

		try {
			list = dao.getListData("content.contentList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}
}