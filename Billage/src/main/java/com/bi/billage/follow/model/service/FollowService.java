package com.bi.billage.follow.model.service;

import java.util.ArrayList;

import com.bi.billage.board.model.vo.ReviewBoard;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.follow.model.vo.Follow;
import com.bi.billage.follow.model.vo.Star;
import com.bi.billage.user.model.vo.User;

public interface FollowService {
	
	User selectLoginUser(int userNo);
	
	ArrayList<User> selectFollowingList(int userNo);
	
	ArrayList<User>selectFollowerList1(int userNo);
	
	ArrayList<User>selectFollowerList2(int userNo);
	
	int insertFollow(Follow follow);
	
	int deleteFollow(Follow follow);
	
	ArrayList<ReviewBoard> selectReviewList(int userNo, PageInfo pi);
	
	User selectUser (int userNo);
	
	Star selectStar (int userNo);
	
	ArrayList<ReviewBoard> selectGoodReview (Follow follow);
	
	ArrayList<ReviewBoard> selectBadReview (Follow follow);
	
	int selectReviewCount (int userNo);
}
