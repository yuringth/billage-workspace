package com.bi.billage.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.board.model.dao.BoardDao;
import com.bi.billage.board.model.vo.ADBoard;
import com.bi.billage.board.model.vo.Book;
import com.bi.billage.board.model.vo.FAQ;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.ReportBoard;
import com.bi.billage.board.model.vo.ReviewBoard;
import com.bi.billage.board.model.vo.ReviewReply;
import com.bi.billage.board.model.vo.Serial;
import com.bi.billage.board.model.vo.SerialRequest;
import com.bi.billage.board.model.vo.UsedBoard;
import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.heart.model.vo.ReviewLike;

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
	public ArrayList<ADBoard> selectDrawBoardList(PageInfo pi) {
		return boardDao.selectDrawBoardList(sqlSession, pi);
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
	public ArrayList<ADBoard> selectAuctionBoardList(PageInfo pi) {
		return boardDao.selectAuctionBoardList(sqlSession, pi);
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
	
	
	// ============= 유림시작 ================
	
	// 중고게시판
	
	// 글작성
	@Override
	public int insertUsedBoard(UsedBoard b) {
		return boardDao.insertUsedBoard(sqlSession, b);
	}
	
	// 게시글의 총 개수 조회
	@Override
	public int selectListUsedCount() {
		return boardDao.selectListUsedCount(sqlSession);
	}

	// 게시판 list 조회
	@Override
	public ArrayList<UsedBoard> usedBoardList(PageInfo pi) {
		return boardDao.usedBoardList(sqlSession, pi);
	}

	// 조회수 증가
	@Override
	public int increaseUsedCount(int usedNo) {
		return boardDao.increaseUsedCount(sqlSession, usedNo);
	}

	// 게시글 상세 조회 => DB에서 정보 가져 오기	
	@Override
	public UsedBoard selectUsedBoard(int usedNo) {
		return boardDao.selectUsedBoard(sqlSession, usedNo);
	}

	// 게시글 삭제 
	@Override
	public int deleteUsedBoard(int usedNo) {
		return boardDao.deleteUsedBoard(sqlSession, usedNo);
	}

	// 게시글 수정버튼 클릭 시 => 게시판 번호를 식별자로 DB에서 게시글 정보 select해서 가져오기
	@Override
	public UsedBoard selectUpdateUsedBoard(int usedNo) {
		return boardDao.selectUpdateUsedBoard(sqlSession, usedNo);
	}
	
	// 글수정
	@Override
	public int usedUpdate(UsedBoard b) {
		return boardDao.usedUpdate(sqlSession, b);
	}
	
	// Top-N 분석
	@Override
	public ArrayList<UsedBoard> selectTopUsed() {
		return boardDao.selectTopUsed(sqlSession);
	}

	// 검색 기능 select
	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		return boardDao.selectSearchCount(sqlSession, map);
	}

	// 검색 기능
	// 컬럼에 따라서 달라지기에 condition ..을 넣은 hashmap을 받아야함 + 추가적으로 페이징처리
	@Override
	public ArrayList<UsedBoard> selectSearchList(HashMap<String, String> map, PageInfo pi){
		return boardDao.selectSearchList(sqlSession, map, pi);
	}
	
	
	
	// 리뷰게시판	
	
	// 게시글의 총 개수 조회
	@Override
	public int selectListCount() { // 가끔 selectNovelListCount 이걸로 변동됨. selectListCount 이것이 맞음
		return boardDao.selectListCount(sqlSession);
	}
	
	// 게시글 list 조회
	@Override
	public ArrayList<ReviewBoard> reviewBoardList(PageInfo pi){
		return boardDao.reviewBoardList(sqlSession, pi);
	}
	
	// 글작성 => 1) 중복되는 책 있는지 확인 select : bookTitle로 조회 => 한 행이 있는지 없는지
	@Override
	public ReviewBoard selectBookTitle(ReviewBoard b) {
		return boardDao.selectBookTitle(sqlSession, b);
	}

	// 글작성 => 2) 중복 된 책 없으면 insert : 글작성
	@Override
	public int insertReviewBoard(ReviewBoard b) {
		return boardDao.insertReviewBoard(sqlSession, b);
	}
	
	// 조회수 증가
	@Override
	public int increaseReviewCount(int reviewNo) {
		return boardDao.increaseReviewCount(sqlSession, reviewNo);
	}
	
	// 조회 성공 시 => DB에서 데이터를 가져옴
	@Override
	public ReviewBoard selectReviewBoard(int reviewNo) {
		return boardDao.selectReviewBoard(sqlSession, reviewNo);
	}
	
	// 게시글 삭제
	@Override
	public int deleteReviewBoard(ReviewBoard b) {
		return boardDao.deleteReviewBoard(sqlSession, b);
	}

	// 글수정 => 1) 중복되는 책 있는지 확인(리뷰넘버로 책제목조회)
	@Override
	public ReviewBoard selectBookTitle2(ReviewBoard b) {
		return boardDao.selectBookTitle2(sqlSession, b);
	}	

	// 게시글 수정
	@Override
	public int updateReviewBoard(ReviewBoard b) {
		return boardDao.updateReviewBoard(sqlSession, b);
	}
	
	// BOOK테이블에서 책제목과 일치하는 ISBN select
	@Override
	public Book selectIsbn(String title) {
		return boardDao.selectIsbn(sqlSession, title);
	}
	
	// 댓글 list 조회
	@Override
	public ArrayList<ReviewReply> selectReviewReplyList(int reviewNo) {
		return boardDao.selectReviewReplyList(sqlSession, reviewNo);
	}
	
	// 댓글 등록
	@Override
	public int insertReviewReply(ReviewReply r) {
		return boardDao.insertReviewReply(sqlSession, r);
	}
	
	// 댓글 삭제
	@Override
	public int deleteReviewReply(ReviewReply r) {
		return boardDao.deleteReviewReply(sqlSession, r);
	}
	
	// 댓글 수정
	@Override
	public int updateReviewReply(ReviewReply r) {
		return boardDao.updateReviewReply(sqlSession, r);
	}
	
	// 좋아요 누르면 insert
	@Override
	public int insertReviewLike(ReviewLike r) {
		return boardDao.insertReviewLike(sqlSession, r);
	}
	
	// 유림끝==================================================================================
	
	
	
	
	
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

	@Override
	public ArrayList<FAQ> selectFaqList(FAQ faq) {
		return boardDao.selectFaqList(sqlSession, faq);
	}

	// 경매 종료 등록
	@Override
	public int updatePrizeEnd(int boardNo) {
		return boardDao.updatePrizeEnd(sqlSession, boardNo);
	}

	@Override
	public int novelLikeDelete(Novel novel) {
		return boardDao.novelLikeDelete(sqlSession, novel);
	}

	@Override
	public int novelLikeInsert(Novel novel) {
		return boardDao.novelLikeInsert(sqlSession, novel);
	}

	@Override
	public int selectNovelLikeCount(Novel novel) {
		return boardDao.selectNovelLikeCount(sqlSession, novel);
	}

	@Override
	public int chnageLikeBtnNovel(Novel nv) {
		return boardDao.chnageLikeBtnNovel(sqlSession, nv);
	}

	@Override
	public int novelLike(Novel nv) {
		return boardDao.novelLike(sqlSession, nv);
	}

	@Override
	public int novelCancel(Novel nv) {
		return boardDao.novelCancel(sqlSession, nv);
	}

	public int updateReportStatus(int reveiwNo) {
		
		return boardDao.updateReportStatus(sqlSession, reveiwNo);
	}

	@Override
	public int updateReviewStatus(int reviewNo) {
		
		return boardDao.updateReviewStatus(sqlSession, reviewNo);
	}


	

	



	
	
	
	
	
	


}
