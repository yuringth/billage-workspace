package com.bi.billage.rent.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int insertRent(RentBoard rb) {
		return 0;
	}




}
