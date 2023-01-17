package com.bi.billage.rent.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.rent.model.dao.RentBoardDao;
import com.bi.billage.rent.model.vo.RentBoard;

@Service
public class RentBoardServiceImpl implements RentBoardService {

	@Autowired
	private RentBoardDao rentBoardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 게시글 총 개수 조회
	@Override
	public int selectRentBoardListCount() {
		return rentBoardDao.selectRentBoardListCount(sqlSession);
	}
	
	// 게시글 리스트 조회
	@Override
	public ArrayList<RentBoard> selectRentBoardList(PageInfo pi) {
		return rentBoardDao.selectRentBoardList(sqlSession, pi);
	}
	
	// 대여게시판 글 작성
	@Override
	public int insertRentBoard(RentBoard rb) {
		return rentBoardDao.insertRentBoard(sqlSession, rb);
	}
	
	// 대여게시판 상세조회
	@Override
	public RentBoard detailRentBoard(int rentNo) {
		return rentBoardDao.detailRentBoard(sqlSession, rentNo);
	}
	
	/*
	// 포인트 관련 차감, 증가
	@Transactional
	@Override
	public int updatePoint(RentBoard rb) {
		return rentBoardDao.minusPoint(sqlSession, rb) * rentBoardDao.plusPoint(sqlSession, rb);
	}
	*/
	
	


}
