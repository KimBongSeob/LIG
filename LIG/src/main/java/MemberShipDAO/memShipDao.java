package MemberShipDAO;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import MemberShipDTO.memShipDto;

public class memShipDao extends SqlSessionDaoSupport  {

	public int insertMember(String string,memShipDto dto) {
		int insertCount = getSqlSession().insert(string, dto);
		
		if (insertCount > 0) {
			System.out.println("insert ok!!");
		} else {
			System.out.println("insert fail!!");
		}
		return insertCount;
	}
	public int selectMemidCount(String string,String mem_Id) {
		int Count = getSqlSession().selectOne(string, mem_Id);
		
		if (Count > 0) {
			System.out.println("select ok!!");
		} else {
			System.out.println("select fail!!");
		}
		return Count;
	}
	public int selectnickNameCount(String string,String nickName) {
		int Count = getSqlSession().selectOne(string, nickName);
		
		if (Count > 0) {
			System.out.println("select ok!!");
		} else {
			System.out.println("select fail!!");
		}
		return Count;
	}
	

}
