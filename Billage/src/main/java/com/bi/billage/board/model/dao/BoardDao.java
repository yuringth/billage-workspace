package com.bi.billage.board.model.dao;

import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.board.model.vo.ADBoard;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.ReportBoard;

import com.bi.billage.board.model.vo.Serial;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.board.model.vo.UsedBoard;

@Repository
public class BoardDao {
	
	//휘수
	
	public int insertReport(SqlSession sqlSession, ReportBoard r) {
		
		return sqlSession.insert("reportMapper.insertReport", r);
	}
	
	
	public ArrayList<ReportBoard> selectReportList(SqlSession sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectReport");
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
		return sqlSession.selectOne("ADBoardMapper.selectDrawBoard", boardNo);
	}
	
	public int deleteDrawBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("ADBoardMapper.deleteDrawBoard", boardNo);
	}

	public ArrayList<ADBoard> selectAuctionBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("ADBoardMapper.selectAcutionBoardList");
	}

	public int insertAuctionBoard(SqlSessionTemplate sqlSession, ADBoard b) {
		return sqlSession.insert("ADBoardMapper.insertAuctionBoard", b);
	}

	public int auctionIncreaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("ADBoardMapper.auctionIncreaseCount", boardNo);
	}

	public ADBoard selectAuctionBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("ADBoardMapper.selectAuctionBoard", boardNo);
	}

	public int deleteAuctionBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("ADBoardMapper.deleteAuctionBoard", boardNo);
	}







































	
	
	
	
	
	
	
	
	
	// 유림시작
	public int insertUsedBoard(SqlSessionTemplate sqlSession, UsedBoard b) {
		return sqlSession.insert("usedMapper.insertUsedBoard", b);	
		
	}







































































































































































	
	
	
	// 유림끝
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////
	
	// 광진구역 시작
	
	public int selectNovelListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("novelMapper.selectNovelListCount");
	}

	public ArrayList<Novel> selectNovelList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("novelMapper.selectNovelList", null, rowBounds);
	}

	public int selectSerialListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("serialMapper.selectSerialListCount");
	}
	
	public ArrayList<Serial> selectSerialList(SqlSessionTemplate sqlSession, PageInfo pi, int novelNo) {
		int offset = (pi.getCurrentPage()- 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("serialMapper.selectSerialList", novelNo, rowBounds);
	}

	
	// 광진구역 끝

}
