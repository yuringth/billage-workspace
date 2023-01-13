package com.bi.billage.message.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.message.model.vo.Message;

@Repository
public class MessageDao {

	//쪽지 전송
	public int insertMessage(Message m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("messageMapper.insertMessage", m);
	}

}
