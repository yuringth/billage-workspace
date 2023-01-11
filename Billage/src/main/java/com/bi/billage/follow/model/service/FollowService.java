package com.bi.billage.follow.model.service;

import java.util.ArrayList;

import com.bi.billage.follow.model.vo.Follow;
import com.bi.billage.user.model.vo.User;

public interface FollowService {
	
	User selectLoginUser(int userNo);
	
	ArrayList<User> selectFollowingList(int userNo);
	
	ArrayList<User>selectFollowerList1(int userNo);
	
	ArrayList<User>selectFollowerList2(int userNo);
	
	int insertFollow(Follow follow);
	
}
