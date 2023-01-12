package com.bi.billage.point.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.point.model.vo.Point;

@Repository
public class PointDao {

	// 포인트 조회하는 메소드
	public int selectPoint(int userNo, SqlSessionTemplate sqlSession) {
		if(sqlSession.selectOne("pointMapper.selectPoint", userNo) == null) {
			return 0;
		}
		return sqlSession.selectOne("pointMapper.selectPoint", userNo);
	}

	public int addPoint(Point p, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("pointMapper.addPoint", p);
		
	}

}
