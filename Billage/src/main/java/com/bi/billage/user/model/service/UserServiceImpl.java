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
	
	@Override
	public int insertUser(User u) {
		return userDao.insertUser(sqlSession, u);
	}

	@Override
	public User loginUser(User u) {
		return userDao.loginUser(sqlSession, u);
	}

}
