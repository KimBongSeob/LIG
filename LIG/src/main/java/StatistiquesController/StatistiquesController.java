package StatistiquesController;

import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import DestinationDTO.contentDTO;
import DestinationService.ContentService;
import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementService.HomePageManagementService;
import LoginDTO.LoginCountDTO;
import MemberManagementService.memManageService;
import MyPageDTO.TopShareDTO;
import StatistiquesDTO.DestinationDiagramDTO;
import StatistiquesDTO.StatDto;
import StatistiquesService.StatistiquesService;
import net.sf.json.JSONObject;



@Controller
public class StatistiquesController {
	
	@Autowired
	private StatistiquesService StatistiquesService;
	@Autowired
	private ContentService contentService;
	@Autowired
	private memManageService memManageService;	
	@Autowired
	private HomePageManagementService HomePageManagementService;	
		
	public void setStatistiquesService(StatistiquesService StatistiquesService) {
		this.StatistiquesService = StatistiquesService;
	}
	public void setContentService(ContentService contentService) {
		this.contentService = contentService;
	}
	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}
	
	
	@RequestMapping(value = "/Statistiques/index.do")
	public String init(Model model, StatDto StatDto,TopShareDTO TopShareDTO) throws Exception {	
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		
		
		int count=0;
		int count_m=0;
		int count_w=0;	
		
		count = memManageService.getCount(); //전체회원수
		count_m = StatistiquesService.getCount_M(); //남자회원수
		count_w = StatistiquesService.getCount_W(); //여자회원수
		LoginCountDTO count_login = StatistiquesService.getLoginCount();//
		List<TopShareDTO> count_v5 = StatistiquesService.getCount_v5(); //top5
		model.addAttribute("count", count); //전체목록
		model.addAttribute("count_m", count_m); //남자
		model.addAttribute("count_w", count_w); //여자		
		model.addAttribute("count_v5", count_v5); //탑5
		model.addAttribute("count_login_sum", count_login.getNomal_count() + count_login.getSns_count()); // 일반로그인횟수 + 소셜로그인 횟수
		model.addAttribute("count_login_Nomal", count_login.getNomal_count()); // 일반로그인
		model.addAttribute("count_login_Sns", count_login.getSns_count()); // 소셜로그인
		
		
		return "Statistiques/index";		
	}
	
	
	@RequestMapping(value = "/stat/statContent.do" , produces = "text/plain;charset=UTF-8")
	public void stat1(HttpServletResponse resp) throws Exception {	
		resp.setContentType("text/html;charset=utf-8");
		
		List<contentDTO> list = contentService.getlist();
		List<DestinationDiagramDTO> ddDto = new ArrayList<DestinationDiagramDTO>();
		//모든 content 테이블의 데이터를 가져옴.
		// 크기 만큼 for문
		for(int i = 0; i < list.size(); i++) {
			// api 의 파라미터 타입 중 하나인 contentTypeId에 데이터를 입력
			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			//String serviceKey = "pH%2BhcJ4mT6g4yd1O%2BDDkRn3PQ1mJkqVl99yOPA7Tj6dhpa%2FtwE091H8MSw0qipqc0edweup%2Bo2TEIDtsJUizrQ%3D%3D";
			String parameter = "";
			String addr_All = "";
			
			parameter = parameter + "&" + "contentTypeId=" + list.get(i).getCode(); // code가 contentTypeId 이므로 입력.
			parameter = parameter + "&areaCode=&sigunguCode=&numOfRows=&pageNo&MobileOS=ETC&MobileApp=AppTesting";
			parameter = parameter + "&" + "_type=json";
			
			addr_All = addr + serviceKey + parameter;
			
			URL url = new URL(addr_All);		
			InputStream in = url.openConnection().getInputStream();
			String data = IOUtils.toString(in, "utf-8");
			in.close();
			PrintWriter out = resp.getWriter();
			Gson gson = new Gson();
			
			gson.toJson(data);// 가져온 data를 json 객체로 만듬.
			
			JsonParser jsonps = new JsonParser();
			JsonObject jsonopj = (JsonObject) jsonps.parse(data);
			JsonObject getdata = (JsonObject) jsonopj.get("response");
			JsonObject getdata2 = (JsonObject) getdata.get("body");
			
			int total = getdata2.get("totalCount").getAsInt();// total count를 찾아가서 total에 입력.
			ddDto.add(new DestinationDiagramDTO(total,list.get(i).getCode(), list.get(i).getName()));// ddDto List 객체에 add
			System.out.println("total:"+total+" code:"+list.get(i).getCode()+" name:"+list.get(i).getName());
		}
		
		JSONObject jso = new JSONObject();
		
		jso.put("data", ddDto);

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
	}

}
