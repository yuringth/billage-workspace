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
	
	//광진 구역끝
	
	
	
	
	//휘수 구역
	//report
	int insertReport(ReportBoard r);
	
	ArrayList<ReportBoard> selectReportList();
	
	ReportBoard selectReport(int rno);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//==========================================휘수 구역 끝=




	// auction , draw board -세헌
	
	int drawIncreaseCount (int boardNo);
	//추첨게시글 조회
	ArrayList<ADBoard> selectDrawBoardList();
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
	ArrayList<ADBoard> selectAuctionBoardList();
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
	
	
	// 중고 게시글의 총 개수 조회
	int selectListUsedCount();
	
	// 중고게시판 목록 조회
	ArrayList<UsedBoard> usedBoardList(PageInfo pi);
	
	// 중고게시판 작성 (insert) 
	int insertUsedBoard(UsedBoard b);
	
	
	// 중고게시글 조회수 증가 (update)
	int increaseUsedCount(int usedNo);
	// 중고게시판 상세 조회 (select)
	// select해서 가져온 값을 UsedBoard VO에 담아줘야해서 자료형은 UsedBoard로 사용
	UsedBoard selectUsedBoard(int usedNo);
	
	
	// 중고게시판 삭제 (update) 
	int deleteUsedBoard(int usedNo);
	
	// 중고게시판 => 게시판 번호를 식별자로 DB에서 select해옴
	UsedBoard selectUpdateUsedBoard(int usedNo);
	
	// 중고게시글 수정 서비스(update) =>글수정 버튼 눌렀을때
	int usedUpdate(UsedBoard b);
	
	// 중고게시판 TOP-N 분석(조회수 높은 순으로 띄우기)(select)
	ArrayList<UsedBoard> selectTopUsed();
	
	
	// 중고게시판 검색
	// 중고게시판 => 검색 기능 select
	int selectSearchCount(HashMap<String, String> map);
	
	// 컬럼에 따라서 달라지기에 condition ..을 넣은 hashmap을 받아야함 + 추가적으로 페이징처리
	ArrayList<UsedBoard> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	////////
	
	// 리뷰게시판 => book테이블에서 책제목으로 isbn 문자열 select하기
	Book selectIsbn(String title);
	
	
	// 리뷰 게시글의 총 개수 조회
	int selectListCount();
	
	// 리뷰 게시글 리스트 조회
	ArrayList<ReviewBoard> reviewBoardList(PageInfo pi);
	
	
	
	// 리뷰게시판 글작성 => 1) 책 중복되는지 확인 select : bookTitle로 조회 => 한 행이 있는지 없는지
	ReviewBoard selectBookTitle(ReviewBoard b);
	// 리뷰게시판 글작성=> 2) 중복 된 책 없으면 insert : 글작성
	int insertReviewBoard(ReviewBoard b);

	
	
	// 리뷰게시글 수정 서비스(select) => 1) 책 중복되는지 확인(리뷰넘버로 책제목조회)
	ReviewBoard selectBookTitle2(ReviewBoard b);
	// 리뷰게시글 수정 서비스(update) => 2) 책 중복되는지 확인(리뷰넘버로 책제목조회)
	int updateReviewBoard(ReviewBoard b);
	
	
	
	
	// 리뷰게시글 조회수 증가 (update)
	int increaseReviewCount(int reviewNo);
	
	// 리뷰게시판 상세 조회 (select) & 리뷰게시판 수정시 폼화면 띄울때도 사용
	ReviewBoard selectReviewBoard(int reviewNo);
	
	
	
	
	// 리뷰게시판 삭제 (update)
	// int deleteReviewBoard(int reviewNo);
	int deleteReviewBoard(ReviewBoard b);

	
	


	



	
	// 댓글 나중에......
	// 댓글 리스트 조회서비스(Ajax)(select)
	ArrayList<ReviewReply> selectReplyList(int reviewNo);


	ArrayList<ReviewReply> selectReviewReplyList(int reviewNo);
	
	// 댓글 작성 서비스(Ajax)(insert)
//	int insertReply(Reply r);
	

	// 댓글 삭제(update
//	int deleteReviewReply(int replyNo);
	int deleteReviewReply(ReviewReply r);
	
	
	
	// 유림 끝
	
	
	
	
	
	
	
	
	
	
}
