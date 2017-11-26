package DestinationService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import DestinationDAO.contentAreaDAO;
import DestinationDTO.contentAreaDTO;

@Component
public class ContentAreaService{
	
	@Autowired
	private contentAreaDAO dao;

	public void setDao(contentAreaDAO dao) {
		this.dao = dao;
	}

	public int add(contentAreaDTO dto) {
		int count = 0;
		try {
			count = dao.addData("contentarea.insert_comments",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public int del(contentAreaDTO dto) {
		int count = 0;
		try {
			count = dao.delData("contentarea.delete_comments",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public List<contentAreaDTO> selectList(String contentid) {
		List<contentAreaDTO> list = new ArrayList<contentAreaDTO>();
		try {
			list = dao.getList("contentarea.select_comments",contentid);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}
	public List<contentAreaDTO> selectList() {
		List<contentAreaDTO> list = new ArrayList<contentAreaDTO>();
		try {
			list = dao.getList("contentarea.select_commentsNonId");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}
}