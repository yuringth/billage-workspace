package com.bi.billage.rent.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.rent.model.dao.RentBoardDao;
import com.bi.billage.rent.model.vo.RentBoard;

@Service
public class RentBoardServiceImpl implements RentBoardService {

	@Autowired
	private RentBoardDao rentBoardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 대여게시판 글 작성
	@Override
	public int insertRent(RentBoard rb) {
		return 0;
	}
}
