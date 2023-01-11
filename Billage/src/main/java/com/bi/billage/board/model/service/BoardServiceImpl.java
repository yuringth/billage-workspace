package com.bi.billage.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.board.model.dao.BoardDao;
import com.bi.billage.board.model.vo.ADBoard;
import com.bi.billage.board.model.vo.Book;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.ReportBoard;
import com.bi.billage.board.model.vo.ReviewBoard;
import com.bi.billage.board.model.vo.Serial;
import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.board.model.vo.UsedBoard;
import com.bi.billage.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired SqlSessionTemplate sqlSession;

	//신고게시판	
	@Override
	public int insertReport(ReportBoard r) {
		
		return boardDao.insertReport(sqlSession, r);
	}
	
	//신고게시판
	@Override
	public ArrayList<ReportBoard> selectReportList() {
		
		return boardDao.selectReportList(sqlSession);
	}
	
	@Override
	public ReportBoard selectReport(int rno) {
		// TODO Auto-generated method stub
		return boardDao.selectReport(sqlSession, rno);
	}


	@Override
	public int auctionIncreaseCount(int boardNo) {
		// TODO Auto-generated method stub
		return boardDao.auctionIncreaseCount(sqlSession, boardNo);
	}
	@Override
	public int drawIncreaseCount(int boardNo) {
		return boardDao.drawIncreaseCount(sqlSession, boardNo);
	}

	@Override
	public ArrayList<ADBoard> selectDrawBoardList() {
		return boardDao.selectDrawBoardList(sqlSession);
	}

	@Override
	public int insertDrawBoard(ADBoard b) {
		return boardDao.insertDrawBoard(sqlSession, b);
	}

	@Override
	public ADBoard selectDrawBoard(int boardNo) {
		return boardDao.selectDrawBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteDrawBoard(int boardNo) {
		return boardDao.deleteDrawBoard(sqlSession, boardNo);
	}

	@Override
	public int updateDrawBoard(int boardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ADBoard> selectAuctionBoardList() {
		return boardDao.selectAuctionBoardList(sqlSession);
	}

	@Override
	public int insertAuctionBoard(ADBoard b) {
		return boardDao.insertAuctionBoard(sqlSession, b);
	}

	@Override
	public ADBoard selectAuctionBoard(int boardNo) {
		return boardDao.selectAuctionBoard(sqlSession, boardNo);
	}

	@Override
	public int deleteAuctionBoard(int boardNo) {
		return boardDao.deleteAuctionBoard(sqlSession, boardNo);
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
	
	@Override
	public ArrayList<Serial> selectSerialDetail(PageInfo pi, int novelNo, String serialNo) {
		// TODO Auto-generated method stub
		return boardDao.selectSerialDetail(sqlSession, pi, novelNo, serialNo);
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

	
	
	// 리뷰 게시글의 총 개수 조회
	@Override
	public int selectListCount() {
		return boardDao.selectNovelListCount(sqlSession);
	}
	// 리뷰 게시글 리스트 조회
	@Override
	public ArrayList<ReviewBoard> selectList(PageInfo pi){
		return boardDao.selectList(sqlSession, pi);
	}
	
	
	
	// 리뷰게시판 => 글작성
	@Override
	public int insertReviewBoard(ReviewBoard b) {
		return boardDao.insertReviewBoard(sqlSession, b);
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

	
	// 리뷰게시판 => book테이블에서 책제목으로 isbn 문자열 select하기
	@Override
	public Book selectIsbn(String title) {
		
		return boardDao.selectIsbn(sqlSession, title);
	}
	
	
	
	
	
	
	@Override
	public int increaseCount(int boardNo) {
		return 0;
	}

	@Override
	public int insertSerialRequest(SerialRequest sr) {
		return boardDao.insertSerialRequest(sqlSession, sr);
	}

	



	
	
	
	
	
	


}
