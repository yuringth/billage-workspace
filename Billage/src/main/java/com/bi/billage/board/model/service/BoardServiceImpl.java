package com.bi.billage.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.board.model.dao.BoardDao;
import com.bi.billage.board.model.vo.ADBoard;
import com.bi.billage.board.model.vo.ReportBoard;
import com.bi.billage.board.model.vo.ReviewBoard;
import com.bi.billage.board.model.vo.UsedBoard;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired SqlSessionTemplate sqlSession;

	@Override
	public int insertReport(ReportBoard r) {
		
		return boardDao.insertReport(sqlSession, r);
	}

	@Override
	public int increaseCount(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ADBoard> selectDrawBoardList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertDrawBoard(ADBoard b) {
		
		return 0;
	}

	@Override
	public ADBoard selectDrawBoard(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteDrawBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateDrawBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ADBoard> selectAuctionBoardList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertAuctionBoard(ADBoard b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ADBoard selectAuctionBoard(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteAuctionBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAuctionBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//중고게시판
	@Override
	public int insertUsedBoard(UsedBoard b) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//중고게시판
	@Override
	public int increaseUsedCount(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//중고게시판
	@Override
	public UsedBoard selectUsedBoard(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	//중고게시판
	@Override
	public int deleteUsedBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	//중고게시판
	@Override
	public int updateUsedBoard(UsedBoard b) {
		// TODO Auto-generated method stub
		return 0;
	}

	//중고게시판
	@Override
	public ArrayList<UsedBoard> selectTopBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	// 리뷰게시판
	@Override
	public int insertReviewBoard(UsedBoard b) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 리뷰게시판
	@Override
	public int increaseReviewCount(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 리뷰게시판
	@Override
	public ReviewBoard selectReviewBoard(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 리뷰게시판
	@Override
	public int deleteReviewBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 리뷰게시판
	@Override
	public int updateReviewBoard(UsedBoard b) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	


}
