package MemberManagementController;

import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;
import HomePageManagementService.HomePageManagementService;
import MemberManagementDTO.PageRank;
import MemberManagementDTO.memManageDto;
import MemberManagementDTO.pageNumDto;
import MemberManagementService.memManageService;
import net.sf.json.JSONObject;

@Controller
public class memManageController {

	private static final int COUNT_PER_PAGE = 10;
	@Autowired
	private memManageService memManageService;
	@Autowired
	private HomePageManagementService HomePageManagementService;

	public void setMemManageService(memManageService memManageService) {
		this.memManageService = memManageService;
	}
	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}

	/* 회원리스트 String pageNum */
	@RequestMapping("/MemberManagement/index.do")
	public String openMemManageList(String searchn, String search, memManageDto memManageDto, String startNum,
			String endNum, String pageNum, Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		//ModelAndView mv = new ModelAndView("/MemberManagement/index");

		if (pageNum == null) {
			pageNum = "1";
		}
		// 검색
		if (search == null) {
			search = "";
		}
		if (searchn == null) {
			searchn = "";
		}

		// 페이징
		int pageSize = 10;// 한 페이지의 글의 개수
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;// 한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호
		int count = 0;
		int number = 0;
		List<memManageDto> list = new ArrayList<memManageDto>();

		// count = memManageService.getCount();
		pageNumDto pagenumdto = new pageNumDto();
		pagenumdto = new pageNumDto(startRow, endRow);
		// 검색 값이 없을때 리스트 불러오기
		if (search.equals("") || search == null)
			count = memManageService.getCount(); // 전체 글의 수
		else
			count = memManageService.getArticleCount(pagenumdto, Integer.parseInt(searchn), search);

		// 글이 있고
		if (count > 0) {
			if (search.equals("") || search == null) { // 검색안했을때
				list = memManageService.getlistNum(pagenumdto);
				// articleList = dbPro.getArticles(startRow, endRow);// 현재 페이지에 해당하는 글 목록
			} else { // 검색했을때
				list = memManageService.getlistNum(pagenumdto, Integer.parseInt(searchn), search);
			}
		} else {
			list = Collections.EMPTY_LIST;
		}

		number = count - (currentPage - 1) * pageSize;// 글목록에 표시할 글번호

		// 10개씩 전체목록을 불러온다
		model.addAttribute("number", number);
		model.addAttribute("list", list); // 전체목록

		model.addAttribute("count1", count); // 총 글의 갯수

		int allPage = 0;

		if (count != 0) {
			allPage = (count / pageSize);
		}
		if ((count % pageSize) != 0) {
			allPage++;
		}

		JSONObject jso = new JSONObject();
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

		/*	jso.put("pageBlock", pageBlock);
			jso.put("startPage", startPage);
			jso.put("endPage", endPage);
			jso.put("pageCount", allPage);*/
		}

		jso.put("data", list);
		jso.put("count1", count);
		return "/MemberManagement/index";
	}
	
	
	////////////////////////////////////////////////////
	//ajax 페이징
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/MemberManagement/All_Delbtn.do")
	@ResponseBody
	public String delUser(String[] tdArr, ModelMap modelMap,String searchn, String search, memManageDto memManageDto, String startNum,
			String endNum, String pageNum, Model model) throws Exception {
		ModelAndView mv = new ModelAndView("/MemberManagement/index");
		for (String data : tdArr) {
			memManageService.deleteUser(data);
		}
		List<memManageDto> list = memManageService.getlist(); //rownum에 따른 전체리스트
		/////////////////////////////
		if (pageNum == null) {
			pageNum = "1";
		}
		// 검색
		if (search == null) {
			search = "";
		}
		if (searchn == null) {
			searchn = "";
		}

		int pageSize = 10;// 한 페이지의 글의 개수
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;// 한 페이지의 시작글 번호
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호
		int count = 0;
		int number = 0;
		//List<memManageDto> list = new ArrayList<memManageDto>();

		count = memManageService.getCount();
		pageNumDto pagenumdto = new pageNumDto();
		pagenumdto = new pageNumDto(startRow, endRow);
		// 검색 값이 없을때 리스트 불러오기
		if (search.equals("") || search == null)
			count = memManageService.getCount(); // 전체 글의 수
		else
			count = memManageService.getArticleCount(pagenumdto, Integer.parseInt(searchn), search);

		// 글이 있고
		if (count > 0) {
			if (search.equals("") || search == null) { // 검색안했을때
				list = memManageService.getlistNum(pagenumdto);
				// articleList = dbPro.getArticles(startRow, endRow);// 현재 페이지에 해당하는 글 목록
			} else { // 검색했을때
				list = memManageService.getlistNum(pagenumdto, Integer.parseInt(searchn), search);
			}
		} else {
			list = Collections.EMPTY_LIST;
		}

		number = count - (currentPage - 1) * pageSize;// 글목록에 표시할 글번호

		// 10개씩 전체목록을 불러온다
		model.addAttribute("number", number);
		

		int allPage = 0;

		if (count != 0) {
			allPage = (count / pageSize);
		}
		if ((count % pageSize) != 0) {
			allPage++;
		}

		JSONObject jso = new JSONObject();
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
			jso.put("number", number);
			jso.put("pageBlock", pageBlock);
			jso.put("startPage", startPage);
			jso.put("endPage", endPage);
			jso.put("pageCount", allPage);
		}

		jso.put("data", list);
		jso.put("count1", count);
		jso.put("size", list.size());
		
		return jso.toString();
	}
	
	
	
	
	//엑셀 다운로드
	@RequestMapping(value = "/MemberManagement/pageRanks.do")
	public ModelAndView handleRequestInternal() {
		List<memManageDto> list = memManageService.getlist();
		List<PageRank> pageRanks = new ArrayList<PageRank>();

		for (int i = 0; i < list.size(); i++) {

			memManageDto dto = list.get(i);
			DateFormat simple = new SimpleDateFormat("yyyy/MM/dd");
			Date date = null;
			try {
				date = simple.parse(dto.getJumin());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pageRanks.add(new PageRank(i + 1, dto.getMem_Id(), dto.getNickName(), dto.getEmail(), date, dto.getHphone(), dto.getGender()));
		}
		return new ModelAndView("excelDownload", "pageRanks", pageRanks);
	}

}
