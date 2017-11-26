package ConstantRegistrationController;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ConstantRegistrationDTO.ConstantRegistrationDTO;
import ConstantRegistrationService.ConstantRegistrationService;
import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;
import HomePageManagementService.HomePageManagementService;
import MyPageDTO.ScheduleSharingDTO;
import net.sf.json.JSONObject;


@Controller
public class ConstantRegistrationController {

	@Autowired
	private ConstantRegistrationService constantRegistrationService;
	@Autowired
	private HomePageManagementService HomePageManagementService;
	
	
	public void setConstantRegistrationInsertService(ConstantRegistrationService constantRegistrationInsertService) {
		this.constantRegistrationService = constantRegistrationInsertService;
	}
	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}

	@RequestMapping(value = "/crgistration/index.do")
	public String init(Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		
		return "ConstantRegistration/index";
	}
	
	@RequestMapping(value = "/crgistration/additems.do")
	public String add(String allValues,String sdate_value,String edate_value,String plusCount,String subject, HttpServletRequest request,Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		//plusCount는 일차수의 갯수 or 테이블의 갯수

		
		Date sdate = Date.valueOf(sdate_value);
		Date edate = Date.valueOf(edate_value);

		String keyvalue[][] = new String[Integer.parseInt(plusCount)][5];// 테이블의 갯수 만큼 이차원 배열 생성 [테이블의갯수][여행지id갯수]

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

		int group_id = constantRegistrationService.selectMaxGroupId();
		group_id++;
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("mem_id");// 로그인 정보 가져오기.
		//String nickname = (String) session.getAttribute("nickname");// 로그인 정보 가져오기.

		for (int j = 0; j < keyvalue.length; j++) {
			String result = "";
			int resultcount = 0;
			ConstantRegistrationDTO crDto = new ConstantRegistrationDTO(0, group_id, id,0, sdate, edate, subject, 
					0, 0, 0, 0, 0, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, 0, 0, 0, 0, 0, 0, 0,
					0, 0, 0, 0, 0, 0, 0, "");

			for (int k = 0; k < keyvalue[j].length; k++) {
				if (keyvalue[j][k] != null) {
					if (!keyvalue[j][k].equals("")) {
						StringTokenizer values_token = new StringTokenizer(keyvalue[j][k], ",");
						if (k == 0) {
							crDto.setDest_name_1(values_token.nextToken());
							crDto.setDest_id_1(Integer.parseInt(values_token.nextToken()));
							crDto.setBasic_addr_1(values_token.nextToken());
							crDto.setDetail_addr_1(values_token.nextToken());
							crDto.setCode_content_1(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_area1(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_sigungu_1(Integer.parseInt(values_token.nextToken()));
						} else if (k == 1) {
							crDto.setDest_name_2(values_token.nextToken());
							crDto.setDest_id_2(Integer.parseInt(values_token.nextToken()));
							crDto.setBasic_addr_2(values_token.nextToken());
							crDto.setDetail_addr_2(values_token.nextToken());
							crDto.setCode_content_2(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_area2(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_sigungu_2(Integer.parseInt(values_token.nextToken()));
						} else if (k == 2) {
							crDto.setDest_name_3(values_token.nextToken());
							crDto.setDest_id_3(Integer.parseInt(values_token.nextToken()));
							crDto.setBasic_addr_3(values_token.nextToken());
							crDto.setDetail_addr_3(values_token.nextToken());
							crDto.setCode_content_3(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_area3(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_sigungu_3(Integer.parseInt(values_token.nextToken()));
						} else if (k == 3) {
							crDto.setDest_name_4(values_token.nextToken());
							crDto.setDest_id_4(Integer.parseInt(values_token.nextToken()));
							crDto.setBasic_addr_4(values_token.nextToken());
							crDto.setDetail_addr_4(values_token.nextToken());
							crDto.setCode_content_4(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_area4(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_sigungu_4(Integer.parseInt(values_token.nextToken()));
						} else if (k == 4) {
							crDto.setDest_name_5(values_token.nextToken());
							crDto.setDest_id_5(Integer.parseInt(values_token.nextToken()));
							crDto.setBasic_addr_5(values_token.nextToken());
							crDto.setDetail_addr_5(values_token.nextToken());
							crDto.setCode_content_5(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_area5(Integer.parseInt(values_token.nextToken()));
							crDto.setCode_sigungu_5(Integer.parseInt(values_token.nextToken()));
						}
						crDto.setDay_no(j + 1);
					}
				}
			}
			// 여기서 insert
			//System.out.println("내용:"+crDto.getGroup_id()+crDto.getMem_id()+crDto.getSubject()+crDto.getDay_no()+crDto.getStart_date()+crDto.getEnd_date()+crDto.getDest_id_1()+crDto.getDest_name_1()+crDto.getBasic_addr_1()+crDto.getDetail_addr_1()+crDto.getCode_content_1()+crDto.getCode_area1()+crDto.getCode_sigungu_1());
			constantRegistrationService.add(crDto);

		}

		return "ConstantRegistration/index";
	}
}