package com.bi.billage.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.board.model.vo.ADBoard;
import com.bi.billage.board.model.vo.ReportBoard;
import com.bi.billage.board.model.vo.UsedBoard;

@Repository
public class BoardDao {
	
	//휘수
	
	public int insertReport(SqlSession sqlSession, ReportBoard r) {
		
		return sqlSession.insert("reportMapper.insertReport", r);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//=====================================휘수 구역 끝 =====================================================
	
	// 세헌
	
	
	public int insertDrawBoard(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.insert("ADBoardMapper.insertDrawBoard", b);
	}

	public ArrayList<ADBoard> selectDrawBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("ADBoardMapper.selectDrawBoardList");
	}

	public int drawIncreaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("ADBoardMapper.drawIncreaseCount", boardNo);
	}
	
	public ADBoard selectDrawBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("ADBoardMapper.selectdrawBoard", boardNo);
	}












































	
	
	
	
	
	
	
	
	
	// 유림시작
	public int insertUsedBoard(SqlSessionTemplate sqlSession, UsedBoard b) {
		return sqlSession.insert("usedMapper.insertUsedBoard", b);	
		
	}









































































































	
	
	
	// 유림끝
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////

}
