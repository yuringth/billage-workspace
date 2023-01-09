package com.bi.billage.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.board.model.dao.BoardDao;
import com.bi.billage.board.model.vo.ADBoard;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.ReportBoard;
import com.bi.billage.board.model.vo.Serial;
import com.bi.billage.common.model.vo.PageInfo;

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
		return boardDao.insertDrawBoard(sqlSession, b);
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

	@Override
	public int selectNovelListCount() {
		// TODO Auto-generated method stub
		return boardDao.selectNovelListCount(sqlSession);
	}

	@Override
	public ArrayList<Novel> selectNovelList(PageInfo pi) {
		// TODO Auto-generated method stub
		return boardDao.selectNovelList(sqlSession, pi);
	}

	@Override
	public int selectSerialListCount() {
		// TODO Auto-generated method stub
		return boardDao.selectSerialListCount(sqlSession);
	}

	@Override
	public ArrayList<Serial> selectSerialList(PageInfo pi, int novelNo) {
		// TODO Auto-generated method stub
		return boardDao.selectSerialList(sqlSession, pi, novelNo);
	}


}
