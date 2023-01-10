package com.bi.billage.follow.model.service;

import com.bi.billage.user.model.vo.User;

public interface FollowService {
	
	User selectLoginUser(int userNo);
}
