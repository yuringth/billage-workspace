package com.bi.billage.message.model.service;

import java.util.ArrayList;

import com.bi.billage.message.model.vo.Message;

public interface MessageService {
	
	//쪽지 보내기
	int insertMessage(Message m);
	
	// 쪽지 리스트 조회
	ArrayList<Message> selectMessageList(int userNo);
	
	// 단일 쪽지 확인 처리
	int updateMessage(Message message);
	
	// (club)단체 쪽지 보내기 
	int insertClubMessage(ArrayList<Message> message);
}
