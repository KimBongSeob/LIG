package ScheduleSharingController;

import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.cxf.helpers.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ScheduleSharingDTO.ScheduleSharingDTO;
import ScheduleSharingService.ScheduleSharingService1;
import net.sf.json.JSONObject;
import DestinationDTO.areaDTO;
import DestinationDTO.contentDTO;
import DestinationDTO.contentpageDTO;
import DestinationService.AreaService;
import DestinationService.ContentService;
import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementService.HomePageManagementService;

@Controller

public class ScheduleSharingController1 {
	@Autowired
	private ContentService contentService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private ScheduleSharingService1 scheduleSharingService;
	@Autowired
	private HomePageManagementService HomePageManagementService;

	public void setScheduleSharingService(ScheduleSharingService1 scheduleSharingService) {
		this.scheduleSharingService = scheduleSharingService;
	}

	public void setContentService(ContentService contentService) {
		this.contentService = contentService;
	}

	public void setAreaService(AreaService areaService) {
		this.areaService = areaService;
	}

	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}

	// 그룹아이디로 모두 불러오기
	@RequestMapping(value = "/ScheduleSharing/PreScheduleSharingList.do")
	public String list(Model model, String pageNum) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록

		List<Integer> grouplist = scheduleSharingService.allList();
		List<ScheduleSharingDTO> list = new ArrayList<ScheduleSharingDTO>();
		if (pageNum == null) {
			pageNum = "1";
		}

		int pageSize = 8;// 한 페이지의 글의 개수
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize;// 한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호

		int allPage = 0;

		for (int i = 0; i < grouplist.size(); i++) {
			int count = grouplist.get(i);
			System.out.println("count:" + count);

			HashMap<String, Object> mem_gp = new HashMap<String, Object>();
			mem_gp.put("group_id", count);

			ScheduleSharingDTO item = scheduleSharingService.selectitem(mem_gp);

			contentpageDTO contentdata = new contentpageDTO();
			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			String parameter = "";
			String addr_All = "";
			int contentid = 0;

			if (item.getDest_id_1() != 0) {
				contentid = item.getDest_id_1();
			} else if (item.getDest_id_2() != 0) {
				contentid = item.getDest_id_2();
			} else if (item.getDest_id_3() != 0) {
				contentid = item.getDest_id_3();
			} else if (item.getDest_id_4() != 0) {
				contentid = item.getDest_id_4();
			} else if (item.getDest_id_5() != 0) {
				contentid = item.getDest_id_5();
			}

			System.out.println("contentid" + contentid);

			parameter += "&contentId=" + contentid;
			parameter += "&MobileOS=ETC&MobileApp=AppTesting&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
			addr_All = addr + serviceKey + parameter;

			URL url = new URL(addr_All);
			InputStream in = url.openConnection().getInputStream();

			String data = IOUtils.toString(in, "utf-8");

			in.close();

			JsonParser jsonps = new JsonParser();
			JsonObject jsonopj = (JsonObject) jsonps.parse(data);
			JsonObject getdata = (JsonObject) jsonopj.get("response");
			JsonObject getdata2 = (JsonObject) getdata.get("body");
			JsonObject getdata3 = (JsonObject) getdata2.get("items");
			JsonObject jsonitem = (JsonObject) getdata3.get("item");

			Gson gson = new Gson();
			contentdata = gson.fromJson(jsonitem, contentpageDTO.class);

			item.setFirstimage(contentdata.getFirstimage()); // 불러온 이미지를 넣어주고,

			list.add(item);

		}

		int allcount = grouplist.size();

		if (allcount != 0) {
			allPage = (allcount / pageSize);

		}
		if ((allcount % pageSize) != 0) {
			allPage++;
		}

		System.out.println("pagesize:" + allPage);
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

			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", allPage);

			if ((endRow - startRow) > list.size()) {
				model.addAttribute("endRow", list.size());
			} else {
				model.addAttribute("endRow", endRow - startRow);
			}
		}
		model.addAttribute("itemList", list);
		return "ScheduleSharing/ScheduleSharingList";
	}

	// 시도
	@RequestMapping(value = "/ScheduleSharing/content/contentList.do")
	public void contentList(HttpServletResponse resp) throws Exception {

		List<contentDTO> list = contentService.getlist();
		JSONObject jso = new JSONObject();
		jso.put("data", list);

		System.out.println(jso.toString());
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());

	}

	@RequestMapping(value = "/ScheduleSharing/area/areaList1.do")
	public void areaList(HttpServletResponse resp) throws Exception {

		List<areaDTO> list = areaService.getlist();
		JSONObject jso = new JSONObject();
		jso.put("data", list);

		System.out.println(jso.toString());
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());

	}

	@RequestMapping(value = "/ScheduleSharing/area/areaList2.do", produces = "text/plain;charset=UTF-8")
	public void areaList2(HttpServletResponse resp, String select_data) throws Exception {
		resp.setContentType("text/html;charset=utf-8");

		String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?=";
		String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
		String parameter = "";
		String addr_All = "";

		parameter = parameter + "&" + "areaCode=" + select_data;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=AppTesting";
		parameter = parameter + "&" + "_type=json";

		addr_All = addr + serviceKey + parameter;

		URL url = new URL(addr_All);
		InputStream in = url.openConnection().getInputStream();

		System.out.println("input");
		System.out.println(in.toString());
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
		System.out.println("카운트:" + total);

		parameter = "";

		parameter = parameter + "&" + "areaCode=" + select_data;
		parameter = parameter + "&" + "numOfRows=" + total;
		parameter = parameter + "&" + "MobileOS=ETC";
		parameter = parameter + "&" + "MobileApp=AppTesting";
		parameter = parameter + "&" + "_type=json";

		addr_All = addr + serviceKey + parameter;
		url = new URL(addr_All);
		in = url.openConnection().getInputStream();
		data = IOUtils.toString(in, "utf-8");
		in.close();
		//
		System.out.println("area1 총 결과");
		System.out.println(data);

		out.println(data);
		// 어차피 json 형태로 오기 때문에 jsonObject로 만들어서 보내줄 필요가 없다.

	}

	// 키워드 검색 결과 리스트불러오기
	@RequestMapping(value = "/ScheduleSharing/ScheduleSharingList.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String list_s(Model model, String pageNum, String searchWord) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록

		List<Integer> grouplist = scheduleSharingService.getTotalRecord(searchWord);
		List<ScheduleSharingDTO> list = new ArrayList<ScheduleSharingDTO>();

		if (pageNum == null) {
			pageNum = "1";
		}

		int pageSize = 8;// 한 페이지의 글의 개수
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize;// 한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호

		int allPage = 0;

		for (int i = startRow; i < grouplist.size(); i++) {

			int count = grouplist.get(i);

			System.out.println("group_id:" + count);

			HashMap<String, Object> mem_gp = new HashMap<String, Object>();
			mem_gp.put("searchWord", searchWord);
			mem_gp.put("group_id", count);
			ScheduleSharingDTO item = scheduleSharingService.getArticleList(mem_gp);
			// list의 firstimage 멤버변수를 만들고 거기에 api에서 가져온 firstimage을 넣어준다.

			contentpageDTO contentdata = new contentpageDTO();

			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			String parameter = "";
			String addr_All = "";
			int contentid = 0;

			if (item.getDest_id_1() != 0) {
				contentid = item.getDest_id_1();
			} else if (item.getDest_id_2() != 0) {
				contentid = item.getDest_id_2();
			} else if (item.getDest_id_3() != 0) {
				contentid = item.getDest_id_3();
			} else if (item.getDest_id_4() != 0) {
				contentid = item.getDest_id_4();
			} else if (item.getDest_id_5() != 0) {
				contentid = item.getDest_id_5();
			}

			parameter += "&contentId=" + contentid;
			parameter += "&MobileOS=ETC&MobileApp=AppTesting&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
			addr_All = addr + serviceKey + parameter;

			URL url = new URL(addr_All);
			InputStream in = url.openConnection().getInputStream();

			String data = IOUtils.toString(in, "utf-8");

			in.close();

			JsonParser jsonps = new JsonParser();
			JsonObject jsonopj = (JsonObject) jsonps.parse(data);
			JsonObject getdata = (JsonObject) jsonopj.get("response");
			JsonObject getdata2 = (JsonObject) getdata.get("body");
			JsonObject getdata3 = (JsonObject) getdata2.get("items");
			JsonObject jsonitem = (JsonObject) getdata3.get("item");

			Gson gson = new Gson();
			contentdata = gson.fromJson(jsonitem, contentpageDTO.class);

			item.setFirstimage(contentdata.getFirstimage()); // 불러온 이미지를 넣어주고,

			list.add(item);

		}

		int allcount = grouplist.size();

		if (allcount != 0) {
			allPage = (allcount / pageSize);

		}
		if ((allcount % pageSize) != 0) {
			allPage++;
		}

		System.out.println("pagesize:" + allPage);
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

			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", allPage);

			if ((endRow - startRow) > list.size()) {
				model.addAttribute("endRow", list.size());
			} else {
				model.addAttribute("endRow", endRow - startRow);
			}

		}
		model.addAttribute("itemList_a", list);

		return "ScheduleSharing/ScheduleSharingList1";
	}

	// 모든 검색 결과 리스트불러오기
	@RequestMapping(value = "/ScheduleSharing/ScheduleSharingList_all.do", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String list_a(Model model, String pageNum, String searchWord, String content_m1, String area_m1,
			String area_m2) throws Exception {

		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록

		System.out.println("word:" + searchWord + "con:" + content_m1 + "area:" + area_m1 + "area2:" + area_m2);

		HashMap<String, Object> mem_gp_c = new HashMap<String, Object>();

		if (searchWord != null) {
			if (!searchWord.equals("")) {
				mem_gp_c.put("searchWord", searchWord);
			}
		}
		if (content_m1 != null) {
			if (!content_m1.equals("")) {
				mem_gp_c.put("content_m1", content_m1);
			}
		}
		if (area_m1 != null) {
			if (!area_m1.equals("")) {
				mem_gp_c.put("area_m1", area_m1);
			}
		}
		if (area_m2 != null) {
			if (!area_m2.equals("")) {
				mem_gp_c.put("area_m2", area_m2);
			}
		}
		List<Integer> grouplist = scheduleSharingService.getTotalRecord_all(mem_gp_c);
		List<ScheduleSharingDTO> list_a = new ArrayList<ScheduleSharingDTO>();

		if (pageNum == null) {
			pageNum = "1";
		}

		int pageSize = 8;// 한 페이지의 글의 개수
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize;// 한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호

		int allPage = 0;

		for (int i = startRow; i < grouplist.size(); i++) {

			int count_c = grouplist.get(i);

			System.out.println("count??c:" + count_c);

			HashMap<String, Object> mem_gp_a = new HashMap<String, Object>();
			mem_gp_a.put("searchWord", searchWord);
			mem_gp_a.put("content_m1", content_m1);
			mem_gp_a.put("area_m1", area_m1);
			mem_gp_a.put("area_m2", area_m2);
			mem_gp_a.put("group_id", count_c);
			ScheduleSharingDTO item_a = scheduleSharingService.getArticleList(mem_gp_a);
			// list의 firstimage 멤버변수를 만들고 거기에 api에서 가져온 firstimage을 넣어준다.

			contentpageDTO contentdata = new contentpageDTO();

			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			String parameter = "";
			String addr_All = "";
			int contentid = 0;

			if (item_a.getDest_id_1() != 0) {
				contentid = item_a.getDest_id_1();
			} else if (item_a.getDest_id_2() != 0) {
				contentid = item_a.getDest_id_2();
			} else if (item_a.getDest_id_3() != 0) {
				contentid = item_a.getDest_id_3();
			} else if (item_a.getDest_id_4() != 0) {
				contentid = item_a.getDest_id_4();
			} else if (item_a.getDest_id_5() != 0) {
				contentid = item_a.getDest_id_5();
			}

			System.out.println("contentid: " + contentid);
			parameter += "&contentId=" + contentid;
			parameter += "&MobileOS=ETC&MobileApp=AppTesting&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
			addr_All = addr + serviceKey + parameter;

			URL url = new URL(addr_All);
			InputStream in = url.openConnection().getInputStream();

			String data = IOUtils.toString(in, "utf-8");

			in.close();

			JsonParser jsonps = new JsonParser();
			JsonObject jsonopj = (JsonObject) jsonps.parse(data);
			JsonObject getdata = (JsonObject) jsonopj.get("response");
			JsonObject getdata2 = (JsonObject) getdata.get("body");
			JsonObject getdata3 = (JsonObject) getdata2.get("items");
			JsonObject jsonitem = (JsonObject) getdata3.get("item");

			Gson gson = new Gson();
			contentdata = gson.fromJson(jsonitem, contentpageDTO.class);

			if (contentdata.getFirstimage() != null) {
				item_a.setFirstimage(contentdata.getFirstimage()); // 불러온 이미지를 넣어주고,
			} else {
				item_a.setFirstimage("");
			}
			list_a.add(item_a);

		}

		int allcount = grouplist.size();

		if (allcount != 0) {
			allPage = (allcount / pageSize);

		}
		if ((allcount % pageSize) != 0) {
			allPage++;
		}

		System.out.println("pagesize:" + allPage);
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

			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", allPage);

			if ((endRow - startRow) > list_a.size()) {
				model.addAttribute("endRow", list_a.size());
			} else {
				model.addAttribute("endRow", endRow - startRow);
			}

		}
		model.addAttribute("itemList_a", list_a);

		return "ScheduleSharing/ScheduleSharingList1";
	}

	// 상세페이지 불러오기
	@RequestMapping(value = "ScheduleSharing/ScheduleContent.do")
	public String contentview(Model model, int group_id) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		System.out.println("group_id:" + group_id);

		List<ScheduleSharingDTO> dto = scheduleSharingService.getdetail(group_id);

		model.addAttribute("dto", dto);
		return "ScheduleSharing/ScheduleContent";

	}
	// 일정 등록하기

	@RequestMapping(value = "ScheduleSharing/additems.do")
	public String movecontent(Model model, String group_id) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록

		System.out.println("group_id:" + group_id);
		List<ScheduleSharingDTO> dto = scheduleSharingService.movedetail(Integer.parseInt(group_id));

		model.addAttribute("dto", dto);
		model.addAttribute("size", dto.size());

		String result = "";
		for (int i = 0; i < dto.size(); i++) {
			ScheduleSharingDTO item = dto.get(i);
			if (i == 0) {
				result += (i + 1) + "," + item.getDest_name_1() + "," + item.getDest_id_1() + ","
						+ item.getBasic_addr_1() + "," + item.getDetail_addr_1() + "," + item.getCode_content_1() + ","
						+ item.getCode_area1() + "," + item.getCode_sigungu_1();
				if (item.getDest_id_2() != 0) {
					result += "," + (i + 1) + "," + item.getDest_name_2() + "," + item.getDest_id_2() + ","
							+ item.getBasic_addr_2() + "," + item.getDetail_addr_2() + "," + item.getCode_content_2()
							+ "," + item.getCode_area2() + "," + item.getCode_sigungu_2();
				}
				if (item.getDest_id_3() != 0) {
					result += "," + (i + 1) + "," + item.getDest_name_3() + "," + item.getDest_id_3() + ","
							+ item.getBasic_addr_3() + "," + item.getDetail_addr_3() + "," + item.getCode_content_3()
							+ "," + item.getCode_area3() + "," + item.getCode_sigungu_3();
				}
				if (item.getDest_id_4() != 0) {
					result += "," + (i + 1) + "," + item.getDest_name_4() + "," + item.getDest_id_4() + ","
							+ item.getBasic_addr_4() + "," + item.getDetail_addr_4() + "," + item.getCode_content_4()
							+ "," + item.getCode_area4() + "," + item.getCode_sigungu_4();
				}
				if (item.getDest_id_5() != 0) {
					result += "," + (i + 1) + "," + item.getDest_name_5() + "," + item.getDest_id_5() + ","
							+ item.getBasic_addr_5() + "," + item.getDetail_addr_5() + "," + item.getCode_content_5()
							+ "," + item.getCode_area5() + "," + item.getCode_sigungu_5();
				}
			} else {
				result += "," + (i + 1) + "," + item.getDest_name_1() + "," + item.getDest_id_1() + ","
						+ item.getBasic_addr_1() + "," + item.getDetail_addr_1() + "," + item.getCode_content_1() + ","
						+ item.getCode_area1() + "," + item.getCode_sigungu_1();
				if (item.getDest_id_2() != 0) {
					result += "," + (i + 1) + "," + item.getDest_name_2() + "," + item.getDest_id_2() + ","
							+ item.getBasic_addr_2() + "," + item.getDetail_addr_2() + "," + item.getCode_content_2()
							+ "," + item.getCode_area2() + "," + item.getCode_sigungu_2();
				}
				if (item.getDest_id_3() != 0) {
					result += "," + (i + 1) + "," + item.getDest_name_3() + "," + item.getDest_id_3() + ","
							+ item.getBasic_addr_3() + "," + item.getDetail_addr_3() + "," + item.getCode_content_3()
							+ "," + item.getCode_area3() + "," + item.getCode_sigungu_3();
				}
				if (item.getDest_id_4() != 0) {
					result += "," + (i + 1) + "," + item.getDest_name_4() + "," + item.getDest_id_4() + ","
							+ item.getBasic_addr_4() + "," + item.getDetail_addr_4() + "," + item.getCode_content_4()
							+ "," + item.getCode_area4() + "," + item.getCode_sigungu_4();
				}
				if (item.getDest_id_5() != 0) {
					result += "," + (i + 1) + "," + item.getDest_name_5() + "," + item.getDest_id_5() + ","
							+ item.getBasic_addr_5() + "," + item.getDetail_addr_5() + "," + item.getCode_content_5()
							+ "," + item.getCode_area5() + "," + item.getCode_sigungu_5();
				}
			}

		}
		model.addAttribute("result", result);
		return "ScheduleSharing/moveScheduleContent";
	}

	// 일정공유 삭제하기 - 관리자
	@RequestMapping(value = "/ScheduleSharing/scheduleSharing/delitem.do", method = { RequestMethod.GET,RequestMethod.POST })
	public String delitem(Model model, HttpServletResponse resp, HttpServletRequest request,int group_id, String pageNum)
			throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		int del_count = 0;
		
		System.out.println("컨트롤러 group_id:::" + group_id);
		del_count = scheduleSharingService.delitem(group_id);
		System.out.println("일정공유 삭제 카운트 값::: " + del_count);


		List<Integer> grouplist = scheduleSharingService.allList();
		List<ScheduleSharingDTO> list = new ArrayList<ScheduleSharingDTO>();
		if (pageNum == null) {
			pageNum = "1";
		}

		int pageSize = 8;// 한 페이지의 글의 개수
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize;// 한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호

		int allPage = 0;

		for (int i = 0; i < grouplist.size(); i++) {
			int count = grouplist.get(i);
			System.out.println("count:" + count);

			HashMap<String, Object> mem_gp = new HashMap<String, Object>();
			mem_gp.put("group_id", count);

			ScheduleSharingDTO item = scheduleSharingService.selectitem(mem_gp);

			contentpageDTO contentdata = new contentpageDTO();
			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			String parameter = "";
			String addr_All = "";
			int contentid = 0;

			if (item.getDest_id_1() != 0) {
				contentid = item.getDest_id_1();
			} else if (item.getDest_id_2() != 0) {
				contentid = item.getDest_id_2();
			} else if (item.getDest_id_3() != 0) {
				contentid = item.getDest_id_3();
			} else if (item.getDest_id_4() != 0) {
				contentid = item.getDest_id_4();
			} else if (item.getDest_id_5() != 0) {
				contentid = item.getDest_id_5();
			}

			System.out.println("contentid" + contentid);

			parameter += "&contentId=" + contentid;
			parameter += "&MobileOS=ETC&MobileApp=AppTesting&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y&_type=json";
			addr_All = addr + serviceKey + parameter;

			URL url = new URL(addr_All);
			InputStream in = url.openConnection().getInputStream();

			String data = IOUtils.toString(in, "utf-8");

			in.close();

			JsonParser jsonps = new JsonParser();
			JsonObject jsonopj = (JsonObject) jsonps.parse(data);
			JsonObject getdata = (JsonObject) jsonopj.get("response");
			JsonObject getdata2 = (JsonObject) getdata.get("body");
			JsonObject getdata3 = (JsonObject) getdata2.get("items");
			JsonObject jsonitem = (JsonObject) getdata3.get("item");

			Gson gson = new Gson();
			contentdata = gson.fromJson(jsonitem, contentpageDTO.class);

			item.setFirstimage(contentdata.getFirstimage()); // 불러온 이미지를 넣어주고,

			list.add(item);

		}

		int allcount = grouplist.size();

		if (allcount != 0) {
			allPage = (allcount / pageSize);

		}
		if ((allcount % pageSize) != 0) {
			allPage++;
		}

		System.out.println("pagesize:" + allPage);
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

			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", allPage);

			if ((endRow - startRow) > list.size()) {
				model.addAttribute("endRow", list.size());
			} else {
				model.addAttribute("endRow", endRow - startRow);
			}
		}
		model.addAttribute("itemList", list);
		return "ScheduleSharing/ScheduleSharingList";}

}
