package com.bi.billage.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.user.model.vo.User;

@Repository
public class UserDao {
	
	public int insertUser(SqlSessionTemplate sqlSession, User u) {
		System.out.println(u);
		return sqlSession.insert("userMapper.insertUser", u);
	}
}
