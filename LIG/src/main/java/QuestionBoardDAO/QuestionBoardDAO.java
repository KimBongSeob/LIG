package QuestionBoardDAO;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import MyPageDTO.BoardAnswerDTO;
import QuestionBoardDTO.QuestionBoardDTO;
public class QuestionBoardDAO extends SqlSessionDaoSupport {
	// 제목글쓰기
	public int insertBoard(String i, QuestionBoardDTO questionBoardDTO) {
		int x = getSqlSession().insert(i, questionBoardDTO);
		return x;

	}

	// 답글쓰기
	public int insertreplyboard(String i, QuestionBoardDTO questionBoardDTO) {
		int y = getSqlSession().insert(i, questionBoardDTO);

		return y;

	}
	//전체글 수를 구하기 
	public int getarticleCount(String i) {
		int r=getSqlSession().selectOne(i);
		return r;
	}
	//마이게시판 전체글 수 구하기
	public int getmyarticleCount(String i,String nickname) {
		int r=getSqlSession().selectOne(i,nickname);
		return r;
	}
	
	//답변 확인
	public BoardAnswerDTO replyname(String i,int ref) {
		BoardAnswerDTO n=getSqlSession().selectOne(i,ref);
		return n;
	}
	//제일마지막글번호구하기
	public int maxboardnum(String i,QuestionBoardDTO questionBoardDTO) {
		int x =getSqlSession().selectOne(i,questionBoardDTO);
		return x;
	}
	
	//답글레벨값수정하기
	public void updaterelevel(String i,QuestionBoardDTO questionBoardDTO) {
		int z =getSqlSession().update(i,questionBoardDTO);
		if (z>0)
			System.out.println("업데이트 성공");
		else
			System.out.println("업데이트 실패");
	}
	// 목록보기
	public List<QuestionBoardDTO> selectList(String string,HashMap<?, ?> map) {
		List<QuestionBoardDTO> boardlist = getSqlSession().selectList(string,map);
		return boardlist;
	}
	
	// 내 Q&A목록보기
		public List<QuestionBoardDTO> selectmyList(String string,HashMap<?, ?> map) {
			List<QuestionBoardDTO> boardlist = getSqlSession().selectList(string,map);
			return boardlist;
		}

	// 상세보기
	public QuestionBoardDTO selectBoardDetail(String i,String n){
		int num=Integer.parseInt(n);
		QuestionBoardDTO result = getSqlSession().selectOne(i,num); 
		
		return result ;
	} 
	//수정하기
	public int updatearticle(String i,QuestionBoardDTO dto) throws Exception{
		
		int result=getSqlSession().update(i, dto);
		return result;
	}
	//삭제하기
	public int articledelete(String i,String n) {
		int num=Integer.parseInt(n);
		
		int result = getSqlSession().delete(i,num);
		return result;
	}
}
