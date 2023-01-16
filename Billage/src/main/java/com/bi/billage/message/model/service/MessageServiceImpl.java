package com.bi.billage.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.message.model.dao.MessageDao;
import com.bi.billage.message.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//쪽지 보내기
	@Override
	public int insertMessage(Message m) {
		return messageDao.insertMessage(m, sqlSession);
	}
	
	//쪽지 리스트 조회
	@Override
	public ArrayList<Message> selectMessgageList(int userNo) {
		return null;
	}
	
	// 쪽지 상세조회
	@Override
	public Message selectMessage(int messageNo) {
		return null;
	}

	// (club)회원한테 쪽지 발송 
	@Override
	public int insertClubMessage(ArrayList<Message> message) {
		return messageDao.insertClubMessage(sqlSession, message);
	}

}
