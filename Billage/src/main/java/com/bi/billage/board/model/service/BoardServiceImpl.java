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
	public Serial selectSerialDetail(int novelNo, String serialNo) {
		return boardDao.selectSerialDetail(sqlSession, novelNo, serialNo);
	}
	
	//중고게시판 => 글작성 시 insert
	@Override
	public int insertUsedBoard(UsedBoard b) {

		return boardDao.insertUsedBoard(sqlSession, b);
	}
	
	
	// 중고게시판 => 조회수 셀랙
	@Override
	public int selectListUsedCount() {
		return boardDao.selectListUsedCount(sqlSession);
	}

	// 중고게시판 => 목록조회
	@Override
	public ArrayList<UsedBoard> usedBoardList(PageInfo pi) {
		System.out.println("pi : imple " + pi);
		return boardDao.usedBoardList(sqlSession, pi);
	}


	
	
	// 중고게시판 조회수 증가 (update)
	@Override
	public int increaseUsedCount(int usedNo) {
		return boardDao.increaseUsedCount(sqlSession, usedNo);
	}

	//중고게시판 상세 조회 (select) => db에서 정보 들고 와서 뿌려주기
	@Override
	public UsedBoard selectUsedBoard(int usedNo) {
		return boardDao.selectUsedBoard(sqlSession, usedNo);
	}
	

	//중고게시판 => 게시글 삭제 
	@Override
	public int deleteUsedBoard(int usedNo) {
		return boardDao.deleteUsedBoard(sqlSession, usedNo);
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
		// 자꾸 selectNovelListCount 이걸로 변동되네.. 나중에 이름 바꾸기
		// 일단 selectListCount 이거임
		return boardDao.selectListCount(sqlSession);
	}
	// 리뷰 게시글 리스트 조회
	@Override
	public ArrayList<ReviewBoard> reviewBoardList(PageInfo pi){
		return boardDao.selectList(sqlSession, pi);
	}
	
	
	
	
	// 리뷰게시판 => 1) 책 중복되는지 확인 select : bookTitle로 조회 => 한 행이 있는지 없는지
	@Override
	public ReviewBoard selectBookTitle(ReviewBoard b) {
		return boardDao.selectBookTitle(sqlSession, b);
	}
	// 리뷰게시판 => 2) 중복 된 책 없으면 insert : 글작성
	@Override
	public int insertReviewBoard(ReviewBoard b) {
		return boardDao.insertReviewBoard(sqlSession, b);
	}
	

	

	// 리뷰게시판 => 조회수 증가
	@Override
	public int increaseReviewCount(int reviewNo) {
		return boardDao.increaseReviewCount(sqlSession, reviewNo);
	}
	

	// 리뷰게시판. 조회 성공 시 => db에서 데이터를 가져와야한다.
	@Override
	public ReviewBoard selectReviewBoard(int reviewNo) {
		
		return boardDao.selectReviewBoard(sqlSession, reviewNo);
	}

	
	
	// 리뷰게시판 => 게시글 삭제
//	@Override
//	public int deleteReviewBoard(int reviewNo) {
//		return boardDao.deleteReviewBoard(sqlSession, reviewNo);
//	}
	
	@Override
	public int deleteReviewBoard(ReviewBoard b) {
		return boardDao.deleteReviewBoard(sqlSession, b);
	}

	

	// 리뷰게시판 글수정 => 1) 책 중복되는지 확인(리뷰넘버로 책제목조회)
	@Override
	public ReviewBoard selectBookTitle2(ReviewBoard b) {
		return boardDao.selectBookTitle2(sqlSession, b);
	}	

	// 리뷰게시판 => 글수정
	@Override
	public int updateReviewBoard(ReviewBoard b) {
		return boardDao.updateReviewBoard(sqlSession, b);
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

	@Override
	public int insertNovel(Novel n) {
		return boardDao.insertNovel(sqlSession, n);
	}

	@Override
	public int insertSerial(Serial se, Integer novelNo) {
		return boardDao.insertSerial(sqlSession, se, novelNo);
	}
	// 추첨자 등록
	@Override
	public int insertDrawUser(ADBoard b) {
		return boardDao.insertDrawUser(sqlSession, b);
	}

	//추첨자 삭제
	@Override
	public int deleteDrawUser(ADBoard b) {
		return boardDao.deleteDrawUser(sqlSession, b);
	}
	
	//추첨 여부 조회
	@Override
	public int checkDraw(ADBoard b) {
		return boardDao.checkDraw(sqlSession, b);
	}
	// 추첨 당첨자 선정
	@Override
	public ArrayList<Integer> selectPrizeUser(int boardNo) {
		return boardDao.selectPrizeUser(sqlSession, boardNo);
	}
	
	//추첨 당첨자 등록
	@Override
	public int insertPrizeUser(ADBoard b) {
		return boardDao.insertPrizeUser(sqlSession, b);
	}
	
	// 총 적립된 응모 포인트 조회
	@Override
	public int selectDrawPoint(int boardNo) {
		return boardDao.selectDrawPoint(sqlSession, boardNo);
	}

	@Override
	public Novel selectNovelInfo(int novelNo) {
		return boardDao.selectNovelInfo(sqlSession, novelNo);
	}
	
	// 입찰
	@Override
	public int insertBidUser(ADBoard b) {
		return boardDao.insertBidUser(sqlSession, b);
	}
	
	//입찰자 테이블에 등록
	@Override
	public int updatePrizeUser(ADBoard b) {
		return boardDao.updatePrizeUser(sqlSession, b);
	}
	
	//즉시구매자 테이블에 등록
	@Override
	public int insertBuyer(ADBoard b) {
		return boardDao.insertBuyer(sqlSession, b);
	}

	
	
	



	
	
	
	
	
	


}
