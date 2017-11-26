package LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import LoginDAO.loginDAO;
import LoginDTO.loginDTO;

@Component
public class LoginService {
	
	@Autowired
	private loginDAO login;
	
	public loginDAO getLogin() {
		return login;
	}



	public void setLogin(loginDAO login) {
		this.login = login;
	}


	public loginDTO Login(loginDTO loginDTO) {

		loginDTO item = login.Login("login.log", loginDTO);
		return item;

	}

	public int add_count_nomal() {
		int number = login.count_nomal("login.count_nomal");
		return number;
	}
	
	public int add_count_sns() {
		int number = login.count_sns("login.count_sns");
		return number;
	}
	
}
