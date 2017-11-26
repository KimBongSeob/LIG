package LoginController;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;
import HomePageManagementService.HomePageManagementService;
import LoginDTO.loginDTO;
import LoginService.LoginService;
import net.sf.json.JSONObject;

@Controller
public class loginController {

	@Autowired
	private LoginService loginService;
	@Autowired
	private HomePageManagementService HomePageManagementService;

	
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}

	@RequestMapping(value = "/Login/Login.do", method = RequestMethod.GET)
	public String init(HttpServletRequest req, Model model) throws Exception {
		/* 메인이미지 1,2,3 */
		List<PageImgDTO> list = HomePageManagementService.getlist();
		model.addAttribute("list", list); // 전체목록
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		
		if (req.getSession() != null) {
			model.addAttribute("mem_id", req.getSession().getAttribute("mem_id"));
		} else {
			model.addAttribute("mem_id", "null");
		}
		return "Main/index";
	}

	@RequestMapping(value = "/Login/Login.do", method = RequestMethod.POST)
	public String login(String id, String pwd, HttpServletResponse res, HttpServletRequest req, Model model) {
		/* 메인이미지 1,2,3 */
		List<PageImgDTO> list = HomePageManagementService.getlist();
		model.addAttribute("list", list); // 전체목록
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록

		loginDTO dto = new loginDTO(id, pwd);
		
		loginDTO Logindto = loginService.Login(dto);
		
		String result = "";
		if (Logindto == null) {
			if(id.equals("admin") && pwd.equals("123")) {
				System.out.println("admin 로그인성공 ");
				req.getSession().setAttribute("mem_id", "admin");
				req.getSession().setAttribute("nickname", "admin");
			}else {
				result = "false";
			}
		} else {
			System.out.println("로그인성공 "+Logindto.getMem_id()+Logindto.getNickname());
			req.getSession().setAttribute("mem_id", Logindto.getMem_id());
			req.getSession().setAttribute("nickname", Logindto.getNickname());
			/// model.addAttribute("mem_id",)
			int login_count = loginService.add_count_nomal();
			System.out.println("일반 로그인 횟수 증가 성공::: "+login_count);
		}
		model.addAttribute("result", result);

		return "Main/index";
	}

	@RequestMapping(value = "/Login/Login_sns.do", method = RequestMethod.POST)
	public void login(String id, String pwd, String json_data, String token, HttpServletResponse res, HttpServletRequest req, Model model) throws Exception{
		/* 메인이미지 1,2,3 */
		List<PageImgDTO> list = HomePageManagementService.getlist();
		model.addAttribute("list", list); // 전체목록
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		//System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		
		if(json_data != null && token != null) {
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObj1 = (JsonObject) jsonParser.parse(json_data);
			String sns_id = "" + jsonObj1.get("id");
			String sns_name = "" + jsonObj1.get("name");
			//String sns_email = "" + jsonObj1.get("email");
			//String sns_gender = "" + jsonObj1.get("gender");
			//String sns_birthday = "" + jsonObj1.get("birthday");

			String access_token = token;
			System.out.println("컨트롤러 액세스 토큰:::"+access_token);
			req.getSession().setAttribute("access_token", access_token);

			sns_id = sns_id.replace("\"","");
			sns_name = sns_name.replace("\"","");
			//System.out.println(sns_id + sns_name + sns_email + sns_gender + sns_birthday);
			
			System.out.println("소셜 로그인 성공!! => "+sns_id+" / "+sns_name);
			req.getSession().setAttribute("mem_id", sns_id);
			req.getSession().setAttribute("nickname", sns_name);
			
			int login_count = loginService.add_count_sns();
			System.out.println("SNS 로그인 횟수 증가 성공::: "+login_count);
			
			JSONObject jso = new JSONObject();
			jso.put("data", sns_id);
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.print(jso.toString());
		}
	}
	
	@RequestMapping(value = "/Login/logout.do")
	public String logout(HttpSession session, Model model) {
		session.invalidate(); // session 제거
		/* 메인이미지 1,2,3 */
		List<PageImgDTO> list = HomePageManagementService.getlist();
		model.addAttribute("list", list); // 전체목록
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		return "Main/index";
	}
}
