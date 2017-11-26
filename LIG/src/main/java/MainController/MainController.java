package MainController;

import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.cxf.helpers.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import DestinationDTO.contentpageDTO;
import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;
import HomePageManagementService.HomePageManagementService;
import MainDTO.alldataDTO;
import MainDTO.jsonDataDTO;
import net.sf.json.JSONObject;

@Controller
public class MainController {

	@Autowired
	private HomePageManagementService HomePageManagementService;

	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}

	@RequestMapping(value = "/Main/index.do")
	public String init(Model model) throws Exception {
		/* 메인이미지 1,2,3 */
		List<PageImgDTO> list = HomePageManagementService.getlist();
		model.addAttribute("list", list); // 전체목록
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		return "Main/index";
	}

	@RequestMapping(value = "/Main/area/areaSearchPro.do", method = RequestMethod.POST)
	public void areaSearch(HttpServletResponse resp, String select_data, String area_m1, String area_m2, String pageNum,
			Model model) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		System.out.println("요청으로 이동!\n select data:" + select_data + " area_m1:" + area_m1 + " area_m2: " + area_m2
				+ " pageNum:" + pageNum);

		if ((!select_data.equals("")) || (!area_m1.equals("")) || (!area_m2.equals(""))) {
			// System.out.println("요기까지 오나요");
			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			String parameter = "";
			String addr_All = "";

			if (pageNum == null) {
				pageNum = "1";
			}

			int pageSize = 9;
			// parameter = parameter + "&" + "areaCode=1";
			// parameter = parameter + "&" + "eventStartDate=20170401";
			// parameter = parameter + "&" + "eventEndDate=20171231";
			// parameter = parameter + "&" + "pageNo=1&numOfRows=10";
			// parameter = parameter + "&" + "MobileOS=ETC";
			// parameter = parameter + "&" + "MobileApp=aa";

			parameter = parameter + "&" + "contentTypeId=" + select_data;
			parameter = parameter + "&" + "areaCode=" + area_m1;
			parameter = parameter + "&" + "sigunguCode=" + area_m2;
			parameter = parameter + "&" + "numOfRows=" + pageSize;
			// parameter = parameter + "&" + "numOfRows=10";
			parameter = parameter + "&" + "pageNo=" + pageNum;
			parameter = parameter + "&" + "MobileOS=ETC";
			parameter = parameter + "&" + "MobileApp=AppTesting";
			parameter = parameter + "&" + "_type=json";

			addr_All = addr + serviceKey + parameter;

			// String
			// addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=rUvsIij93q8cvDMiiEWiidk4OuJxviJW3SysJhD48aIYbXRmJqrKKqVfl15sNtJwI%2BEw8lTwB3%2BNR4OVcnInhg%3D%3D&areaCode=1&eventStartDate=20170401&eventEndDate=20171231&pageNo=1&numOfRows=10&MobileOS=ETC&MobileApp=aa&_type=json";

			// String
			// addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+serviceKey+"&contentTypeId=12&areaCode=&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1";
			URL url = new URL(addr_All);
			InputStream in = url.openConnection().getInputStream();

			String data = IOUtils.toString(in, "utf-8");

			in.close();

			PrintWriter out = resp.getWriter();

			Gson gson = new Gson();

			gson.toJson(data);

			JsonParser jsonps = new JsonParser();
			JsonObject jsonopj = (JsonObject) jsonps.parse(data);
			JsonObject getdata = (JsonObject) jsonopj.get("response");
			JsonObject getdata2 = (JsonObject) getdata.get("body");
			int total = getdata2.get("totalCount").getAsInt();
			int allPage = 0;
			if (total != 0) {
				allPage = (total / pageSize);
			}
			if ((total % pageSize) != 0) {
				allPage++;
			}

			JSONObject sendJson = new JSONObject();

			int currentPage = Integer.parseInt(pageNum);// 956일 경우
			if (allPage > 0) {
				int pageBlock = 5;
				int result = currentPage / pageBlock;
				int startPage = (result * pageBlock) + 1;
				if ((currentPage % pageBlock) == 0) {
					startPage = startPage - pageBlock;
				}
				int endPage = startPage + pageBlock - 1;
				if (endPage > allPage) {
					endPage = allPage;
				}
				sendJson.put("select_data", select_data);
				sendJson.put("area_m1", area_m1);
				sendJson.put("area_m2", area_m2);
				sendJson.put("pageBlock", pageBlock);
				sendJson.put("startPage", startPage);
				sendJson.put("endPage", endPage);
				sendJson.put("pageCount", allPage);

				model.addAttribute("select_data", select_data);
				model.addAttribute("area_m1", area_m1);
				model.addAttribute("area_m2", area_m2);
				model.addAttribute("pageBlock", pageBlock);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("pageCount", allPage);
			}

			sendJson.put("data", data);
			sendJson.put("allPage", allPage);
			out.println(sendJson.toString());
			// 어차피 json 형태로 오기 때문에 jsonObject로 만들어서 보내줄 필요가 없다.

			model.addAttribute("data", data);
			model.addAttribute("allPage", allPage);
		}
		// return "Destination/mainSearch";

	}

	@RequestMapping(value = "/Main/mainSearch.do")
	public String moveDestination(Model model, String myItem, String alldata) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록

		Gson gson = new Gson();

		System.out.println("alldata:"+alldata);
		alldataDTO alldataDto = gson.fromJson(alldata, alldataDTO.class);

		System.out.println("alldataDto:"+alldataDto.getSize()+alldataDto.getPageNo()+alldataDto.getPage()
		+alldataDto.getPageBlock()+alldataDto.getStartPage()+alldataDto.getEndPage()+alldataDto.getPageCount()
		+alldataDto.getSelect_data()+alldataDto.getArea_m1()+alldataDto.getArea_m2());
		// JsonParser jsonps = new JsonParser();
		// JsonObject jsonopj = (JsonObject) jsonps.parse(myItem);

		// Member[] array = gson.fromJson(jsonString, Member[].class); List<Member> list
		// = Arrays.asList(array);

		if (alldataDto.getSize() > 1) {
			jsonDataDTO[] contentdata = gson.fromJson(myItem, jsonDataDTO[].class);
			List<jsonDataDTO> list = Arrays.asList(contentdata);
			model.addAttribute("myItem", list);
		} else if (alldataDto.getSize() == 1) {
			jsonDataDTO contentdata = gson.fromJson(myItem, jsonDataDTO.class);
			List<jsonDataDTO> list = new ArrayList<jsonDataDTO>();
			list.add(contentdata);
			model.addAttribute("myItem", list);
			model.addAttribute("width", "style=\"width:25%;\"");
			//.arearesultLi-30     /* width: 0; *//* float: ; */
			model.addAttribute("li_width","style=\"width: 100%;\"");
		}

		// List<jsonDataDTO> list = Arrays.asList(contentdata);
		// System.out.println("item:"+myItem+"size:"+size+"pageno:"+pageNo+"page:"+page+"pageBlock:"+pageBlock+"startPage:"+startPage+"endPage:"+endPage+"pageCount:"+pageCount+"select_data:"+select_data+"area_m1:"+area_m1+"area_m2:"+area_m2);

		model.addAttribute("size", alldataDto.getSize());
		model.addAttribute("pageNo", alldataDto.getPageNo());
		model.addAttribute("page", alldataDto.getPage());
		model.addAttribute("pageBlock", alldataDto.getPageBlock());
		model.addAttribute("startPage", alldataDto.getStartPage());
		model.addAttribute("endPage", alldataDto.getEndPage());
		model.addAttribute("pageCount", alldataDto.getPageCount());
		model.addAttribute("select_data", alldataDto.getSelect_data());
		model.addAttribute("area_m1", alldataDto.getArea_m1());
		model.addAttribute("area_m2", alldataDto.getArea_m2());

		return "Destination/mainSearch";
	}
}