package com.bi.billage.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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


public interface BoardService {
	
	
	///////////////////////
	// 게시글 조회수 증가
	int increaseCount (int boardNo);
	////////////////////////
	
	
	//광진 구역
	// 작품 총 개수 조회
	int selectNovelListCount();
	
	// 작품 리스트 조회
	ArrayList<Novel> selectNovelList(PageInfo pi);
	
	// 연재 총 개수 조회
	int selectSerialListCount();
	
	// 연재 리스트 조회
	ArrayList<Serial> selectSerialList(PageInfo pi, int novelNo);
	
	// 연재 리스트 작품 정보 조회
	Novel selectNovelInfo(int nno);
	
	// 연재 상세 조회
	Serial selectSerialDetail(int novelNo, String serialNo);
	
	// 연재신청 서비스(insert)
	int insertSerialRequest(SerialRequest sr);
	
	// 작품등록 서비스(insert)
	int insertNovel(Novel n);
	
	// 작품 추천 delete
	int novelLikeDelete(Novel novel);

	// 작품 추천 insert
	int novelLikeInsert(Novel novel);

	// 작품 추천 count
	int selectNovelLikeCount(Novel novel);
	
	// 연재 등록 서비스(insert)
	int insertSerial(Serial se, Integer novelNo);
	
	// FAQ 리스트 조회
	ArrayList<FAQ> selectFaqList(FAQ faq);
	
	//좋아요 버튼 변경
	int chnageLikeBtnNovel(Novel nv);
	
	//좋아요
	int novelLike(Novel nv);
	//취소
	int novelCancel(Novel nv);
	
	//광진 구역끝
	
	
	
	
	//휘수 구역
	//report
	int insertReport(ReportBoard r);
	
	ArrayList<ReportBoard> selectReportList();
	
	ReportBoard selectReport(int rno);
	
	int updateReportStatus(int reveiwNo);
	
	int updateReviewStatus(int reviewNo);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//==========================================휘수 구역 끝=




	// auction , draw board -세헌
	
	int drawIncreaseCount (int boardNo);
	//추첨게시글 조회
	ArrayList<ADBoard> selectDrawBoardList(PageInfo pi);
	// 추첨게시글 작성
	int insertDrawBoard(ADBoard b);
	// 추첨게시글 상세 조회
	ADBoard selectDrawBoard(int boardNo);
	// 추첨게시글 삭제
	int deleteDrawBoard(int boardNo);
	// 추첨게시글 수정
	int updateDrawBoard(int boardNo);
	
	int auctionIncreaseCount (int boardNo);
	// 경매게시글 조회
	ArrayList<ADBoard> selectAuctionBoardList(PageInfo pi);
	// 경매게시글 작성
	int insertAuctionBoard(ADBoard b);
	// 경매게시글 상세 조회
	ADBoard selectAuctionBoard(int boardNo);
	// 경매게시글 삭제
	int deleteAuctionBoard(int boardNo);
	// 경매게시글 수정
	int updateAuctionBoard(int boardNo);
	
	//추첨신청자 등록
	int insertDrawUser(ADBoard b);
	//추첨신청 취소
	int deleteDrawUser(ADBoard b);
	//추첨여부 조회
	int checkDraw(ADBoard b);
	// 추첨 당첨자 선정
	ArrayList<Integer> selectPrizeUser(int boardNo);
	// 당첨자 등록
	int insertPrizeUser(ADBoard b);
	// 추첨글의 총 적립된 포인트 조회
	int selectDrawPoint(int boardNo);
	
	//입찰
	int insertBidUser(ADBoard b);
	//입찰자 테이블에 등록
	int updatePrizeUser(ADBoard b);
	// 즉시구매
	int insertBuyer(ADBoard b);
	// 입찰 종료 테이블에 등록
	int updatePrizeEnd(int boardNo);
	
	
	
	
	
	// 유림 시작 
	
	// 중고게시판
	// 게시글의 총 개수 조회
	int selectListUsedCount();
	
	// 게시판 list 조회
	ArrayList<UsedBoard> usedBoardList(PageInfo pi);
	
	// 글작성
	int insertUsedBoard(UsedBoard b);
	
	// 조회수 증가
	int increaseUsedCount(int usedNo);
	
	// 게시글 상세 조회 => DB에서 정보 가져 오기	
	UsedBoard selectUsedBoard(int usedNo);
	
	// 게시글 삭제 
	int deleteUsedBoard(int usedNo);
	
	// 게시글 수정버튼 클릭 시 => 게시판 번호를 식별자로 DB에서 게시글 정보 select해서 가져오기
	UsedBoard selectUpdateUsedBoard(int usedNo);
	
	// 글수정
	int usedUpdate(UsedBoard b);
	
	// Top-N 분석
	ArrayList<UsedBoard> selectTopUsed();
	
	// 검색 기능 select
	int selectSearchCount(HashMap<String, String> map);
	
	// 검색 기능
	ArrayList<UsedBoard> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	
	// 리뷰게시판
	// BOOK테이블에서 책제목과 일치하는 ISBN select
	Book selectIsbn(String title);
	
	// 게시글의 총 개수 조회
	int selectListCount();
	
	// 게시글 list 조회
	ArrayList<ReviewBoard> reviewBoardList(PageInfo pi);
	
	// 글작성 => 1) 중복되는 책 있는지 확인 select : bookTitle로 조회 => 한 행이 있는지 없는지
	ReviewBoard selectBookTitle(ReviewBoard b);
	
	// 글작성 => 2) 중복 된 책 없으면 insert
	int insertReviewBoard(ReviewBoard b);

	// 글수정 => 1) 중복되는 책 있는지 확인(리뷰넘버로 책제목조회)
	ReviewBoard selectBookTitle2(ReviewBoard b);
	
	// 게시글 수정
	int updateReviewBoard(ReviewBoard b);
	
	// 조회수 증가
	int increaseReviewCount(int reviewNo);
	
	// 조회 성공 시 => DB에서 데이터를 가져옴
	ReviewBoard selectReviewBoard(int reviewNo);
	
	// 게시글 삭제
	int deleteReviewBoard(ReviewBoard b);
	
	// 좋아요 누르면 insert
	int insertReviewLike(ReviewLike r);

	
	// 댓글 list 조회
	ArrayList<ReviewReply> selectReviewReplyList(int reviewNo);
	
	// 댓글 등록(insert)
	int insertReviewReply(ReviewReply r);
	
	
	// 댓글 삭제
	int deleteReviewReply(ReviewReply r);
	
	// 댓글 수정
	int updateReviewReply(ReviewReply r);
	
	
	
	// 유림 끝
	
	
	
	
	
	
	
	
	
	
}
