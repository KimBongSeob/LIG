package QuestionBoardService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import MyPageDTO.BoardAnswerDTO;
import QuestionBoardDAO.QuestionBoardDAO;
import QuestionBoardDTO.QuestionBoardDTO;

@Component
public class QuestionBoardService {

	@Autowired
	private QuestionBoardDAO dao;

	public void setDao(QuestionBoardDAO dao) {
		this.dao = dao;
	}

	// 목록가져오기
	public List<QuestionBoardDTO> getlist(HashMap<?, ?> map) {
		List<QuestionBoardDTO> list = new ArrayList<QuestionBoardDTO>();

		try {
			list = dao.selectList("board.selectBoardlist",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}
	
	// 나의목록가져오기
	public List<QuestionBoardDTO> getmylist(HashMap<?, ?> map) {
		List<QuestionBoardDTO> list = new ArrayList<QuestionBoardDTO>();

		try {
			list = dao.selectmyList("board.selectmyBoardlist",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}

	// 제목글쓰기
	public int writepro(QuestionBoardDTO questionBoardDTO) {

		int i = 0;
		try {
			i = dao.insertBoard("board.insertBoard", questionBoardDTO);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return i;
	}

	// 답글쓰기
	public int writerepro(QuestionBoardDTO questionBoardDTO) {

		int j = 0;
		try {
			j = dao.insertreplyboard("board.insertreplyboard", questionBoardDTO);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return j;
	}
	public int getCount() {
		int r=0;
		try {
			r=dao.getarticleCount("board.getCount");
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}
	
	public int getmyCount(String nickname) {
		int r=0;
		try {
			r=dao.getmyarticleCount("board.getmyCount",nickname);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return r;
	}
	
	public BoardAnswerDTO gethighwriter(int ref) {
		BoardAnswerDTO item = dao.replyname("board.maxlevelname",ref);
		return item;
	}
	//글들중 맨마지막 번호구하기 . 
	public int maxboardnum(QuestionBoardDTO questionBoardDTO) {
		int x=0;
		try {
			x=dao.maxboardnum("board.maxboardnum",questionBoardDTO);
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return x;
	}
	
	
	
	//답글 업데이트
		public void updaterelevel(QuestionBoardDTO questionBoardDTO) {
			try {
				dao.updaterelevel("board.updaterelevelboard",questionBoardDTO);
			}catch(Exception e) {
				System.out.println(e.toString());
			}
		}
	//상세보기
	public QuestionBoardDTO getBoardDetail(String num){
		
		QuestionBoardDTO list = new QuestionBoardDTO();
		try {
			list = dao.selectBoardDetail("board.selectBoardDetail",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	//수정하기 
	public int articlemodify(QuestionBoardDTO dto) {
		int result=0;
		try {
			result=dao.updatearticle("board.updatearticle",dto);
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	//삭제하기
	public int articledelete(String num) {
		int result=0;
		try {
			result=dao.articledelete("board.deletearticle",num);
		}catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}