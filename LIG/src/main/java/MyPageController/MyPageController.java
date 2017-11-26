package MyPageController;

import java.text.SimpleDateFormat;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import EventDAO.EventDAO;
import EventDTO.EventDTO;
import EventDTO.MyScheduleSharingDTO;
import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;
import HomePageManagementService.HomePageManagementService;
import MemberShipDTO.memShipDto;
import MyPageDTO.MyPageDTO;
import MyPageService.MyPageService;
import ScheduleSharingDTO.ScheduleSharingDTO;
import net.sf.json.JSONObject;



@Controller
public class MyPageController {
	@Autowired
	private HomePageManagementService HomePageManagementService;

	@Autowired
	private MyPageService myPageService;
	@Autowired
	private EventDAO eventDAO;
	
	public void setMyPageService(MyPageService myPageService) {
		this.myPageService = myPageService;
	}
	
	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}

	@RequestMapping(value = "/myPage/index.do")
	public String init(Model model, HttpServletRequest request) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		
		HttpSession session = request.getSession(false);
		String mem_id = (String) session.getAttribute("mem_id");
		
		//캘린더 호출
		List<EventDTO> events = myPageService.getEvents(mem_id);
		System.out.println(events);
		model.addAttribute("events", events);
		
		return "MyPage/index";
	}
	
	//그룹 상세 일정 목록
	@RequestMapping("/MyPage/UserInfo/groupEvtDtail.do")
 	public String groupEvtDetail(Model model, HttpSession session, String group_id) throws Exception {
 		String mem_id=(String)session.getAttribute("mem_id");
 		
		List<EventDTO>  list=eventDAO.getEvtDetail(mem_id, group_id );
		EventDTO eventSubject=list.get(0);
		
		model.addAttribute("eventSubject", eventSubject);
		model.addAttribute("evtDetail", list);
		
 		return "MyPage/enventDetail";
 	}
	
	//그룹 일정 삭제 하기
	@RequestMapping(value="/MyPage/UserInfo/evtGroupDelete.do", method=RequestMethod.POST)
	public void  evtGroupDelete(@RequestParam(required=false) Integer idx, HttpSession session, HttpServletResponse response)  {
	
		try {			
			eventDAO.evtGroupDelete(idx, (String)session.getAttribute("mem_id"));
			PrintWriter out =response.getWriter();
			out.println("success");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	//일정조회에서 일정공유페이지
	@RequestMapping(value = "MyPage/mySharing.do")
public String movecontent(Model model,String group_id) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
	
	System.out.println("group_id:"+group_id);
	List <ScheduleSharingDTO> dto = myPageService.MySharing(Integer.parseInt(group_id));
	
	model.addAttribute("dto", dto);
	model.addAttribute("size", dto.size());
	
	String result = "";
	for(int i=0;i<dto.size();i++) {
		ScheduleSharingDTO item = dto.get(i);
		if(i == 0) {
			result+=(i+1)+","+item.getDest_name_1()+","+item.getDest_id_1()+","+item.getBasic_addr_1()+","+item.getDetail_addr_1()+","+item.getCode_content_1()+","+item.getCode_area1()+","+item.getCode_sigungu_1();
			if(item.getDest_id_2() != 0) {
				result+=","+(i+1)+","+item.getDest_name_2()+","+item.getDest_id_2()+","+item.getBasic_addr_2()+","+item.getDetail_addr_2()+","+item.getCode_content_2()+","+item.getCode_area2()+","+item.getCode_sigungu_2();
			}
			if(item.getDest_id_3() != 0) {
				result+=","+(i+1)+","+item.getDest_name_3()+","+item.getDest_id_3()+","+item.getBasic_addr_3()+","+item.getDetail_addr_3()+","+item.getCode_content_3()+","+item.getCode_area3()+","+item.getCode_sigungu_3();
			}
			if(item.getDest_id_4() != 0) {
				result+=","+(i+1)+","+item.getDest_name_4()+","+item.getDest_id_4()+","+item.getBasic_addr_4()+","+item.getDetail_addr_4()+","+item.getCode_content_4()+","+item.getCode_area4()+","+item.getCode_sigungu_4();
			}
			if(item.getDest_id_5() != 0) {
				result+=","+(i+1)+","+item.getDest_name_5()+","+item.getDest_id_5()+","+item.getBasic_addr_5()+","+item.getDetail_addr_5()+","+item.getCode_content_5()+","+item.getCode_area5()+","+item.getCode_sigungu_5();
			}
		}else{
			result+=","+(i+1)+","+item.getDest_name_1()+","+item.getDest_id_1()+","+item.getBasic_addr_1()+","+item.getDetail_addr_1()+","+item.getCode_content_1()+","+item.getCode_area1()+","+item.getCode_sigungu_1();
			if(item.getDest_id_2() != 0) {
				result+=","+(i+1)+","+item.getDest_name_2()+","+item.getDest_id_2()+","+item.getBasic_addr_2()+","+item.getDetail_addr_2()+","+item.getCode_content_2()+","+item.getCode_area2()+","+item.getCode_sigungu_2();
			}
			if(item.getDest_id_3() != 0) {
				result+=","+(i+1)+","+item.getDest_name_3()+","+item.getDest_id_3()+","+item.getBasic_addr_3()+","+item.getDetail_addr_3()+","+item.getCode_content_3()+","+item.getCode_area3()+","+item.getCode_sigungu_3();
			}
			if(item.getDest_id_4() != 0) {
				result+=","+(i+1)+","+item.getDest_name_4()+","+item.getDest_id_4()+","+item.getBasic_addr_4()+","+item.getDetail_addr_4()+","+item.getCode_content_4()+","+item.getCode_area4()+","+item.getCode_sigungu_4();
			}
			if(item.getDest_id_5() != 0) {
				result+=","+(i+1)+","+item.getDest_name_5()+","+item.getDest_id_5()+","+item.getBasic_addr_5()+","+item.getDetail_addr_5()+","+item.getCode_content_5()+","+item.getCode_area5()+","+item.getCode_sigungu_5();
			}
		}
		
	}
	model.addAttribute("result", result);
	return "MyPage/mySharing";
}
	
	//일정공유 페이지 ->공유하기	
	@RequestMapping(value = "/mypage/mySharing.do")
	public String add(String allValues, String sdate_value, String edate_value, String plusCount, String subject,
			String share_content, HttpServletRequest request,Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록


		Date sdate = Date.valueOf(sdate_value);
		Date edate = Date.valueOf(edate_value);

		String keyvalue[][] = new String[Integer.parseInt(plusCount)][5];

		StringTokenizer token = new StringTokenizer(allValues, ",");

		int count = 0;
		int i = 0;
		int tmp = 0;
		int tmp_count = 0;
		while (token.hasMoreTokens()) {
			if (count == 0) {
				i = Integer.parseInt(token.nextToken());
				keyvalue[(i - 1)][tmp_count++] = token.nextToken() + "," + token.nextToken() + "," + token.nextToken()
						+ "," + token.nextToken() + "," + token.nextToken() + "," + token.nextToken() + ","
						+ token.nextToken();
			} else {
				tmp = Integer.parseInt(token.nextToken());
				if (i < tmp) {
					i = tmp;
					tmp_count = 0;
				}
				keyvalue[(i - 1)][tmp_count++] = token.nextToken() + "," + token.nextToken() + "," + token.nextToken()
						+ "," + token.nextToken() + "," + token.nextToken() + "," + token.nextToken() + ","
						+ token.nextToken();
			}
			count++;
		}

		int group_id = myPageService.selectMaxGroupId();
		group_id++;
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
		String nickname = (String) session.getAttribute("nickname");// 로그인 정보 가져오기.

		for (int j = 0; j < keyvalue.length; j++) {
			String result = "";
			int resultcount = 0;
			MyScheduleSharingDTO ssDto = new MyScheduleSharingDTO(0, group_id, id, nickname,0, sdate, edate, subject, share_content,
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
			myPageService.add(ssDto);

		}

		return "MyPage/ScheduleSharing/index";
	}
	
	// 회원정보관리

		@RequestMapping(value = "/MyPage/UserInfo/member_view.do")
		public String memberview(Model model, HttpServletRequest request) throws Exception {// @RequestParam String mem_id,
			/* 로고변환 */
			List<LogoImgDTO> logo = HomePageManagementService.getlogo();
			System.out.println(logo);
			model.addAttribute("logo", logo); // 전체목록
			
			HttpSession session = request.getSession(false);
			String mem_id = (String) session.getAttribute("mem_id");
			MyPageDTO dto = myPageService.getlist(mem_id);
			model.addAttribute("dto", dto);
			return "MyPage/UserInfo/member_view";
		}

		/* @ModelAttribute MyPageDTO dto, */
		@RequestMapping(value = "/MyPage/UserInfo/modify.do")
		public String membermodify(Model model, HttpServletRequest request, String nickName, String passwd, String hphone, String email,String registration_date)
				throws Exception {
			/* 로고변환 */
			List<LogoImgDTO> logo = HomePageManagementService.getlogo();
			System.out.println(logo);
			model.addAttribute("logo", logo); // 전체목록
			
			HttpSession session = request.getSession(false);
			String mem_id = (String) session.getAttribute("mem_id");

			MyPageDTO dto = new MyPageDTO();
			dto.setMem_id(mem_id);
			dto.setNickName(nickName);
			dto.setPasswd(passwd);
			dto.setHphone(hphone);
			dto.setEmail(email);
			/*SimpleDateFormat simple = new SimpleDateFormat("yyyy/MM/dd");
			SimpleDateFormat simple_2 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date d = simple.parse(registration_date);
			
			Date date = Date.valueOf(simple_2.format(d));
			System.out.println(simple_2.format(d));
			dto.setJumin(date);		
			dto.setSub_jumin(date);	*/
			
			//String tmp_Date=simple.format(registration_date);
			//dto.setJumin(simple.parse(tmp_Date));	
			//System.out.println(dto.getEmail()+dto.getJumin()+dto.getHphone()+dto.getnickName()+dto.getPasswd());
			
			myPageService.updateMember(dto);
			
			model.addAttribute("dto", dto);
			return "MyPage/index";
		}
		
		/*@RequestMapping(value = "/MyPage/nickNameCheck.do")
		public void nickNamecheck(MyPageDTO  MyPageDTO ,String nickName, HttpServletResponse resp) throws Exception {
			System.out.println("nickName:"+nickName);
			int count = myPageService.selectnickNameCount(nickName);
			System.out.println("컨트롤러 count값:::"+count);
			JSONObject jso = new JSONObject();
			jso.put("count", count);

			System.out.println(jso.toString());
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print(jso.toString());
			
		}*/
		

		@RequestMapping(value = "/MyPage/UserInfo/delete.do")
		public String memberpasswd(Model model, HttpServletRequest request) throws Exception {
			/* 로고변환 */
			List<LogoImgDTO> logo = HomePageManagementService.getlogo();
			System.out.println(logo);
			model.addAttribute("logo", logo); // 전체목록
			
			HttpSession session = request.getSession(false);
			String mem_id = (String) session.getAttribute("mem_id");
			MyPageDTO dto = myPageService.getinfo(mem_id);
			
			model.addAttribute("dto", dto);
			return "MyPage/UserInfo/member_delete";
		}
		
		
		

		@RequestMapping(value = "/MyPage/UserInfo/deletemem.do")
		public String memberdeletemem(Model model, HttpServletRequest request, String passwd) throws Exception {
			/* 로고변환 */
			List<LogoImgDTO> logo = HomePageManagementService.getlogo();
			System.out.println(logo);
			model.addAttribute("logo", logo); // 전체목록
			
			HttpSession session = request.getSession(false);
			String mem_id = (String) session.getAttribute("mem_id");
			MyPageDTO dto = new MyPageDTO();

			dto.setMem_id(mem_id);
			dto.setPasswd(passwd);
			int i = 777;
			i = myPageService.deleteMember(dto);

			String result = "";

			if (i == 0) {				
				result = "false";

			} else {
				session.invalidate();
				return "Main/index";
			}

			model.addAttribute("dto", dto);
			model.addAttribute("memberDelResult", result);

			return "MyPage/UserInfo/member_delete";
		}
}