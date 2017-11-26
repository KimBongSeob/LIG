package MemberShipController;


import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;
import HomePageManagementService.HomePageManagementService;
import MemberShipService.memShipService;
import net.sf.json.JSONObject;
import MemberShipDTO.memShipDto;


@Controller
public class memberShipController {
	
	@Autowired
	private memShipService memShipService;
	@Autowired
	private HomePageManagementService homePageManagementService;
	
	
	public void setMemShipService(memShipService memShipService) {
		this.memShipService = memShipService;
	}
	public void setHomePageManagementService(HomePageManagementService homePageManagementService) {
		this.homePageManagementService = homePageManagementService;
	}
	@InitBinder
	 protected void initBinder(WebDataBinder binder){
	     DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	     binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat,true));
	}
	
	
	@RequestMapping(value = "/MemberShip/index.do")
	public String init(Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = homePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		return "MemberShip/index";		
	}
	
	@RequestMapping(value = "/MemberShip/Insert.do", method = RequestMethod.POST)
	public String form(memShipDto memShipDto,String registration_date,Model model) throws Exception {		
		
		
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");		
		System.out.println(registration_date);		
		memShipDto.setJumin(simple.parse(registration_date));
		
		System.out.println(memShipDto.getEmail()+memShipDto.getJumin()+memShipDto.getGender()+memShipDto.getHphone()+memShipDto.getMem_Id()+memShipDto.getNickName()+memShipDto.getPasswd());
		
		memShipService.insertMember(memShipDto);
		/*메인으로 리턴*/
		/*메인이미지 1,2,3*/
		List<PageImgDTO> list = homePageManagementService.getlist();		
		model.addAttribute("list", list); //전체목록
		/*로고변환*/
		List<LogoImgDTO> logo = homePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); //전체목록
		return "Main/index";
	}
	
	@RequestMapping(value = "/MemberShip/idCheck.do")
	public void idcheck(memShipDto memShipDto,String mem_Id,HttpServletResponse resp) throws Exception {
		System.out.println("memid:"+mem_Id);
		int count = memShipService.selectMemidCount(mem_Id);
		JSONObject jso = new JSONObject();
		jso.put("count", count);

		System.out.println(jso.toString());
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
		
	}
	
	@RequestMapping(value = "/MemberShip/nickNameCheck.do")
	public void nickNamecheck(memShipDto memShipDto,String nickName,HttpServletResponse resp) throws Exception {
		System.out.println("nickName:"+nickName);
		int count = memShipService.selectnickNameCount(nickName);
		JSONObject jso = new JSONObject();
		jso.put("count", count);

		System.out.println(jso.toString());
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
		
	}

}
