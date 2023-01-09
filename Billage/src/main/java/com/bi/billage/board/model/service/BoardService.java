package com.bi.billage.board.model.service;

import java.util.ArrayList;

import com.bi.billage.board.model.vo.ADBoard;
import com.bi.billage.board.model.vo.Novel;
import com.bi.billage.board.model.vo.ReportBoard;
import com.bi.billage.board.model.vo.Serial;
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
	
	//광진 구역끝
	
	//휘수 구역
	//report
	int insertReport(ReportBoard r);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//==========================================휘수 구역 끝=




	// auction , draw board -세헌
	
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

	
	
	
	
	
	
	// 유림 시작
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 유림 끝
	
	
	
	
	
	
	
	
	
	
}
