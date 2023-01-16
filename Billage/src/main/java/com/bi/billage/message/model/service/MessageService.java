package com.bi.billage.message.model.service;

import java.util.ArrayList;

import com.bi.billage.message.model.vo.Message;

public interface MessageService {
	
	//쪽지 보내기
	int insertMessage(Message m);
	
	// 쪽지 리스트 조회
	ArrayList<Message> selectMessgageList(int userNo);
	
	// 쪽지 상세 조회
	Message selectMessage(int messageNo);
	
	// (club)단체 쪽지 보내기 
	int insertClubMessage(ArrayList<Message> message);
}
