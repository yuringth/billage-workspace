package com.bi.billage.point.model.service;

import com.bi.billage.point.model.vo.Point;

public interface PointService {

	int addPoint(Point p);
	
	int selectPoint(int userNo);
	
	int selectUserNo(String userId);
}
