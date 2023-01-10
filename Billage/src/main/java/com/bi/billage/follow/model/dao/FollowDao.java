package com.bi.billage.follow.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bi.billage.user.model.vo.User;
@Repository
public class FollowDao {
	
	public User selectLoginUser(SqlSession sqlSession, int userNo) {
		
		return (User)sqlSession.selectOne("followMapper.selectLoginUser", userNo);
		
	}

}
