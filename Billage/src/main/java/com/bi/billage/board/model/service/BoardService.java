package com.bi.billage.board.model.service;

import java.util.ArrayList;

import com.bi.billage.board.model.vo.ADBoard;

public interface BoardService {
	
	
	///////////////////////
	// 게시글 조회수 증가
	int increaseCount (int boardNo);
	////////////////////////
	
	//휘수 구역
	int insertReport();
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
}
