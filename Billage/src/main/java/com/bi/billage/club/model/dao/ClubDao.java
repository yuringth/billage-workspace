package com.bi.billage.club.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.club.model.vo.Club;

@Repository
public class ClubDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("clubMapper.selectListCount");
	}
	
	public ArrayList<Club> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("clubMapper.selectList", null, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int clubNo) {
		return sqlSession.update("clubMapper.increaseCount", clubNo);
	}
	
	public Club selectDetailGroup(SqlSessionTemplate sqlSession, int clubNo) {
		return sqlSession.selectOne("clubMapper.selectDetailGroup", clubNo);
	}
	
	
	// 클럽 등록 
	public int insertGroup(SqlSessionTemplate sqlSession, Club Club) {
		return sqlSession.insert("clubMapper.insertGroup", Club);
	}
	
	
}
