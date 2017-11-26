package QuestionBoardController;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import HomePageManagementDTO.LogoImgDTO;
import HomePageManagementService.HomePageManagementService;
import MyPageDTO.BoardAnswerDTO;
import QuestionBoardDTO.QuestionBoardDTO;
import QuestionBoardService.QuestionBoardService;
import javax.servlet.http.HttpServletRequest;



@Controller

public class QboardController {

	@Autowired
	QuestionBoardService questionBoardService;
	@Autowired
	private HomePageManagementService HomePageManagementService;
	
	public void setQuestionBoardService(QuestionBoardService questionBoardService) {
		this.questionBoardService = questionBoardService;
	}

	public void setHomePageManagementService(HomePageManagementService HomePageManagementService) {
		this.HomePageManagementService = HomePageManagementService;
	}
	
/*	int ref = 0, re_step = 0, re_level = 0;*/

	// 제목 글쓰기 폼으로 이동
	@RequestMapping(value = "QuestionBoard/qboardwrite.do", method = RequestMethod.GET)
	public String openBoardWriteform(Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		return "QuestionBoard/boardWrite";
	}
	
	// 제목글일때
		@RequestMapping(value = "QuestionBoard/qboardwritepro.do", method = RequestMethod.POST)
		public String openBoardWrite(Model mod, QuestionBoardDTO boarddto) throws Exception {
			int board_num=questionBoardService.maxboardnum(boarddto)+1;
			if (board_num==0) {
				board_num=1;
			}
			boarddto.setBoard_num(board_num);
			int i = questionBoardService.writepro(boarddto);
			if (i > 0) {
				System.out.println("DB입력성공");
			} else {
				System.out.println("DB입력실패");
			}
			
			return "redirect:/QuestionBoard/qboardlist.do";
		}
		
	// 답변글쓰기 폼으로이동
	@RequestMapping(value = "QuestionBoard/qboardreplywrite.do", method = RequestMethod.GET)
	public String openBoardreplyWriteform(String num,String boardref,String boardrestep,String boardrelevel,Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		model.addAttribute("num",num);
		model.addAttribute("boardref",boardref);
		model.addAttribute("boardrestep",boardrestep);
		model.addAttribute("boardrelevel",boardrelevel);
		return "QuestionBoard/boardreplyWrite";
	}
	// 답변글일때
	@RequestMapping(value = "QuestionBoard/qboardreplywritepro.do", method = RequestMethod.POST)
	public String openBoardreplyWrite(String num,ModelAndView mav, QuestionBoardDTO boarddto) throws Exception {
	
		System.out.println(boarddto.getRef()+""+boarddto.getRe_step()+"" + boarddto.getRe_level());
		//전체목록중 마지막글번호를 가져와 +1을 하여 글번호가 제일마지막번호 +1이 되게한다. 
		int board_num=questionBoardService.maxboardnum(boarddto)+1;
		boarddto.setBoard_num(board_num);		
		
		questionBoardService.updaterelevel(boarddto);
		
		
		boarddto.setRe_step(boarddto.getRe_step()+1);
		boarddto.setRe_level(boarddto.getRe_level()+1);
		
		int i = questionBoardService.writerepro(boarddto);
		if (i > 0) {
			System.out.println("DB입력성공");
		} else {
			System.out.println("DB입력실패");
		}
		/*List<QuestionBoardDTO> list = questionBoardService.getlist();
		mav.addObject("list", list);*/
		return "redirect:/QuestionBoard/qboardlist.do";
	}

	// 리스트출력
	@RequestMapping(value = "QuestionBoard/qboardlist.do")
	public String openBoardList(String pageNum,Model model) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		
		int currentPage=0;
		if(pageNum==null) {
			currentPage=1;
		}else {
			currentPage=Integer.parseInt(pageNum);
		} //페이지번호를 받아온다.
		int pageSize = 10;// 한 페이지의 글의 개수
		int startRow = (currentPage - 1) * pageSize + 1;// 한 페이지의 시작글 번호 => (1-1)*10+1=1이 된다.
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호 => 1*10=10이 된다.
		int count = 0;
		//페이징에 필요한 변수들을 선언한다.
		
		count=questionBoardService.getCount(); //전체 글 수를 구한다.
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		 map.put("startRow", startRow); 
	      map.put("endRow", endRow);
		List<QuestionBoardDTO> list = questionBoardService.getlist(map);
		int number = count - (currentPage - 1) * pageSize;// 글목록에 표시할 글번호
		model.addAttribute("number",number);
		model.addAttribute("list", list);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);
		model.addAttribute("currentPage",currentPage);
		return "QuestionBoard/boardList";
	}
	
	
	//마이페이지Q&A게시판리스트출력 
	@RequestMapping(value = "MyQuestionBoard/qboardlist.do")
	public String openMyBoardList(String pageNum,Model model, HttpServletRequest request) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		
		int currentPage=0;
		if(pageNum==null) {
			currentPage=1;
		}else {
			currentPage=Integer.parseInt(pageNum);
		} //페이지번호를 받아온다.
		int pageSize = 10;// 한 페이지의 글의 개수
		int startRow = (currentPage - 1) * pageSize + 1;// 한 페이지의 시작글 번호 => (1-1)*10+1=1이 된다.
		int endRow = currentPage * pageSize;// 한 페이지의 마지막 글번호 => 1*10=10이 된다.
		int count = 0;
		//페이징에 필요한 변수들을 선언한다.
	    HttpSession session = request.getSession(false);
	    String nickname = (String) session.getAttribute("nickname");
	    count=questionBoardService.getmyCount(nickname); //전체 글 수를 구한다.
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("startRow", startRow); 
	    map.put("endRow", endRow);
	    map.put("nickname", nickname);
	    
		List<QuestionBoardDTO> list = questionBoardService.getmylist(map);
		HashMap<Integer, String> hashmap = new HashMap<Integer, String>();// 그룹번호,상태값(작성자가 admin이면 1, 회원이면 0)
		HashMap<Integer, String> hashmap2 = new HashMap<Integer, String>();// 그룹번호,board_num
		for(int i=0;i<list.size();i++) {
			BoardAnswerDTO boardAnswerItem = questionBoardService.gethighwriter(list.get(i).getRef());
			
			if(boardAnswerItem.getWriter().equals("admin")) {// 관리자가 답변했을 때 -> 완료 상태
				hashmap.put(list.get(i).getRef(), "1");
				hashmap2.put(list.get(i).getRef(), ""+ boardAnswerItem.getBoard_num());
			}else {//회원이 답글을 달았을 때 -> 대기 상태
				hashmap.put(list.get(i).getRef(), "0");
				hashmap2.put(list.get(i).getRef(), ""+ boardAnswerItem.getBoard_num());
			}
		}
		
		int number = count - (currentPage - 1) * pageSize;// 글목록에 표시할 글번호
		model.addAttribute("number",number);
		model.addAttribute("complete_Re", hashmap);
		model.addAttribute("complete_Re_href", hashmap2);
		model.addAttribute("list", list);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);
		model.addAttribute("currentPage",currentPage);
		return "MyPage/myboardList";
	}

	// 상세보기
	@RequestMapping(value = "QuestionBoard/qboarddetail.do")
	public String openBoardDetail(Model mod,String num) throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		mod.addAttribute("logo", logo); // 전체목록
		
	    QuestionBoardDTO list=questionBoardService.getBoardDetail(num);
	    String s = list.getContent();
		String tmp = s.replace("<p>","");
		list.setContent(tmp.replace("</p>",""));
	    mod.addAttribute("map",list);
		return "QuestionBoard/boarddetail";
	   }
	
	//수정폼으로가기
	@RequestMapping(value="QuestionBoard/qboardModify.do", method = RequestMethod.GET) 
	public String openBoardModifyform(Model mod,String num)throws Exception {
		
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		mod.addAttribute("logo", logo); // 전체목록
		QuestionBoardDTO list=questionBoardService.getBoardDetail(num);
		//content안에 들어가는 <p>태그 없애기 
		String s = list.getContent();
		String tmp = s.replace("<p>","");
		list.setContent(tmp.replace("</p>",""));
		
		mod.addAttribute("map",list);
		return "QuestionBoard/boardmodify";
	}
	
	//수정하기
	@RequestMapping(value="QuestionBoard/qboardModify.do", method = RequestMethod.POST) 
	public String openBoardModify(Model model,QuestionBoardDTO dto,String num)throws Exception {
		/* 로고변환 */
		List<LogoImgDTO> logo = HomePageManagementService.getlogo();
		System.out.println(logo);
		model.addAttribute("logo", logo); // 전체목록
		int result=questionBoardService.articlemodify(dto);
		if (result > 0) {
			System.out.println("수정완료");
		} else {
			
			System.out.println("수정실패");
		}
		
		return "redirect:/QuestionBoard/qboardlist.do";
	}
	//삭제하기 
	@RequestMapping(value="QuestionBoard/qboardDelete.do")
	public String openBoardDelete(String num)throws Exception{
		int result=questionBoardService.articledelete(num);
		if (result > 0) {
			
			System.out.println("삭제완료");
		} else {
			
			System.out.println("삭제실패");
		}
		return "QuestionBoard/boarddelete";
	}
	
	
}
