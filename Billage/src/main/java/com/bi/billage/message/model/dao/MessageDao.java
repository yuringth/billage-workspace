package com.bi.billage.message.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.message.model.vo.Message;

@Repository
public class MessageDao {

	//쪽지 전송
	public int insertMessage(Message m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("messageMapper.insertMessage", m);
	}
	
	//(club)쪽지 전송
	public int insertClubMessage(SqlSessionTemplate sqlSession, ArrayList<Message> message) {
		return sqlSession.insert("messageMapper.insertClubMessage", message);
	}
	
	//MessageList Select 
	public ArrayList<Message> selectMessageList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("messageMapper.selectMessageList", userNo);
	}
	
}
