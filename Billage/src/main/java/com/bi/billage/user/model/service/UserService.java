package com.bi.billage.user.model.service;

import java.util.ArrayList;

import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.user.model.vo.User;


public interface UserService {
	
	// 회원가입 서비스
	int insertUser(User u);
	
	// 로그인
	User loginUser(User u);

	// 연재 신청 총 개수 조회
	int selectSerialRequestListCount();

	// 연재 신청 리스트 조회
	ArrayList<SerialRequest> selectSerialRequestList(PageInfo pi);

	// 연재 신청 디테일 조회
	SerialRequest selectSerialRequest(int requestNo);

	// 연재 요청 승락후 회원등급변경/연재요청상태변경
	int updateUserGrade(int userNo);
	int updateSerialRequest(int requestNo);
	
	
	
	// id중복체크
	int idCheck(String checkId);
}
