package com.bi.billage.point.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PointDao {

	// 포인트 조회하는 메소드
	public int selectPoint(int userNo, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("pointMapper.selectPoint", userNo);
	}

}
