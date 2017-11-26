package HomePageManagementController;
import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementDTO.PageImgDTO;
import HomePageManagementService.HomePageManagementService;


@Controller
public class HomePageManagementController {
	
	@Autowired
	private HomePageManagementService HomePageManagementService;

	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}
	
	@RequestMapping(value = "/HomePageManagement/index.do")
	public String init(Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		return "HomePageManagement/index";		
	}
	
	/*로고업로드 1*/
	@RequestMapping(value = "/HomePageManagement/submitLogo1.do", method = RequestMethod.POST)
	public String submitLogo1(@RequestParam("report") MultipartFile report,Model model) throws IOException {	
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		if (report.getOriginalFilename().equals("")) {
			System.out.println("file없음");
		} else {
			uploadLogo1(report);			
		}
		return "HomePageManagement/index";
		}

	private void uploadLogo1(MultipartFile report) throws IOException, IllegalStateException {
		
		
		String o_name = report.getOriginalFilename();		
		//File realpath = new File("C://Users//user1//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//logo//" + o_name);
		File realpath = new File("C://Users//aha293//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//logo//" + o_name);	
		try {
			report.transferTo(realpath); // 임시 디렉토리에 있는 파일이 'o_name'에 저장
		} catch (Exception e) {
			e.printStackTrace();
		}		
		LogoImgDTO dto = new LogoImgDTO(report.getOriginalFilename(),realpath.getPath());
		HomePageManagementService.updateLogo1(dto);
	}
	
	/*로고업로드 2*/
	@RequestMapping(value = "/HomePageManagement/submitLogo2.do", method = RequestMethod.POST)
	public String submitLogo2(@RequestParam("report") MultipartFile report,Model model) throws IOException {	

		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		if (report.getOriginalFilename().equals("")) {
			System.out.println("file없음");
		} else {
			uploadLogo2(report);			
		}
		return "HomePageManagement/index";
		}

	private void uploadLogo2(MultipartFile report) throws IOException, IllegalStateException {
		String o_name = report.getOriginalFilename();		
		//File realpath = new File("C://Users//user1//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//logo//" + o_name);
		File realpath = new File("C://Users//aha293//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//logo//" + o_name);	
		try {
			report.transferTo(realpath); // 임시 디렉토리에 있는 파일이 'o_name'에 저장
		} catch (Exception e) {
			e.printStackTrace();
		}		
		LogoImgDTO dto = new LogoImgDTO(report.getOriginalFilename(),realpath.getPath());
		HomePageManagementService.updateLogo2(dto);
	}
	
	
	
	
	/*메인페이지 1번 롤링*/
	@RequestMapping(value = "/HomePageManagement/submitMainImg1.do", method = RequestMethod.POST)
	public String submitReport1(@RequestParam("report") MultipartFile report,Model model) throws IOException {	
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		
		if (report.getOriginalFilename().equals("")) {
			System.out.println("file없음");
		} else {
			upload1(report);			
		}
		return "HomePageManagement/index";
		}

	private void upload1(MultipartFile report) throws IOException, IllegalStateException {
		String o_name = report.getOriginalFilename();		
		//File realpath = new File("C://Users//user1//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//MainPage//" + o_name);
		File realpath = new File("C://Users//aha293//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//MainPage//" + o_name);	
		try {
			report.transferTo(realpath); // 임시 디렉토리에 있는 파일이 'o_name'에 저장
		} catch (Exception e) {
			e.printStackTrace();
		}		
		PageImgDTO dto = new PageImgDTO(report.getOriginalFilename(),realpath.getPath());
		HomePageManagementService.updateFile1(dto);
	}
	
	
	/*메인페이지 2번 롤링*/
	@RequestMapping(value = "/HomePageManagement/submitMainImg2.do", method = RequestMethod.POST)
	public String submitReport2(@RequestParam("report") MultipartFile report, Model model) throws IOException {	
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		if (report.getOriginalFilename().equals("")) {
			System.out.println("file없음");
		} else {
			upload2(report);			
		}
		return "HomePageManagement/index";
		}

	private void upload2(MultipartFile report) throws IOException, IllegalStateException {
		String o_name = report.getOriginalFilename();
		
		//File realpath = new File("C://Users//user1//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//MainPage//" + o_name);
		File realpath = new File("C://Users//aha293//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//MainPage//" + o_name);
		try {
			report.transferTo(realpath); // 임시 디렉토리에 있는 파일이 'o_name'에 저장
		} catch (Exception e) {
			e.printStackTrace();
		}		
		PageImgDTO dto = new PageImgDTO(report.getOriginalFilename(),realpath.getPath());
		HomePageManagementService.updateFile2(dto);
	}
	
	
	/*메인페이지 3번 롤링*/
	@RequestMapping(value = "/HomePageManagement/submitMainImg3.do", method = RequestMethod.POST)
	public String submitReport3(@RequestParam("report") MultipartFile report,Model model) throws IOException {	
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		if (report.getOriginalFilename().equals("")) {
			System.out.println("file없음");
		} else {
			upload3(report);			
		}
		return "HomePageManagement/index";
		}

	private void upload3(MultipartFile report) throws IOException, IllegalStateException {
		String o_name = report.getOriginalFilename();		
		//File realpath = new File("C://Users//user1//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//MainPage//" + o_name);
		File realpath = new File("C://Users//aha293//Documents//workspace-sts-3.9.0.RELEASE//LIG//WebContent//img//MainPage//" + o_name);
		try {
			report.transferTo(realpath); // 임시 디렉토리에 있는 파일이 'o_name'에 저장
		} catch (Exception e) {
			e.printStackTrace();
		}		
		PageImgDTO dto = new PageImgDTO(report.getOriginalFilename(),realpath.getPath());
		HomePageManagementService.updateFile3(dto);
	}
}




