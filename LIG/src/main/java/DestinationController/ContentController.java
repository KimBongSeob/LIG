package DestinationController;

import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.cxf.helpers.IOUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import DestinationDTO.areaDTO;
import DestinationDTO.catDTO;
import DestinationDTO.contentAreaDTO;
import DestinationDTO.contentDTO;
import DestinationDTO.contentpageDTO;
import DestinationService.AreaService;
import DestinationService.CatService;
import DestinationService.ContentAreaService;
import DestinationService.ContentService;
import net.sf.json.JSONObject;

@Controller
public class ContentController {

	@Autowired
	private ContentService contentService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private CatService catService;
	@Autowired
	private ContentAreaService contentAreaService;

	
	
	

	public void setContentAreaService(ContentAreaService contentAreaService) {
		this.contentAreaService = contentAreaService;
	}

	public void setContentService(ContentService contentService) {
		this.contentService = contentService;
	}

	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

	public void setCatService(CatService catService) {
		this.catService = catService;
	}

	@RequestMapping(value = "/area/areaSearch.do")
	public String init() throws Exception {
		return "Destination/areaSearch";
	}

	@RequestMapping(value = "/content/contentList.do")
	public void contentList(HttpServletResponse resp) throws Exception {

		// public void sidoList() throws Exception {
		List<contentDTO> list = contentService.getlist();
		JSONObject jso = new JSONObject();
		jso.put("data", list);

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());

	}

	@RequestMapping(value = "/area/areaList1.do")
	public void areaList(HttpServletResponse resp) throws Exception {

		// public void sidoList() throws Exception {
		List<areaDTO> list = areaService.getlist();
		JSONObject jso = new JSONObject();
		jso.put("data", list);

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());

	}

	@RequestMapping(value = "/area/areaList2.do", produces = "text/plain;charset=UTF-8")
	public void areaList2(HttpServletResponse resp, String select_data) throws Exception {
		resp.setContentType("text/html;charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?ServiceKey=";
		String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
		//String serviceKey = "pH%2BhcJ4mT6g4yd1O%2BDDkRn3PQ1mJkqVl99yOPA7Tj6dhpa%2FtwE091H8MSw0qipqc0edweup%2Bo2TEIDtsJUizrQ%3D%3D";
		String parameter = "";
		String addr_All = "";

		// parameter = parameter + "&" + "areaCode=1";
		// parameter = parameter + "&" + "eventStartDate=20170401";
		// parameter = parameter + "&" + "eventEndDate=20171231";
		// parameter = parameter + "&" + "pageNo=1&numOfRows=10";
		// parameter = parameter + "&" + "MobileOS=ETC";
		// parameter = parameter + "&" + "MobileApp=aa";
		// parameter = parameter + "&" + "_type=json";
		parameter = parameter + "&" + "areaCode=" + select_data;
		// parameter = parameter + "&" + "numOfRows=20";
		// parameter = parameter + "&" + "pageNo=1";
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
		String total = "" + getdata2.get("totalCount");

		parameter = "";

		parameter = parameter + "&" + "areaCode=" + select_data;
		parameter = parameter + "&" + "numOfRows=" + total;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=AppTesting";
		parameter = parameter + "&" + "_type=json";
		//
		//
		addr_All = addr + serviceKey + parameter;
		//
		// //String
		// addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?ServiceKey=rUvsIij93q8cvDMiiEWiidk4OuJxviJW3SysJhD48aIYbXRmJqrKKqVfl15sNtJwI%2BEw8lTwB3%2BNR4OVcnInhg%3D%3D&areaCode=1&eventStartDate=20170401&eventEndDate=20171231&pageNo=1&numOfRows=10&MobileOS=ETC&MobileApp=aa&_type=json";
		//
		// //String
		// addr="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+serviceKey+"&contentTypeId=12&areaCode=&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1";
		url = new URL(addr_All);
		in = url.openConnection().getInputStream();
		data = IOUtils.toString(in, "utf-8");
		in.close();
		//
		out.println(data);
		// 어차피 json 형태로 오기 때문에 jsonObject로 만들어서 보내줄 필요가 없다.

	}

	@RequestMapping(value = "/area/areaSearchPro.do", method = RequestMethod.POST)
	public void areaSearch(HttpServletResponse resp, String select_data, String area_m1, String area_m2,String pageNum, Model model)
			throws Exception {
		resp.setContentType("text/html;charset=utf-8");

		if ((!select_data.equals("")) || (!area_m1.equals("")) || (!area_m2.equals(""))) {
			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			//String serviceKey = "pH%2BhcJ4mT6g4yd1O%2BDDkRn3PQ1mJkqVl99yOPA7Tj6dhpa%2FtwE091H8MSw0qipqc0edweup%2Bo2TEIDtsJUizrQ%3D%3D";
			String parameter = "";
			String addr_All = "";
			
			if(pageNum == null) {
				pageNum = "1";
			}  
			
			int pageSize=9;
			// parameter = parameter + "&" + "areaCode=1";
			// parameter = parameter + "&" + "eventStartDate=20170401";
			// parameter = parameter + "&" + "eventEndDate=20171231";
			// parameter = parameter + "&" + "pageNo=1&numOfRows=10";
			// parameter = parameter + "&" + "MobileOS=ETC";
			// parameter = parameter + "&" + "MobileApp=aa";

			parameter = parameter + "&" + "contentTypeId=" + select_data;
			parameter = parameter + "&" + "areaCode=" + area_m1;
			parameter = parameter + "&" + "sigunguCode=" + area_m2;
			parameter = parameter + "&" + "numOfRows="+pageSize;
			// parameter = parameter + "&" + "numOfRows=10";
			parameter = parameter + "&" + "pageNo="+pageNum;
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

			int currentPage = Integer.parseInt(pageNum);//956일 경우
			if(allPage > 0 ) {
				int pageBlock = 5;
				int result = currentPage / pageBlock;
				int startPage = (result * pageBlock) + 1;
				if((currentPage % pageBlock) == 0 ) {
						startPage = startPage- pageBlock;
				}
				int endPage = startPage + pageBlock-1;
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
			}
			

			sendJson.put("data", data);
			sendJson.put("allPage", allPage);
			out.println(sendJson.toString());
		}

	}
	@RequestMapping(value = "/area/ModalareaSearchPro.do", method = RequestMethod.POST)
	public void ModalAreaSearch(HttpServletResponse resp, String select_data, String area_m1, String area_m2,String pageNum, Model model)
			throws Exception {
		resp.setContentType("text/html;charset=utf-8");

		if ((!select_data.equals("")) || (!area_m1.equals("")) || (!area_m2.equals(""))) {
			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			//String serviceKey = "pH%2BhcJ4mT6g4yd1O%2BDDkRn3PQ1mJkqVl99yOPA7Tj6dhpa%2FtwE091H8MSw0qipqc0edweup%2Bo2TEIDtsJUizrQ%3D%3D";
			
			String parameter = "";
			String addr_All = "";
			
			if(pageNum == null) {
				pageNum = "1";
			}  
			
			int pageSize=8;

			parameter = parameter + "&" + "contentTypeId=" + select_data;
			parameter = parameter + "&" + "areaCode=" + area_m1;
			parameter = parameter + "&" + "sigunguCode=" + area_m2;
			parameter = parameter + "&" + "numOfRows="+pageSize;
			parameter = parameter + "&" + "pageNo="+pageNum;
			parameter = parameter + "&" + "MobileOS=ETC";
			parameter = parameter + "&" + "MobileApp=AppTesting";
			parameter = parameter + "&" + "_type=json";

			addr_All = addr + serviceKey + parameter;
			
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

			int currentPage = Integer.parseInt(pageNum);//956일 경우
			if(allPage > 0 ) {
				int pageBlock = 5;
				int result = currentPage / pageBlock;
				int startPage = (result * pageBlock) + 1;
				if((currentPage % pageBlock) == 0 ) {
						startPage = startPage- pageBlock;
				}
				int endPage = startPage + pageBlock-1;
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
			}
			

			sendJson.put("data", data);
			sendJson.put("allPage", allPage);
			out.println(sendJson.toString());
		}

	}
	@RequestMapping(value = "/area/ModalPageAreaSearchPro", method = RequestMethod.POST)
	public void ModalPageAreaSearchPro(HttpServletResponse resp, String select_data, String area_m1, String area_m2,String pageNum, Model model)
			throws Exception {
		resp.setContentType("text/html;charset=utf-8");

		if ((!select_data.equals("")) || (!area_m1.equals("")) || (!area_m2.equals(""))) {
			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			//String serviceKey = "pH%2BhcJ4mT6g4yd1O%2BDDkRn3PQ1mJkqVl99yOPA7Tj6dhpa%2FtwE091H8MSw0qipqc0edweup%2Bo2TEIDtsJUizrQ%3D%3D";
			String parameter = "";
			String addr_All = "";
			
			if(pageNum == null) {
				pageNum = "1";
			}  
			
			int pageSize=8;
			// parameter = parameter + "&" + "areaCode=1";
			// parameter = parameter + "&" + "eventStartDate=20170401";
			// parameter = parameter + "&" + "eventEndDate=20171231";
			// parameter = parameter + "&" + "pageNo=1&numOfRows=10";
			// parameter = parameter + "&" + "MobileOS=ETC";
			// parameter = parameter + "&" + "MobileApp=aa";

			parameter = parameter + "&" + "contentTypeId=" + select_data;
			parameter = parameter + "&" + "areaCode=" + area_m1;
			parameter = parameter + "&" + "sigunguCode=" + area_m2;
			parameter = parameter + "&" + "numOfRows="+pageSize;
			// parameter = parameter + "&" + "numOfRows=10";
			parameter = parameter + "&" + "pageNo="+pageNum;
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

			int currentPage = Integer.parseInt(pageNum);//956일 경우
			if(allPage > 0 ) {
				int pageBlock = 5;
				int result = currentPage / pageBlock;
				int startPage = (result * pageBlock) + 1;
				if((currentPage % pageBlock) == 0 ) {
						startPage = startPage- pageBlock;
				}
				int endPage = startPage + pageBlock-1;
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
			}
			

			sendJson.put("data", data);
			sendJson.put("allPage", allPage);
			out.println(sendJson.toString());
		}

	}

	@RequestMapping(value = "/destination/areaSearchContent.do")
	public String areaSearchContent(HttpServletResponse resp, String contentid, HttpServletRequest request,Model model) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
		
		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
		String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
		//String serviceKey = "pH%2BhcJ4mT6g4yd1O%2BDDkRn3PQ1mJkqVl99yOPA7Tj6dhpa%2FtwE091H8MSw0qipqc0edweup%2Bo2TEIDtsJUizrQ%3D%3D";
		String parameter = "";
		String addr_All = "";

		parameter += "&contentId=" + contentid;
		parameter += "&MobileOS=ETC&MobileApp=AppTesting&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
		addr_All = addr + serviceKey + parameter;

		URL url = new URL(addr_All);
		InputStream in = url.openConnection().getInputStream();

		String data = IOUtils.toString(in, "utf-8");

		in.close();

		PrintWriter out = resp.getWriter();

		JsonParser jsonps = new JsonParser();
		JsonObject jsonopj = (JsonObject) jsonps.parse(data);
		JsonObject getdata = (JsonObject) jsonopj.get("response");
		JsonObject getdata2 = (JsonObject) getdata.get("body");
		JsonObject getdata3 = (JsonObject) getdata2.get("items");
		JsonObject item = (JsonObject) getdata3.get("item");

		Gson gson = new Gson();
		contentpageDTO contentdata = gson.fromJson(item, contentpageDTO.class);

		catDTO catdata = catService.getItem(contentdata.getCat1());
		//List<contentAreaDTO> list = contentAreaService.selectList(id); 
		
		List<contentAreaDTO> list = contentAreaService.selectList(contentid); 
		model.addAttribute("contentList",list);
		String cat = "";
		if(catdata.getName() != null) {
			cat = catdata.getName();
		}
		model.addAttribute("cat", cat);
		model.addAttribute("contentdata", contentdata);

		out.println(data);

		return "Destination/areaSearchContent";
	}
	
	@RequestMapping(value = "/contentarea/insert.do")
	public void insertContents(HttpServletResponse resp, String contentid,String area, String memberid, String nickname) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		contentAreaDTO dto = new contentAreaDTO();


		

		Timestamp time= new Timestamp(System.currentTimeMillis());
		
		dto.setContentid(contentid);
		dto.setContentval(area);
		dto.setMem_id(memberid);
		dto.setNickname(nickname);
		dto.setSdate(time);
		int count = contentAreaService.add(dto);//i
		
		
		
		
		List<contentAreaDTO> list = contentAreaService.selectList(contentid);
		
		JSONObject jso = new JSONObject();
		jso.put("data", list);
		jso.put("count", count);

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());

	}
	
	@RequestMapping(value = "/contentarea/delete.do")
	public void deleteContents(HttpServletResponse resp,String contentid, String id) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		contentAreaDTO dto = new contentAreaDTO();


		
		
		dto.setId(Integer.parseInt(id));

		int count = contentAreaService.del(dto);//i
		
		
		List<contentAreaDTO> list = contentAreaService.selectList(contentid);
		
		JSONObject jso = new JSONObject();
		jso.put("data", list);
		jso.put("count", count);

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());

	}
	

}