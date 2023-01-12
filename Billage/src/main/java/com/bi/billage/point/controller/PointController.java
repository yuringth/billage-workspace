package com.bi.billage.point.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bi.billage.point.model.service.PointService;
import com.bi.billage.point.model.vo.Point;

@Controller
public class PointController {
	
	@Autowired
	private PointService pointService;
	
	@RequestMapping("addpoint")
	public int addPoint(Point p) {
		
		
		return 0;
	}
	
	@RequestMapping("selectPoint")
	public int selectPoint(int userNo) {
		return pointService.selectPoint(userNo);
	}
}
