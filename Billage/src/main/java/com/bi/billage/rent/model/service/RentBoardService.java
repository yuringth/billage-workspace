package com.bi.billage.rent.model.service;

import java.util.ArrayList;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.rent.model.vo.RentBoard;

public interface RentBoardService {
	
	// 게시글 총 개수 조회
	int selectRentBoardListCount();
	
	// 게시글 리스트 조회
	ArrayList<RentBoard> selectRentBoardList(PageInfo pi);
	
	// 대여게시글 등록
	int insertRentBoard(RentBoard rb);
	
	// 대여게시글 상세조회
	RentBoard detailRentBoard(int rentNo);
	
	// 대여서비스
	int updateStatus(RentBoard rb);
}
