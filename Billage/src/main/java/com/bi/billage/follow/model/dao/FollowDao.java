package com.bi.billage.follow.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bi.billage.user.model.vo.User;
@Repository
public class FollowDao {
	
	public User selectLoginUser(SqlSession sqlSession, int userNo) {
		
		return (User)sqlSession.selectOne("followMapper.selectLoginUser", userNo);
		
	}
	
	public ArrayList<User> selectFollowingList(SqlSession sqlSession, int userNo) {
		return (ArrayList) sqlSession.selectList("followMapper.selectFollowingList", userNo);
	}
	
	public ArrayList<User> selectFollowerList1(SqlSession sqlSession, int userNo) {
		return (ArrayList) sqlSession.selectList("followMapper.selectFollowerList1", userNo);
	}
	
	public ArrayList<User> selectFollowerList2(SqlSession sqlSession, int userNo) {
		return (ArrayList) sqlSession.selectList("followMapper.selectFollowerList2", userNo);
	}

}
