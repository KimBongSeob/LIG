package MyPageDAO;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import MyPageDTO.MyPageDTO;

public class MyPageDAO extends SqlSessionDaoSupport {
	
	// 개인정보조회
	public MyPageDTO getData(String string, String mem_id) {
		MyPageDTO dto = getSqlSession().selectOne(string, mem_id);
		return dto;
	}

	// 개인정보update
	public void updateData(String string, MyPageDTO dto) {
		getSqlSession().update(string, dto);

	}

	// 탈퇴시 비밀번호 확인 페이지
	public MyPageDTO confirmData(String string, String mem_id) {
		MyPageDTO dto = getSqlSession().selectOne(string, mem_id);
		return dto;
	}

	// 회원탈퇴
	public int deleteMem(String string, MyPageDTO dto) {
		int i = getSqlSession().delete(string, dto);
		return i;

	}

}