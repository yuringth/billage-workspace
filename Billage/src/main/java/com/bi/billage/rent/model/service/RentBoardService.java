package com.bi.billage.rent.model.service;

import com.bi.billage.rent.model.vo.RentBoard;

public interface RentBoardService {

	// 대여게시글 등록
	int insertRent(RentBoard rb);
}
