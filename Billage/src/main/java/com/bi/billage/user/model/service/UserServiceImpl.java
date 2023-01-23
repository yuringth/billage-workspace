package com.bi.billage.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.board.model.vo.FAQ;
import com.bi.billage.board.model.vo.Inquiry;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.club.model.vo.Club;
import com.bi.billage.common.entity.CertVo;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.user.model.dao.UserDao;
import com.bi.billage.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao userDao;
	
	// 회원가입
	@Override
	public int insertUser(User u) {
		return userDao.insertUser(sqlSession, u);
	}
	
	// 로그인
	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession, u);
	}
	
	//id 중복체크
	@Override
	public int idCheck(String checkId) {
		return userDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int selectSerialRequestListCount() {
		return userDao.selectSerialRequestListCount(sqlSession);
	}

	@Override
	public ArrayList<SerialRequest> selectSerialRequestList(PageInfo pi) {
		return userDao.selectSerialRequestList(sqlSession, pi);
	}

	@Override
	public SerialRequest selectSerialRequest(int requestNo) {
		return userDao.selectSerialRequest(sqlSession, requestNo);
	}

	@Override
	public int updateUserGrade(int userNo) {
		return userDao.updateUserGrade(sqlSession, userNo);
	}

	@Override
	public int updateSerialRequest(int requestNo) {
		return userDao.updateSerialRequest(sqlSession, requestNo);
	}

	@Override
	public int selectUserListCount() {
		return userDao.selectUserListCount(sqlSession);
	}

	@Override
	public ArrayList<User> selectUserList(PageInfo pi) {
		return userDao.selectUserList(sqlSession, pi);
	}

	@Override
	public int selectGroupListCount() {
		return userDao.selecGroupListCount(sqlSession);
	}

	@Override
	public ArrayList<Club> selectGroupList(PageInfo pi) {
		return userDao.selectGroupList(sqlSession, pi);
	}
	
	// 닉네임 중복체크
	@Override
	public int nicknameCheck(String checkNickname) {
		return userDao.nicknameCheck(sqlSession, checkNickname);
	}
	
	// 개인정보수정
	@Override
	public int updateUser(User u) {
		return userDao.updateUser(sqlSession, u);
	}
	
	@Override
	public int selectInqListCount() {
		return userDao.selectInqListCount(sqlSession);
	}

	@Override
	public ArrayList<Inquiry> selectInqList(PageInfo pi) {
		return userDao.selectInqList(sqlSession, pi);
	}

	@Override
	public int insertInquiry(Inquiry iq) {
		return userDao.insertInquiry(sqlSession, iq);

	}
	
	// 회원탈퇴
	@Override
	public int deleteUser(int userNo) {
		return userDao.deleteUser(sqlSession, userNo);
	}

	@Override
	public Inquiry selectInquiry(int inqNo) {
		return userDao.selectInquiry(sqlSession, inqNo);
	}

	@Override
	public int updateInquiry(Inquiry iq) {
		return userDao.updateInquiry(sqlSession, iq);
	}
	
	@Override
	public int selectFaqListCount() {
		return userDao.selectFaqListCount(sqlSession);
	}

	@Override
	public ArrayList<FAQ> selectFaqList(PageInfo pi) {
		return userDao.selectFaqList(sqlSession, pi);
	}

	@Override
	public int insertFaq(FAQ faq) {
		return userDao.insertFaq(sqlSession, faq);
	}

	@Override
	public int deleteFaq(FAQ faq) {
		return userDao.deleteFaq(sqlSession, faq);
	}

	@Override
	public int updateFaq(FAQ faq) {
		return userDao.updateFaq(sqlSession, faq);
	}

	@Override
	public int selectNovelListCount() {
		return userDao.selectNovelListCount(sqlSession);
	}

	@Override
	public ArrayList<Novel> selectNovelList(PageInfo pi) {
		return userDao.selectNovelList(sqlSession, pi);
	}

	@Override
	public Novel selectNovel(Integer novelNo) {
		return userDao.selectNovel(sqlSession, novelNo);
	}

	@Override
	public int updateNovel(Novel n) {
		return userDao.updateNovel(sqlSession, n);
	}

	@Override
	public User countWriteBoard(int userNo) {
		return userDao.countWriteBoard(sqlSession, userNo);
	}

	@Override
	public int updateGrade(int userNo) {
		return userDao.updateGrade(sqlSession, userNo);
	}
	
	// 인증 메일 보내기
	@Override
	public void sendMail(CertVo certVo) {
		userDao.insertSecret(sqlSession, certVo);
	}
	
	// 인증 확인
	@Override
	public boolean validate(CertVo certVo) {
		return userDao.validate(sqlSession, certVo);
	}


}
