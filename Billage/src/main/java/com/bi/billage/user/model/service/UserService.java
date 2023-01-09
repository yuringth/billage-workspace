package com.bi.billage.user.model.service;

import com.bi.billage.user.model.vo.User;


public interface UserService {
	
	// 회원가입 서비스
	int insertUser(User u);
	
	// 로그인
	User loginUser(User u);
}
