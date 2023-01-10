package com.bi.billage.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
