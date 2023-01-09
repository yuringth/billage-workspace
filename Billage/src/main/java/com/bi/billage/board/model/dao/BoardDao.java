package com.bi.billage.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bi.billage.board.model.vo.ReportBoard;

@Repository
public class BoardDao {
	
	//휘수
	
	public int insertReport(SqlSession sqlSession, ReportBoard r) {
		
		return sqlSession.insert("boardMapper.insertBoard", r);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//=====================================휘수 구역 끝 =====================================================

}
