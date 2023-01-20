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
	
	// 대여서비스 
	@Override
	public int updateStatus(RentBoard rb) {
		return rentBoardDao.updateStatus(sqlSession, rb);
	}
	
	// 마이페이지 대여 목록 조회
	@Override
	public ArrayList<RentBoard> selectRentMypageList(int userNo) {
		return rentBoardDao.selectRentMypageList(sqlSession, userNo);
	}
	
	
	
	
	


}
