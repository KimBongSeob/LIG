package MyPageController;

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

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import DestinationDTO.catDTO;
import DestinationDTO.contentpageDTO;
import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;
import HomePageManagementService.HomePageManagementService;
import MyPageDTO.ScheduleSharingDTO;
import MyPageDTO.TopShareDTO;
import MyPageService.ScheduleSharingService;
import net.sf.json.JSONObject;

@Controller
public class ScheduleSharingController {
	@Autowired
	private ScheduleSharingService scheduleSharingService;
	@Autowired
	private HomePageManagementService HomePageManagementService;

	

	public void setScheduleSharingService(ScheduleSharingService scheduleSharingService) {
		this.scheduleSharingService = scheduleSharingService;
	}

	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}
	
	@RequestMapping(value = "/mypage/scheduleSharing/index.do")
	public String init(Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		return "MyPage/ScheduleSharing/index";
	}

	@RequestMapping(value = "/mypage/scheduleSharing/additems.do")
	public String add(String allValues, String sdate_value, String edate_value, String plusCount, String subject,
			String share_content, HttpServletRequest request,Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		// plusCount는 일차수의 갯수 or 테이블의 갯수

		Date sdate = Date.valueOf(sdate_value);
		Date edate = Date.valueOf(edate_value);

		String keyvalue[][] = new String[Integer.parseInt(plusCount)][5];// 테이블의 갯수 만큼 이차원 배열 생성 [테이블의갯수][여행지id갯수]

		StringTokenizer token = new StringTokenizer(allValues, ",");
		
		//List<TopShareDTO> toplist = new ArrayList<TopShareDTO>();
		int count = 0;
		int i = 0;
		int tmp = 0;
		int tmp_count = 0;
		while (token.hasMoreTokens()) {
			if (count == 0) {
				i = Integer.parseInt(token.nextToken());
				String dest_name = token.nextToken();
				String dest_id = token.nextToken();
				
				scheduleSharingService.addTop(new TopShareDTO(Integer.parseInt(dest_id),dest_name));//top_share 테이블에 insert
				
				keyvalue[(i - 1)][tmp_count++] = dest_name + "," + dest_id + "," + token.nextToken()
						+ "," + token.nextToken() + "," + token.nextToken() + "," + token.nextToken() + ","
						+ token.nextToken();
			} else {
				tmp = Integer.parseInt(token.nextToken());
				if (i < tmp) {
					i = tmp;
					tmp_count = 0;
				}
				String dest_name = token.nextToken();
				String dest_id = token.nextToken();
				
				scheduleSharingService.addTop(new TopShareDTO(Integer.parseInt(dest_id),dest_name));//top_share 테이블에 insert
				
				keyvalue[(i - 1)][tmp_count++] = dest_name + "," + dest_id + "," + token.nextToken()
						+ "," + token.nextToken() + "," + token.nextToken() + "," + token.nextToken() + ","
						+ token.nextToken();
			}
			count++;
		}
		
		
		int group_id = scheduleSharingService.selectMaxGroupId();
		group_id++;
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
		String nickname = (String) session.getAttribute("nickname");// 로그인 정보 가져오기.

		for (int j = 0; j < keyvalue.length; j++) {
			String result = "";
			int resultcount = 0;
			ScheduleSharingDTO ssDto = new ScheduleSharingDTO(0, group_id, id, nickname,0, sdate, edate, subject, share_content,
					0, 0, 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, 0, 0, 0, 0, 0, 0, 0,
					0, 0, 0, 0, 0, 0, 0, "");

			for (int k = 0; k < keyvalue[j].length; k++) {
				if (keyvalue[j][k] != null) {
					if (!keyvalue[j][k].equals("")) {
						StringTokenizer values_token = new StringTokenizer(keyvalue[j][k], ",");
						if (k == 0) {
							ssDto.setDest_name_1(values_token.nextToken());
							ssDto.setDest_id_1(Integer.parseInt(values_token.nextToken()));
							ssDto.setBasic_addr_1(values_token.nextToken());
							ssDto.setDetail_addr_1(values_token.nextToken());
							ssDto.setCode_content_1(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_area1(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_sigungu_1(Integer.parseInt(values_token.nextToken()));
						} else if (k == 1) {
							ssDto.setDest_name_2(values_token.nextToken());
							ssDto.setDest_id_2(Integer.parseInt(values_token.nextToken()));
							ssDto.setBasic_addr_2(values_token.nextToken());
							ssDto.setDetail_addr_2(values_token.nextToken());
							ssDto.setCode_content_2(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_area2(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_sigungu_2(Integer.parseInt(values_token.nextToken()));
						} else if (k == 2) {
							ssDto.setDest_name_3(values_token.nextToken());
							ssDto.setDest_id_3(Integer.parseInt(values_token.nextToken()));
							ssDto.setBasic_addr_3(values_token.nextToken());
							ssDto.setDetail_addr_3(values_token.nextToken());
							ssDto.setCode_content_3(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_area3(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_sigungu_3(Integer.parseInt(values_token.nextToken()));
						} else if (k == 3) {
							ssDto.setDest_name_4(values_token.nextToken());
							ssDto.setDest_id_4(Integer.parseInt(values_token.nextToken()));
							ssDto.setBasic_addr_4(values_token.nextToken());
							ssDto.setDetail_addr_4(values_token.nextToken());
							ssDto.setCode_content_4(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_area4(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_sigungu_4(Integer.parseInt(values_token.nextToken()));
						} else if (k == 4) {
							ssDto.setDest_name_5(values_token.nextToken());
							ssDto.setDest_id_5(Integer.parseInt(values_token.nextToken()));
							ssDto.setBasic_addr_5(values_token.nextToken());
							ssDto.setDetail_addr_5(values_token.nextToken());
							ssDto.setCode_content_5(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_area5(Integer.parseInt(values_token.nextToken()));
							ssDto.setCode_sigungu_5(Integer.parseInt(values_token.nextToken()));
						}
						ssDto.setDay_no(j + 1);
					}
				}
			}
			// 여기서 insert
			scheduleSharingService.add(ssDto);

		}

		return "MyPage/ScheduleSharing/index";
	}

	@RequestMapping(value = "/mypage/scheduleSharing/selectList.do")
	public String list(Model model, HttpServletRequest request, String pageNum) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		
		model.addAttribute("select", 1); // 일정공유 탭 선택
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
		List<Integer> grouplist = scheduleSharingService.selectMaxGroupIdList(id);
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

			/*
			 * ScheduleSharingDTO dto = new ScheduleSharingDTO(); dto.setMem_id(id);
			 * dto.setGroup_id(count);
			 */
			HashMap<String, Object> mem_gp = new HashMap<String, Object>();
			mem_gp.put("id", id);
			mem_gp.put("group_id", count);
			ScheduleSharingDTO item = scheduleSharingService.selectitem(mem_gp);
			// list의 firstimage 멤버변수를 만들고 거기에 api에서 가져온 firstimage을 넣어준다.

			contentpageDTO contentdata = new contentpageDTO();

			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			//String serviceKey = "pH%2BhcJ4mT6g4yd1O%2BDDkRn3PQ1mJkqVl99yOPA7Tj6dhpa%2FtwE091H8MSw0qipqc0edweup%2Bo2TEIDtsJUizrQ%3D%3D";
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

		/*
		*/

		model.addAttribute("itemList", list);

		return "MyPage/schedulesharinginfo";
	}

	@RequestMapping(value = "/mypage/scheduleSharing/delitem.do")
	public void delitem(Model model, HttpServletResponse resp, HttpServletRequest request, String[] group_id,
			String pageNum) throws Exception {
		resp.setContentType("text/html;charset=utf-8");
		int del_count = 0;
		for (int i = 0; i < group_id.length; i++) {
			scheduleSharingService.delitem(Integer.parseInt(group_id[i]));
			del_count++;
		}
		JSONObject jso = new JSONObject();
		jso.put("count", del_count);
		PrintWriter out = resp.getWriter();
		

		model.addAttribute("select", 1); // 일정공유 탭 선택
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
		List<Integer> grouplist = scheduleSharingService.selectMaxGroupIdList(id);
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

			HashMap<String, Object> mem_gp = new HashMap<String, Object>();
			mem_gp.put("id", id);
			mem_gp.put("group_id", count);
			ScheduleSharingDTO item = scheduleSharingService.selectitem(mem_gp);
			// list의 firstimage 멤버변수를 만들고 거기에 api에서 가져온 firstimage을 넣어준다.

			contentpageDTO contentdata = new contentpageDTO();

			String addr = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=";
			String serviceKey = "yQWiYhPhnEaI%2B5DAUX%2FU%2Fvv%2BFItmkjmSLn5YqRzCxScEuKsaj8mNvplOvN7GjhlbclqObz2s8frCaJ1v8QH3Qw%3D%3D";
			//String serviceKey = "pH%2BhcJ4mT6g4yd1O%2BDDkRn3PQ1mJkqVl99yOPA7Tj6dhpa%2FtwE091H8MSw0qipqc0edweup%2Bo2TEIDtsJUizrQ%3D%3D";
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
			
			jso.put("pageBlock", pageBlock);
			jso.put("startPage", startPage);
			jso.put("endPage", endPage);
			jso.put("pageCount", allPage);
			

			if ((endRow - startRow) > list.size()) {
				model.addAttribute("endRow", list.size());
				jso.put("endRow", list.size());
			} else {
				model.addAttribute("endRow", endRow - startRow);
				jso.put("endRow", endRow - startRow);
			}

		}
		
		

		/*
		*/

		System.out.println("del 후에 size: "+list.size());
		
		model.addAttribute("itemList", list);
		
		jso.put("itemList", list);
		
		System.out.println(jso.toString());
		out.print(jso.toString());
	}

}