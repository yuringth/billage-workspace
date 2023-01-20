package com.bi.billage.rent.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.rent.model.vo.RentBoard;

@Repository
public class RentBoardDao {
	
	// 게시글 총 개수 조회
	public int selectRentBoardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("rentMapper.selectRentBoardListCount");
	}
	
	// 게시글 리스트 조회
	public ArrayList<RentBoard> selectRentBoardList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("rentMapper.selectRentBoardList", null, rowBounds);
	}
	
	// 게시글 등록
	public int insertRentBoard(SqlSessionTemplate sqlSession, RentBoard rb) {
		return sqlSession.insert("rentMapper.insertRentBoard", rb);
	}
	
	// 게시글 상세보기
	public RentBoard detailRentBoard(SqlSessionTemplate sqlSession, int rentNo) {
		return sqlSession.selectOne("rentMapper.detailRentBoard", rentNo);
	}
	
	// 대여서비스
	public int updateStatus(SqlSessionTemplate sqlSession, RentBoard rb) {
		return sqlSession.update("rentMapper.updateStatus", rb);
	}
	
	// 마이페이지 대여 목록 조회
	public ArrayList<RentBoard> selectRentMypageList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("rentMapper.selectRentMypageList", userNo);
	}
	
}
