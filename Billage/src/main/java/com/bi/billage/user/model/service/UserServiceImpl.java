package com.bi.billage.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.group.model.vo.Group;
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
	public ArrayList<Group> selectGroupList(PageInfo pi) {
		return userDao.selectGroupList(sqlSession, pi);
	}

}
