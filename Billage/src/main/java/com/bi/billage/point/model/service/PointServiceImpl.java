package com.bi.billage.point.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.point.model.dao.PointDao;
import com.bi.billage.point.model.vo.Point;

@Service
public class PointServiceImpl implements PointService{

	@Autowired
	private PointDao pointDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override // 포인트 적립, 충전, 사용, 정산 하는  메소드
	public int addPoint(Point p) {
		return pointDao.addPoint(p, sqlSession);
	}

	@Override // user VO에 넣을 포인트 조회해오는 메소드
	public int selectPoint(int userNo) {
		return pointDao.selectPoint(userNo, sqlSession);
	}
	
	

}
