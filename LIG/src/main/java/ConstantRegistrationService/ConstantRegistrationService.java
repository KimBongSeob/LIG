package ConstantRegistrationService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ConstantRegistrationDAO.ConstantRegistrationDAO;
import ConstantRegistrationDTO.ConstantRegistrationDTO;


@Component
public class ConstantRegistrationService{
	
	@Autowired
	private ConstantRegistrationDAO dao;

	public void setDao(ConstantRegistrationDAO dao) {
		this.dao = dao;
	}
	public int add(ConstantRegistrationDTO dto) {
		int count = 0;
		try {
			count = dao.addData("ConstantRegistration.insert_cr",dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	public int selectMaxGroupId() {
		int count = 0;
		try {
			count = dao.selectMaxGp_Id("ConstantRegistration.select_gp_id");
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return count;
	}
	
}