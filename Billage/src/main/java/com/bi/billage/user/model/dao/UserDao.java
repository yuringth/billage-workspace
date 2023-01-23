package com.bi.billage.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.board.model.vo.FAQ;
import com.bi.billage.board.model.vo.Inquiry;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.common.entity.CertVo;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.club.model.vo.Club;
import com.bi.billage.user.model.vo.User;

@Repository
public class UserDao {
	
	// 회원가입
	public int insertUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.insert("userMapper.insertUser", u);
	}
	
	// 로그인
	public User loginUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.selectOne("userMapper.loginUser", u);
	}

	public int selectSerialRequestListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serialMapper.selectSerialRequestListCount");
	}

	public ArrayList<SerialRequest> selectSerialRequestList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("serialMapper.selectSerialRequestList", null, rowBounds);
	}

	public SerialRequest selectSerialRequest(SqlSessionTemplate sqlSession, int requestNo) {
		return sqlSession.selectOne("serialMapper.selectSerialRequest", requestNo);
	}

	public int updateUserGrade(SqlSessionTemplate sqlSession, Integer userNo) {
		return sqlSession.update("userMapper.updateUserGrade", userNo);
	}

	public int updateSerialRequest(SqlSessionTemplate sqlSession, Integer requestNo) {
		return sqlSession.update("serialMapper.updateSerialRequest", requestNo);
	}

	public int selectUserListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("userMapper.selectUserListCount");
	}

	public ArrayList<User> selectUserList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("userMapper.selectUserList", null, rowBounds);
	}
	
	public int selecGroupListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("userMapper.selectGroupListCount");
	}
	
	public ArrayList<Club> selectGroupList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("userMapper.selectGroupList", null, rowBounds);
	}
	
	public int selectInqListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("userMapper.selectInqListCount");
	}
	
	public ArrayList<Inquiry> selectInqList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("userMapper.selectInqList", null, rowBounds);
	}
	
	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry iq) {
		return sqlSession.insert("userMapper.insertInq", iq);
	}
	
	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, int inqNo) {
		return sqlSession.selectOne("userMapper.selectInquiry", inqNo);
	}
	
	// id 중복체크
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("userMapper.idCheck", checkId);
	}


	
	// 닉네임 중복체크
	public int nicknameCheck(SqlSessionTemplate sqlSession, String checkNickname) {
		return sqlSession.selectOne("userMapper.nicknameCheck", checkNickname);
	}
	
	// 회원정보수정
	public int updateUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.update("userMapper.updateUser", u);
	}
	
	// 회원탈퇴
	public int deleteUser(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("userMapper.deleteUser", userNo);
	}

	public int updateInquiry(SqlSessionTemplate sqlSession, Inquiry iq) {
		
//		HashMap<String, Object> map = new HashMap<>();
//		map.put("inqNo", inqNo);
//		map.put("answer", answer);
		
		return sqlSession.update("userMapper.updateInquiry", iq);
	}
	
	public int selectFaqListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("userMapper.selectFaqListCount");
	}

	public ArrayList<FAQ> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("faqMapper.selectFaqList", null, rowBounds);
	}

	public int insertFaq(SqlSessionTemplate sqlSession, FAQ faq) {
		return sqlSession.insert("faqMapper.insertFaq", faq);
	}

	public int deleteFaq(SqlSessionTemplate sqlSession, FAQ faq) {
		return sqlSession.delete("faqMapper.deleteFaq", faq);
	}

	public int updateFaq(SqlSessionTemplate sqlSession, FAQ faq) {
		return sqlSession.update("faqMapper.updateFaq", faq);
	}
	
	public int selectNovelListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("userMapper.selectNovelListCount");
	}

	public ArrayList<Novel> selectNovelList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("userMapper.selectNovelList", null, rowBounds);
	}

	public Novel selectNovel(SqlSessionTemplate sqlSession, Integer novelNo) {
		return sqlSession.selectOne("userMapper.selectNovel", novelNo);
	}

	public int updateNovel(SqlSessionTemplate sqlSession, Novel n) {
		return sqlSession.update("userMapper.updateNovel", n);
	}

	public User countWriteBoard(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("userMapper.countWriteBoard", userNo);
	}

	public int updateGrade(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("userMapper.updateGrade", userNo);
	}
	
	// 인증 메일 보내기
	public void insertSecret(SqlSessionTemplate sqlSession, CertVo certVo) {
		sqlSession.insert("userMapper.insertSecret", certVo);
	}

}
