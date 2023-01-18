package com.bi.billage.follow.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.board.model.vo.ReviewBoard;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.follow.model.dao.FollowDao;
import com.bi.billage.follow.model.vo.Follow;
import com.bi.billage.follow.model.vo.Star;
import com.bi.billage.user.model.vo.User;

@Service
public class FollowServiceImpl implements FollowService{
	
	@Autowired
	private FollowDao followDao;
	
	@Autowired SqlSessionTemplate sqlSession;

	@Override
	public User selectLoginUser(int userNo) {
		
		return followDao.selectLoginUser(sqlSession, userNo);
	}

	@Override
	public ArrayList<User> selectFollowingList(int userNo) {
		
		return followDao.selectFollowingList(sqlSession, userNo);
	}

	@Override
	public ArrayList<User> selectFollowerList1(int userNo) {
		
		return followDao.selectFollowerList1(sqlSession, userNo);
	}

	@Override
	public ArrayList<User> selectFollowerList2(int userNo) {
		
		return followDao.selectFollowerList2(sqlSession, userNo);
	}

	@Override
	public int insertFollow(Follow follow) {
		
		return followDao.insertFollow(sqlSession, follow);
	}

	@Override
	public int deleteFollow(Follow follow) {
		
		return followDao.deleteFollow(sqlSession, follow);
	}

	@Override
	public ArrayList<ReviewBoard> selectReviewList(int userNo, PageInfo pi) {
		
		return followDao.selectReviewList(sqlSession, userNo, pi);
	}

	@Override
	public User selectUser(int userNo) {
	
		return followDao.selectUser(sqlSession, userNo);
	}

	@Override
	public Star selectStar(int userNo) {
		return followDao.selectStar(sqlSession, userNo);
	}

	@Override
	public ArrayList<ReviewBoard> selectGoodReview(Follow follow) {
		
		return followDao.selectGoodReview(sqlSession, follow);
	}

	@Override
	public ArrayList<ReviewBoard> selectBadReview(Follow follow) {
		
		return followDao.selectBadReview(sqlSession, follow);
	}

	@Override
	public int selectReviewCount(int userNo) {
		
		return followDao.selectReviewCount(sqlSession, userNo);
	}

}
