package com.bi.billage.user.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.user.model.dao.UserDao;
import com.bi.billage.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public int insertUser(User u) {
		return userDao.insertUser(sqlSession, u);
	}

	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession, u);
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

}
